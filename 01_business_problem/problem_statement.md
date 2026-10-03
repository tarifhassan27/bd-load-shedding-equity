# Business Problem

When electricity supply falls short of demand, Bangladesh's national
grid sheds load across nine power-grid divisions. Someone has to absorb
each cut, and how that burden is distributed is a fairness question:
is it shared evenly, or is Dhaka — the capital, with by far the largest
demand — structurally protected while the rest of the country absorbs
the cuts?

Raw megawatts can't answer it. Dhaka's demand is so much larger than
every other division's that a raw MW comparison makes Dhaka look like it
suffers the most, when it simply has more electricity to lose. A fair
comparison has to measure each division's shedding against its own
demand.

This project uses a public dataset of daily demand, supply and
load-shedding for all nine divisions (2019–2024, sourced from the
Bangladesh Power Development Board) and one metric:

**Load-shedding as a percentage of each division's own demand** —
`SUM(load_mw) / SUM(demand_mw)` per division-year.

**The question:** is the load-shedding burden shared evenly across
divisions, and is any imbalance stable over time or just year-to-year
noise?

**The decision it informs:** whether the way cuts are allocated across
divisions needs review. The method carries over to any allocation
question — compare each group's share of the burden against its own
base, not raw totals.
