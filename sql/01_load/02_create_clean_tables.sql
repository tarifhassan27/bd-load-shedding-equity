-- sql/01_load/02_create_clean_tables.sql
-- Phase 4: typed, long-format table for divisional demand/supply/load,
-- plus typed table for national (whole-country, one row per date) columns.

CREATE SCHEMA IF NOT EXISTS clean;

-- Grain: one row per (record_date, division). Expected: 1,850 x 9 = 16,650 rows.
DROP TABLE IF EXISTS clean.daily_division;

CREATE TABLE clean.daily_division (
    record_date  date         NOT NULL,
    division     varchar(20)  NOT NULL,
    demand_mw    numeric      NOT NULL,
    supply_mw    numeric      NOT NULL,
    load_mw      numeric      NOT NULL,
    PRIMARY KEY (record_date, division)
);

-- Grain: one row per record_date. Expected: 1,850 rows.
-- Source table: raw.daily_power_wide
DROP TABLE IF EXISTS clean.daily_national;

CREATE TABLE clean.daily_national (
    -- source: "Date"
    record_date                      date          NOT NULL,

    -- source: "Day of the week"
    day_of_week                      varchar(10)   NOT NULL,

    -- source: "Max. Demand at eve. peak (Generation end)"
    max_demand_gen_end_mw            numeric       NOT NULL,

    -- source: "Max. Demand at eve. peak (Sub-station end)"
    max_demand_substation_end_mw     numeric       NOT NULL,

    -- source: "Highest Generation (Generation end)"
    highest_generation_mw            numeric       NOT NULL,

    -- source: "Minimum Generation (Generation end)"
    minimum_generation_mw            numeric       NOT NULL,

    -- source: "Day-peak Generation (Generation end)"
    day_peak_generation_mw           numeric       NOT NULL,

    -- source: "Evening-peak Generation (Generation end)"
    evening_peak_generation_mw       numeric       NOT NULL,

    -- source: "Minimum Generation Forecast up to 8:00 hrs." (1 blank cell in raw)
    min_generation_forecast_mw       numeric,

    -- source: "Maximum Temperature in Dhaka was" (5 blank cells in raw)
    max_temp_dhaka                   numeric,

    -- source: "Gas/LF limitation" (1 blank cell in raw)
    gas_lf_limitation_mw             numeric,

    -- source: "Coal supply Limitation" (1 blank cell in raw)
    coal_supply_limitation_mw        numeric,

    -- source: "Low water level in Kaptai lake" (1 blank cell in raw)
    low_water_kaptai_mw              numeric,

    -- source: "Plants under shut down/ maintenance" (1 blank cell in raw)
    plants_shutdown_maintenance_mw   numeric,

    PRIMARY KEY (record_date)
);