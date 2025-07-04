## Query 1: Top 5 Customers by Total Sales

This query groups the sales data by `CustomerKey` and calculates the total sales per customer using `SUM(SalesAmount)`.
Then it selects the top 5 customers by ordering in descending order of sales.

---

## Query 2: Products Sold in Many Territories with High Price

This query groups data by `ProductKey` and:
- Counts how many distinct `SalesTerritoryKey` values exist per product
- Calculates the average unit price
Only those products with more than 4 territories **and** average price over 100 are returned.
