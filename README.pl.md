<div align="center">

# POS Pizzeria

### Nowoczesny System Real-Time POS i KDS (Kitchen Display System) dla Gastronomii i Pizzerii

[![React](https://img.shields.io/badge/React-19.x-61DAFB?style=for-the-badge&logo=react&logoColor=black)](https://react.dev/)
[![Node.js](https://img.shields.io/badge/Node.js-20%2B-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)](https://nodejs.org/)
[![Express.js](https://img.shields.io/badge/Express.js-5.x-000000?style=for-the-badge&logo=express&logoColor=white)](https://expressjs.com/)
[![Socket.IO](https://img.shields.io/badge/Socket.IO-4.x_Real--Time-010101?style=for-the-badge&logo=socketdotio&logoColor=white)](https://socket.io/)
[![Material UI](https://img.shields.io/badge/Material_UI-7.x-007FFF?style=for-the-badge&logo=mui&logoColor=white)](https://mui.com/)
[![SQLite](https://img.shields.io/badge/SQLite-WAL_Mode-003B57?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.sqlite.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

<br/>

**[🇬🇧 Switch to English Version](README.md)**

<br/><br/>

<div align="center">
  <img src="docs/screenshots/pos_demo.gif" alt="Animacja przepływu zamówień w systemie POS Pizzeria" width="95%" style="border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.25);" />
  <p><em>Pełny obieg zamówienia w czasie rzeczywistym: Terminal Kelnerski ➔ KDS Kuchnia ➔ Monitor Pieca ➔ Stacja Wydawki & Kierowcy ➔ Analityka Biznesowa</em></p>
</div>

</div>

> [!NOTE]
> ### 💼 Portfolio Showcase i Prezentacja Architektury
> Niniejsze repozytorium stanowi **publiczne portfolio inżynierskie**, prezentujące architekturę, schematy bazodanowe, konfigurację, dokumentację oraz rzeczywiste widoki interfejsu systemu.
> Pełny komercyjny kod źródłowy udostępniany jest dla rekruterów na życzenie po kontakcie mailowym.

---

## 🍕 Podsumowanie Projektu

**POS Pizzeria** to kompleksowy, wysokowydajny system sprzedaży (Point of Sale) oraz monitoringu produkcji kuchennej (Kitchen Display System), stworzony od podstaw z myślą o specyfice restauracji serwujących pizzę i realizujących wysoki wolumen zamówień z dostawą.

W odróżnieniu od generycznych systemów gastronomicznych, platforma perfekcyjnie obsługuje:
- Pizze "Pół na Pół" z niezależnymi kompozycjami i sosami na każdej połowie
- Zaawansowany matrycowy konfigurator składników (dodatki, zamienniki, grubości ciasta)
- Natychmiastową synchronizację WebSocket (sub-10ms) pomiędzy terminalami kelnerskimi, kuchnią a stacją pieca
- Panel wydawki z weryfikacją płatności i przypisywaniem kierowców do rewirów dostaw

---

## 📸 Prezentacja Rzeczywistego Interfejsu

### 1. 🍕 Dotykowy Terminal Kelnerski / Kasa (`/`)
Błyskawiczne przyjmowanie zamówień na sali i przez telefon. Wybór rozmiarów (30cm / 40cm), konfiguracja stolika lub dowozu, podsumowanie koszyka na żywo.

<div align="center">
  <img src="docs/screenshots/01_pos_terminal_order_taking.png" alt="Rzeczywisty widok terminala POS z koszykiem" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Rzeczywisty zrzut ekranu: Wybór pizzy Margherita 40cm i 30cm, obsługa stolika na miejscu, natychmiastowe przeliczenie kwoty 75.98 zł.</em></p>
</div>

<br/>

### 2. 👨‍🍳 Kitchen Display System — KDS Kuchnia (`/kuchnia`)
Eliminuje papierowe bloczki. Bilety zamówień pojawiają się w kuchni automatycznie w ułamku sekundy, z licznikami czasu oczekiwania i podświetlonymi modyfikacjami.

<div align="center">
  <img src="docs/screenshots/02_kds_kitchen_prep.png" alt="Ekran KDS Kuchnia" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Ekran Kuchni: Oznaczenia priorytetu czasowego, wyszczególnione modyfikacje (+ Cienkie ciasto, + Extra pieczarki) oraz przycisk przekazania 'GOTOWE - DO PIECA'.</em></p>
</div>

<br/>

### 3. 🔥 Stacja Pieca i Kontrola Wypieku (`/piec`)
Synchronizacja wypieku w komorach pieca. Liczniki czasu pieczenia ostrzegają przed przypaleniem ciasta i automatycznie powiadamiają stację pakowania.

<div align="center">
  <img src="docs/screenshots/03_oven_baking_station.png" alt="Stacja Pieca" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Monitor Pieca: Nadzór nad pieczonymi plackami, przypomnienie o cieście (grube/cienkie) i akcja 'UPIECZONE - DO PAKOWANIA'.</em></p>
</div>

<br/>

### 4. 📦 Wydawka, Odbiór i Obsługa Dostaw (`/wydawka`)
Stacja kompletacji zamówień z zimnymi napojami i sosami. Wyświetla status płatności, adres dowozu, kod do domofonu oraz telefon klienta.

<div align="center">
  <img src="docs/screenshots/04_expedite_dispatch.png" alt="Stacja Wydawki i Dostaw" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Ekran Wydawki: Czytelny zielony kafelek z kwotą do pobrania (70.97 zł) oraz weryfikacja pozycji pobieranych z kuchni.</em></p>
</div>

<br/>

### 5. 📊 Centrum Zarządzania, Analityka i Magazyn (`/zarzadzanie`)
Panel menedżerski z kluczowymi wskaźnikami KPI: obrót dzienny (635 zł), statystyki koszyka, wąskie gardła produkcji na żywo oraz edytor menu i stanów magazynowych.

<div align="center">
  <img src="docs/screenshots/05_management_dashboard.png" alt="Centrum Zarządzania i Raporty" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Dashboard Menedżerski: Bieżące podsumowanie utargu, struktura zamówień (2 w kuchni, 1 w piecu, 1 do pakowania) oraz średnia wartość koszyka.</em></p>
</div>

<br/>

<div align="center">
  <img src="docs/screenshots/06_management_products.png" alt="Katalog Menu i Produktów" width="95%" style="border-radius: 6px; box-shadow: 0 2px 12px rgba(0,0,0,0.15);" />
  <p><em>Katalog Produktów: Poziomy cenowe, przypisanie do kas oraz konfiguracja receptur.</em></p>
</div>

---

## 🛠️ Stos Technologiczny

- **Frontend**: React 19, Material-UI (MUI v7), Emotion, `@dnd-kit/core`
- **Real-Time WebSockets**: Socket.IO Client & Server v4.8
- **Backend**: Node.js v20+, Express.js v5 (HTTP Keep-Alive, optymalizowany JSON payload)
- **Baza Danych**: SQLite3 w trybie WAL (`PRAGMA journal_mode = WAL`), cache 10MB
- **Walidacja i Logi**: Joi, Winston, Morgan

---

## 📄 Adnotacja dla Rekruterów

> ### 📬 Informacja dla Rekruterów
> **Pełny kod źródłowy projekt dostępny do wglądu dla rekruterów na życzenie po kontakcie mailowym.**
>
> ✉️ **Kontakt**: [dominikzatorski8@gmail.com](mailto:dominikzatorski8@gmail.com)  
> 👤 **Autor**: Dominik Zatorski ([@verblo](https://github.com/verblo))
