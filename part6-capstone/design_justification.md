## Storage Systems

To meet the hospital’s four goals, I have chosen a Data Lakehouse approach.

For Goal 1 (Readmission Risk) and Goal 3 (Monthly Reports), I chose a Data Warehouse layer. This is perfect for structured historical data (like treatment codes and billing). Because the data is organized in a "Star Schema," the hospital management can generate cost reports and the AI can look at clean history to predict risks.

For Goal 2 (Plain English Queries), I chose a Vector Database. Doctors write notes in their own words. By turning these notes into "embeddings" (number maps), a vector database allows a doctor to ask about a "cardiac event" and find notes that say "heart attack" because it understands the meaning is the same.

For Goal 4 (Real-time ICU Vitals), I chose a Data Lake. ICU monitors send thousands of signals a second. Trying to put these into a strict SQL table immediately would break the system. The Data Lake "catches" this raw stream like a net, allowing us to store it cheaply and analyze it later.

## OLTP vs OLAP Boundary

In this design, the OLTP (Transactional) system ends at the hospital’s main record-keeping database. This is where nurses enter data right now.

The OLAP (Analytical) system begins once the data is moved (via a process called ETL) into our Data Warehouse and Vector DB. The "Boundary" is the Data Lake. The Lake acts as a waiting room where raw data sits before it is cleaned and moved into the analytical tools for the Boss and the AI to use.

## Trade-offs

A significant trade-off in this design is Complexity vs. Cost. Using three different types of storage (Warehouse, Lake, and Vector) is more expensive and harder to manage than just one big database.

To mitigate (fix) this, I would use a unified Data Lakehouse platform (like Databricks or Snowflake). This allows us to manage all three types of data in one place using one language (SQL), which saves the hospital money and makes it easier for the IT team to keep the system running smoothly.