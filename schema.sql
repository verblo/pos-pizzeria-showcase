-- ============================================================================
-- POS Pizzeria - Relational Database Schema (SQLite / PostgreSQL Compatible)
-- High-concurrency schema with WAL mode, foreign keys, and indexes
-- ============================================================================

-- 1. Ingredients Master Table
CREATE TABLE IF NOT EXISTS skladniki (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nazwa VARCHAR(100) UNIQUE NOT NULL,
    typ VARCHAR(50) NOT NULL DEFAULT 'warzywo',
    cena_maly DECIMAL(6,2) DEFAULT 4.00,
    cena_duzy DECIMAL(6,2) DEFAULT 5.00,
    dostepny BOOLEAN DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Products / Pizzas Catalog Table
CREATE TABLE IF NOT EXISTS produkty (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    kasa_id INTEGER UNIQUE,
    nazwa VARCHAR(120) NOT NULL,
    opis TEXT,
    kategoria VARCHAR(50) DEFAULT 'pizza',
    cena_maly DECIMAL(6,2) NOT NULL,
    cena_duzy DECIMAL(6,2) NOT NULL,
    aktywny BOOLEAN DEFAULT 1,
    kolejnosc INTEGER DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 3. Core Orders Table
CREATE TABLE IF NOT EXISTS zamowienia (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    numer_zamowienia VARCHAR(30) UNIQUE NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'przyjete',
    typ_zamowienia VARCHAR(30) NOT NULL DEFAULT 'na_wynos', -- 'na_miejscu', 'na_wynos', 'dowoz'
    godzina_odbioru TIME NULL,
    stolik_nr INTEGER NULL,
    
    -- Client & Delivery Data
    klient_telefon VARCHAR(30),
    klient_adres TEXT,
    klient_nip VARCHAR(20),
    metoda_platnosci VARCHAR(20) DEFAULT 'gotowka', -- 'gotowka', 'karta', 'online'
    oplacone_z_gory BOOLEAN DEFAULT 0,
    
    -- Financial Totals
    kwota_brutto DECIMAL(8,2) NOT NULL,
    oplata_dostawa DECIMAL(6,2) DEFAULT 0.00,
    znizka DECIMAL(6,2) DEFAULT 0.00,
    uwagi TEXT,
    
    -- Timestamps for KPI tracking (Kitchen, Oven, Delivery)
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    do_pieca_at DATETIME NULL,
    w_piecu_at DATETIME NULL,
    do_pakowania_at DATETIME NULL,
    wydane_at DATETIME NULL
);

-- 4. Order Line Items
CREATE TABLE IF NOT EXISTS pozycje_zamowienia (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    zamowienie_id INTEGER NOT NULL,
    produkt_id INTEGER NOT NULL,
    rozmiar VARCHAR(10) NOT NULL DEFAULT '30cm', -- '30cm', '40cm'
    ilosc INTEGER NOT NULL DEFAULT 1,
    cena_jednostkowa DECIMAL(6,2) NOT NULL,
    pol_na_pol BOOLEAN DEFAULT 0,
    drugi_produkt_id INTEGER NULL,
    uwagi TEXT,
    FOREIGN KEY (zamowienie_id) REFERENCES zamowienia(id) ON DELETE CASCADE,
    FOREIGN KEY (produkt_id) REFERENCES produkty(id)
);

-- 5. Item Custom Ingredients Modifications (+dodatki / -usuniecia)
CREATE TABLE IF NOT EXISTS modyfikacje_pozycji (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pozycja_id INTEGER NOT NULL,
    skladnik_id INTEGER NOT NULL,
    typ_modyfikacji VARCHAR(10) NOT NULL, -- 'dodany' (+), 'usuniety' (-)
    doplata DECIMAL(6,2) DEFAULT 0.00,
    FOREIGN KEY (pozycja_id) REFERENCES pozycje_zamowienia(id) ON DELETE CASCADE,
    FOREIGN KEY (skladnik_id) REFERENCES skladniki(id)
);

-- Performance Indexes
CREATE INDEX IF NOT EXISTS idx_zamowienia_status ON zamowienia(status);
CREATE INDEX IF NOT EXISTS idx_zamowienia_created ON zamowienia(created_at);
CREATE INDEX IF NOT EXISTS idx_pozycje_zamowienie ON pozycje_zamowienia(zamowienie_id);
CREATE INDEX IF NOT EXISTS idx_modyfikacje_pozycja ON modyfikacje_pozycji(pozycja_id);
