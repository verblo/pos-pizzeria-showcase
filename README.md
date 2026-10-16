<div align="center">

# POS Pizzeria

### Modern Real-Time Point of Sale & Kitchen Display System (KDS) for Artisanal Pizzerias

[![React](https://img.shields.io/badge/React-19.x-61DAFB?style=for-the-badge&logo=react&logoColor=black)](https://react.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-20%2B-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/)
[![Express.js](https://img.shields.io/badge/Express.js-5.x-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![Socket.IO](https://img.shields.io/badge/Socket.IO-4.x_Real--Time-010101?style=for-the-badge&logo=socketdotio&logoColor=white)](https://socket.io/)
[![Material UI](https://img.shields.io/badge/Material_UI-7.x-007FFF?style=for-the-badge&logo=mui&logoColor=white)](https://mui.com/)
[![SQLite](https://img.shields.io/badge/SQLite-WAL_Mode-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.sqlite.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

<br/>

**[🇵🇱 Przejdź do polskiej wersji (Polish README)](README.pl.md)**

<br/><br/>

<div align="center">
  <img src="docs/screenshots/pos_demo.gif" alt="POS Pizzeria Real-time Workflow Demo" width="95%" style="border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.25);" />
  <p><em>Real-Time Pizzeria Pipeline: Waiter Cashier POS Terminal ➔ Kitchen KDS Queue ➔ Multi-Deck Oven Tracking ➔ Expedite Dispatch ➔ Management Analytics</em></p>
</div>

</div>

> [!NOTE]
> ### 💼 Portfolio Showcase & Technical Specification
> This repository serves as a **portfolio and architectural showcase** containing high-level system designs, database schemas, interactive visual previews, configuration models, and engineering specifications.
> Full commercial production source code is available to technical recruiters upon request (see below).

---

## 📦 Executive Summary

**POS Pizzeria** is an end-to-end, high-throughput Point of Sale and Kitchen Display System engineered specifically for fast-paced Italian pizzerias and high-volume delivery restaurants.

Traditional restaurant POS solutions struggle with the unique complexities of pizza operations: split half-and-half compositions, granular ingredient additions/subtractions, dynamic multi-tier pricing, and strict oven timing synchronization. 

This platform bridges order creation at the front counter with real-time WebSocket event dispatching to dedicated touch interfaces:
1. **Cashier / Waiter Order Terminal (`/`)**: Lightning-fast order builder with custom ingredient matrices, size toggles, custom composition calculators, and delivery address parsing.
2. **Kitchen Display System KDS (`/kuchnia`)**: Real-time order queue with visual urgency timers, color-coded modifier pills, and multi-station staging.
3. **Oven Station Tracker (`/piec`)**: Precise live baking countdowns (3:00 min targets) with delayed-bake warnings and oven deck occupancy.
4. **Packing & Driver Dispatch (`/wydawka`)**: Real-time consolidation of baked orders, thermal bag staging, customer delivery routing, and payment verification.
5. **Management Control Center (`/zarzadzanie`)**: Daily gross revenue KPI metrics, live production flow bars, product catalog editor, and ingredient inventory tracking.

---

## 📸 Real UI Feature Showcase

### 1. 🍕 Touch Cashier POS Terminal (`/`)
High-speed ordering terminal designed for rapid counter transactions and phone deliveries.
Features categorized visual pizza cards, instant ingredient modification dialogs, half-and-half pizza builder (40cm), and live recalculation of discounts, delivery charges, and sauce pricing.

<div align="center">
  <img src="docs/screenshots/01_pos_terminal_order_taking.png" alt="Point of Sale Order Terminal with Active Cart" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Real terminal view: Active order composition with Margherita 40cm, Margherita 30cm, Table #4 assignment, and instant payment calculation.</em></p>
</div>

<br/>

### 2. 👨‍🍳 Kitchen Display System — KDS (`/kuchnia`)
Eliminates lost paper tickets. Orders arriving from the terminal instantly render as actionable tickets with elapsed preparation timers, table identifiers, delivery metadata, and modifier highlights.

<div align="center">
  <img src="docs/screenshots/02_kds_kitchen_prep.png" alt="Kitchen Display System KDS Queue" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>KDS Screen: Urgency badges (36 min, 32 min), ingredient modification highlights (+ Cienkie ciasto, + Extra pieczarki), and one-click 'GOTOWE - DO PIECA' trigger.</em></p>
</div>

<br/>

### 3. 🔥 Multi-Deck Oven Baking Station (`/piec`)
Synchronizes pizzaiolo bakers with active oven deck space. Pizzas entering the oven are tracked with automated timers, warning of potential over-baking and alerting the packing station when ready.

<div align="center">
  <img src="docs/screenshots/03_oven_baking_station.png" alt="Oven Baking Station Tracker" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Oven Station: Real-time baking staging, crust type reminders (grube/cienkie), and 'UPIECZONE - DO PAKOWANIA' handoff.</em></p>
</div>

<br/>

### 4. 📦 Expedite & Delivery Driver Dispatch (`/wydawka`)
Consolidates food items with cold drinks and side sauces. Manages customer pickup notifications and provides drivers with parsed delivery addresses, door codes, and outstanding balances.

<div align="center">
  <img src="docs/screenshots/04_expedite_dispatch.png" alt="Expedite Packing and Delivery Dispatch" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Expedite Station: Prominent payment due badges (70.97 zł), masked client contact numbers, and side-dish validation.</em></p>
</div>

<br/>

### 5. 📊 Management Center, Analytics & Stock Control (`/zarzadzanie`)
Executive dashboard providing real-time restaurant operational metrics: daily revenue, hourly transaction volume, live bottleneck monitoring, and CRUD management for pizzas and ingredients.

<div align="center">
  <img src="docs/screenshots/05_management_dashboard.png" alt="Management Center Dashboard" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Executive Dashboard: Daily revenue (635 zł), active orders in flight, pipeline distribution (2 Kitchen, 1 Oven, 1 Packing, 1 Completed), and monthly average basket.</em></p>
</div>

<br/>

<div align="center">
  <img src="docs/screenshots/06_management_products.png" alt="Product Catalog Editor" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Product Catalog: Price tiers, recipe configurations, and point-of-sale mapping.</em></p>
</div>

---

## 🛠️ Technology Stack Breakdown

| Layer | Technologies | Rationale & Performance Impact |
|---|---|---|
| **Frontend UI** | React 19, Material-UI (MUI v7), Emotion | Component-driven touch interfaces optimized for industrial tablets and kiosks. |
| **State & Drag-Drop** | `@dnd-kit/core`, `@dnd-kit/sortable` | Fluid, accessible drag-and-drop order prioritization on the kitchen line. |
| **Real-Time Layer** | Socket.IO Client & Server v4.8 | Bidirectional event synchronization ensures sub-10ms ticket updates across all stations. |
| **Backend Core** | Node.js v20+, Express.js v5 | Asynchronous non-blocking architecture capable of handling heavy concurrent order traffic. |
| **Database Engine** | SQLite3 with WAL Mode (`journal_mode=WAL`) | Ultra-reliable zero-configuration persistence; WAL mode permits non-blocking concurrent reads during active kitchen writes. |
| **Validation & Logs** | Joi, Winston, Morgan | Strict schema validation on order payloads; JSON-structured production logging. |

---

## 📄 License & Recruiter Notice

This showcase repository is released under the **MIT License**.

> ### 📬 Nota dla Rekruterów / Recruiter Notice
> **Pełny kod źródłowy projekt dostępny do wglądu dla rekruterów na życzenie po kontakcie mailowym.**
>
> ✉️ **Kontakt**: [dominikzatorski8@gmail.com](mailto:dominikzatorski8@gmail.com)  
> 👤 **Autor**: Dominik Zatorski ([@verblo](https://github.com/verblo))
