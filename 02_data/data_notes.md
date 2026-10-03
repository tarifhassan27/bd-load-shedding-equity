# Data Notes

Raw source files are not committed to this repo (the local `data/`
folder is excluded via `.gitignore`).

## Source

[Structured Dataset of Daily Electricity Demand, Generation, Load Shedding, and Supply Constraints in Bangladesh (2019–2024)](https://doi.org/10.17632/x7r7wdb39k),
Mendeley Data, Version 2 — sourced from BPDB (Bangladesh Power
Development Board).

## Tables

| Table | Grain | Rows |
|---|---|---|
| `raw.daily_power_wide` | one row per date, 41 columns (wide) | 1,850 |
| `clean.daily_division` | one row per date per division (long) | 16,650 |
| `clean.daily_national` | one row per date | 1,850 |

## Data-quality notes

Full audit in
[`03_sql/02_audit/02_null_and_format_checks.sql`](../03_sql/02_audit/02_null_and_format_checks.sql);
load reconciliation in
[`03_sql/02_audit/03_reconciliation_checks.sql`](../03_sql/02_audit/03_reconciliation_checks.sql).

- **Date range and gaps.** 2019-11-21 to 2024-12-30 is 1,867 calendar
  days; the dataset has 1,850 rows, so 17 calendar days have no row.
  Most are isolated single days; 2024-07-18 through 2024-07-23 is six
  consecutive missing days.
- **Partial years.** 2019 covers 41 days, so year-level comparisons use
  daily averages and ratios, not totals.
- **Nulls and formats.** Zero NULLs across all 41 columns and zero
  non-numeric values in any demand, supply or load column. 6 blank
  cells in secondary metadata fields, stored as empty strings.
- **Consistency (demand − supply = load).** 5 mismatches out of 16,650
  data points (0.03%): three ±1 MW discrepancies, and two larger
  anomalies in Khulna on 30–31 July 2020.
- **Day-of-week labels.** 6 rows where the stated day of the week does
  not match the date. Not used in the equity metric.
