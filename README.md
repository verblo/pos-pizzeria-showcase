<div align="center">

# POS Pizzeria

### Modern Real-Time Point of Sale & Kitchen Display System (KDS) for Artisanal Pizzerias

[![React](https://img.shields.io/badge/React-19.x-61DAFB?style=for-the-badge&logo=react&logoColor=black)](https://react.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-20%2B-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/)
[![Express.js](https://img.shields.io/badge/Express.js-4.x-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![Socket.IO](https://img.shields.io/badge/Socket.IO-4.x_Real--Time-010101?style=for-the-badge&logo=socketdotio&logoColor=white)](https://socket.io/)
[![Material UI](https://img.shields.io/badge/Material_UI-7.x-007FFF?style=for-the-badge&logo=mui&logoColor=white)](https://mui.com/)
[![SQLite](https://img.shields.io/badge/SQLite-WAL_Mode-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.sqlite.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

<br/>

**[🇵🇱 Przejdź do polskiej wersji (Polish README)](README.pl.md)**

<br/><br/>

<div align="center">
  <img src="docs/screenshots/pos_demo.gif" alt="POS Pizzeria Real-time Workflow Demo" width="95%" style="border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.25);" />
  <p><em>Real-Time Pizzeria Pipeline: Waiter Cashier POS Terminal ➔ Kitchen KDS Queue ➔ Multi-Deck Oven Tracking</em></p>
</div>

</div>

> [!NOTE]
> ### 🏛️ System Showcase & Architecture Overview
> This repository serves as a **portfolio and architectural showcase** containing high-level system designs, database schemas, interactive visual previews, configuration models, and engineering specifications.
> Full commercial production source code is available to technical recruiters upon request (see below).

---

## 📌 Executive Summary

**POS Pizzeria** is an end-to-end, high-throughput Point of Sale and Kitchen Display System engineered specifically for fast-paced Italian pizzerias and high-volume delivery restaurants.

Traditional restaurant POS solutions struggle with the unique complexities of pizza operations: split half-and-half compositions, granular ingredient additions/subtractions, dynamic multi-tier pricing, and strict oven timing synchronization. 

This platform bridges order creation at the front counter with real-time WebSocket event dispatching to dedicated touch interfaces:
1. **Cashier / Waiter Order Terminal (`/`)**: Lightning-fast order builder with custom ingredient matrices, size toggles, custom composition calculators, and delivery address parsing.
2. **Kitchen Display System KDS (`/kuchnia`)**: Drag-and-drop order queue with visual timers, color-coded modifier pills, and multi-station staging.
3. **Oven Station Tracker (`/piec`)**: Precise live baking countdowns (3:00 min targets) with delayed-bake warnings and oven deck occupancy.
4. **Packing & Driver Dispatch (`/pakowanie`)**: Real-time consolidation of baked orders, thermal bag staging, customer delivery routing, and payment verification.

---

## 📸 Platform Previews & Visual Showcase

### 1. 🍕 Touch Cashier POS Terminal (`/`)
High-speed ordering terminal designed for rapid counter transactions and phone deliveries.
Features categorized visual pizza cards, instant ingredient modification dialogs, half-and-half pizza builder (40cm), and live recalculation of discounts, delivery charges, and sauce pricing.

<div align="center">
  <img src="docs/screenshots/pos_terminal_preview.jpg" alt="Point of Sale Order Terminal" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
</div>

<br/>

### 2. 👨‍🍳 Kitchen Display System (KDS) & Real-Time Queue (`/kuchnia`)
Mounted kitchen touchscreen replacing paper printer tickets with synchronized digital order cards.
Features drag-and-drop prioritization via `@dnd-kit`, color-coded ingredient modification tags (+green added / -red removed), preparation elapsed timers, and single-tap handoff to the oven.

<div align="center">
  <img src="docs/screenshots/pos_kds_preview.jpg" alt="Kitchen Display System Interface" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
</div>

---

## 🚀 Key Features & Domain Engine

### 1. 🍕 Complex Pizza Domain Pricing Engine
- **Granular Size Matrix**: Seamless toggle between small (30cm) and large (40cm) variants with automated price delta calculations.
- **Custom Composition Engine ("Własna Kompozycja")**: First 5 ingredients are included free of charge; subsequent additions automatically billed according to size matrix (4 PLN small / 5 PLN large).
- **Half-and-Half Builder ("Pół na Pół")**: Enables combining two distinct specialty pizzas on a single 40cm crust, splitting ingredient lists while applying fair pricing heuristics.
- **Free Toppings Whitelist**: Zero-charge condiments (Tabasco, fresh arugula, black pepper) tracked separately from premium cheeses and meats.

### 2. ⚡ Real-Time WebSocket Architecture (Socket.IO)
- Zero-latency broadcast of order state transitions (`order:created`, `order:status_changed`, `order:updated`, `order:priority_moved`).
- Bidirectional updates: Moving an order card in the kitchen instantly updates the cashier terminal and oven monitors across all network tablets.
- Resilient auto-reconnect with state synchronization on reconnection.

### 3. 🔥 Oven Station with Live Timers
- Dedicated visual countdown bar per pizza item (180s target).
- Audio/visual flashing alerts when pizzas exceed warning thresholds (210s), preventing burnt dough during peak dinner rushes.
- Chronological and table priority sorting.

### 4. 🗄️ Database Concurrency & Performance
- SQLite database configured with **WAL (Write-Ahead Logging)** mode for concurrent multi-client read operations during heavy write loads.
- Tuned PRAGMA settings: `cache_size = -10000` (10MB in-memory buffer), `synchronous = NORMAL`, and `busy_timeout = 30000` to eliminate database locking issues.

---

## 🏛️ System Architecture

```mermaid
flowchart TD
    subgraph Clients["Frontend Clients (React 19 + MUI v7)"]
        POS["Order Taking Terminal
(Cashier / Phone)"]
        KDS["Kitchen Display System
(Touch Screen / DnD)"]
        OVEN["Oven Station Tracker
(Live 180s Timers)"]
        PACK["Packaging & Dispatch
(Driver Courier Queue)"]
    end

    subgraph Transport["Real-Time Communication Layer"]
        REST["HTTP REST API (Express.js)
/api/orders, /api/products, /api/stats"]
        WS["WebSocket Pipeline (Socket.IO v4)
Room Broadcasts & Event Dispatcher"]
    end

    subgraph Core["Backend Service Layer (Node.js)"]
        ROUTER["API Request Router"]
        VALIDATOR["Joi Schema Validators"]
        ENGINE["Pricing & Rule Engine
(Custom Composition, Half-and-Half)"]
        SOCKET_MGR["Socket Event Manager"]
    end

    subgraph Persistence["Storage & Database Layer"]
        SQLITE[("SQLite Database
WAL Mode / 10MB Cache")]
        SCHEMA["skladniki | produkty | zamowienia
pozycje_zamowienia | modyfikacje"]
    end

    POS -->|HTTP POST /api/orders| REST
    POS & KDS & OVEN & PACK <-->|Bi-directional WS Events| WS
    REST & WS --> ROUTER & SOCKET_MGR
    ROUTER --> VALIDATOR --> ENGINE --> SQLITE
    SQLITE --> SCHEMA
    SOCKET_MGR -->|Broadcasts State Changes| Clients
```

---

## 🔄 Order Lifecycle State Machine

```mermaid
stateDiagram-v2
    [*] --> Przyjęte: Order Placed (Counter / Phone)
    
    state "1. Przyjęte (Order Placed)" as Przyjęte
    state "2. Do Pieca (Oven Queue)" as DoPieca
    state "3. W Piecu (Baking in Oven)" as WPiecu
    state "4. Do Pakowania (Ready for Packaging)" as DoPakowania
    state "5. Wydane (Dispatched / Delivered)" as Wydane
    state "Anulowane (Cancelled)" as Anulowane

    Przyjęte --> DoPieca: Kitchen Dough Stretched & Topped
    DoPieca --> WPiecu: Pizza Inserted into Deck Oven
    WPiecu --> DoPakowania: 180s Bake Complete / Removed
    DoPakowania --> Wydane: Packed with Sauces / Handed to Courier
    
    Przyjęte --> Anulowane: Customer Cancelled
    DoPieca --> Anulowane: Kitchen Cancellation
    
    Wydane --> [*]
    Anulowane --> [*]
```

---

## 🗄️ Relational Database Schema

```mermaid
erDiagram
    PRODUKTY ||--o{ POZYCJE_ZAMOWIENIA : contains
    ZAMOWIENIA ||--|{ POZYCJE_ZAMOWIENIA : includes
    SKLADNIKI ||--o{ MODYFIKACJE_POZYCJI : modifies
    POZYCJE_ZAMOWIENIA ||--o{ MODYFIKACJE_POZYCJI : has

    ZAMOWIENIA {
        int id PK
        string numer_zamowienia UK
        string status "przyjete | w piecu | wydane"
        string typ_zamowienia "na_wynos | na_miejscu | dowoz"
        time godzina_odbioru
        string klient_telefon
        text klient_adres
        decimal kwota_brutto
        datetime created_at
    }

    PRODUKTY {
        int id PK
        int kasa_id UK
        string nazwa
        decimal cena_maly "30cm"
        decimal cena_duzy "40cm"
        boolean aktywny
    }

    POZYCJE_ZAMOWIENIA {
        int id PK
        int zamowienie_id FK
        int produkt_id FK
        string rozmiar "30cm | 40cm"
        int ilosc
        decimal cena_jednostkowa
        boolean pol_na_pol
        int drugi_produkt_id FK
    }

    SKLADNIKI {
        int id PK
        string nazwa UK
        string typ "warzywo | ser | mieso"
        decimal cena_maly
        decimal cena_duzy
    }

    MODYFIKACJE_POZYCJI {
        int id PK
        int pozycja_id FK
        int skladnik_id FK
        string typ_modyfikacji "dodany (+) | usuniety (-)"
        decimal doplata
    }
```

---

## 🛠️ Tech Stack & Key Dependencies

| Component | Technology | Version | Purpose |
|---|---|---|---|
| **Frontend Framework** | React | `^19.2.0` | High-performance reactive UI rendering |
| **Component Library** | Material-UI (MUI) | `^7.3.4` | Dark theme restaurant UI components & icons |
| **Drag & Drop** | `@dnd-kit/core` | `^6.3.1` | Kitchen ticket reordering on touch screens |
| **Routing** | React Router DOM | `^7.9.4` | Single-page multi-station client routing |
| **API Client** | Axios | `^1.12.2` | REST API HTTP communication |
| **Backend Runtime** | Node.js | `20+ LTS` | Server-side JavaScript runtime |
| **HTTP Framework** | Express.js | `^4.21.0` | REST API routes & middleware |
| **Real-time Engine** | Socket.IO | `^4.8.1` | Instant event propagation across tablets |
| **Embedded Database** | SQLite (`sqlite3`) | `^5.1.7` | Zero-configuration WAL database storage |
| **Validation** | Joi | `^17.13.0` | Payload verification for orders and products |
| **Logging** | Winston & Morgan | `^3.17.0` | Audit logging and request tracing |

---

## 💼 Informacja dla Rekruterów / Recruiter Notice

> **Pełny kod źródłowy projekt dostępny do wglądu dla rekruterów na życzenie po kontakcie mailowym.**
> 
> The complete production source code, commit history, and technical documentation are available for recruiters and hiring managers upon request:
> - 📬 **E-mail**: [dominikzatorski8@gmail.com](mailto:dominikzatorski8@gmail.com)
> - 💼 **LinkedIn**: [Dominik Zatorski](https://pl.linkedin.com/in/dominik-zatorski-b1a82a1b9)
> - 🐙 **GitHub Profile**: [@verblo](https://github.com/verblo)

---

## 👨‍💻 Author & Contact

**Dominik Zatorski**
- GitHub: [@verblo](https://github.com/verblo)
- LinkedIn: [Dominik Zatorski](https://pl.linkedin.com/in/dominik-zatorski-b1a82a1b9)
- Email: [dominikzatorski8@gmail.com](mailto:dominikzatorski8@gmail.com)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE) — free to use and adapt.
