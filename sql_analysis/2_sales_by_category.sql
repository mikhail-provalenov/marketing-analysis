SELECT 
    Category,
    ROUND(SUM(Sales), 2) as category_revenue,
    ROUND(SUM(Profit), 2) as category_profit,
    COUNT(DISTINCT Order_ID) as orders_count
FROM superstore_sales_table
GROUP BY Category
ORDER BY category_revenue DESC;
