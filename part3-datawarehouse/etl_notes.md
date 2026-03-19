ETL Decisions
Decision 1 — Standardizing Date Formats
Problem: The raw data had dates written in many different ways, like 29/08/2023, 12-12-2023, and 2023-01-15. This makes it impossible for the computer to sort them or know which month came first.

Resolution: I transformed all dates into a single standard format: YYYY-MM-DD. I also created a specific dim_date table with a date_id (like 20230829) so we can easily group sales by month or year without the computer getting confused.

Decision 2 — Fixing Inconsistent Category Casing
Problem: The product categories were messy. Some were lowercase (electronics), some were capitalized (Electronics), and some were plural (Groceries vs Grocery). If we didn't fix this, the computer would think "electronics" and "Electronics" were two different things.

Resolution: I "washed" the data by forcing every category to start with a capital letter and using singular names (e.g., changing everything to Electronics and Grocery). This ensures that when we ask for "Total Electronics Sales," we get the correct big number.

Decision 3 — Handling Missing Store Locations
Problem: Some rows in the raw data were missing the city name (NULL values). For example, a receipt might say Mumbai Central but leave the store_city blank. If we left it blank, our "Sales by City" reports would be empty.

Resolution: I used a "Lookup" method. Since I knew Mumbai Central is always in Mumbai and Delhi South is always in Delhi, I filled in the missing city names during the cleaning process before the data reached the warehouse shelves.