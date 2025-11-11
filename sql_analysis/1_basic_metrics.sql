-- 1.Основные метрики продаж
SELECT 
    COUNT(DISTINCT Order_ID) as total_orders,
    ROUND(SUM(Sales), 2) as total_revenue,
    ROUND(SUM(Profit), 2) as total_profit,
    COUNT(DISTINCT Customer_ID) as unique_customers,
    COUNT(DISTINCT Product_ID) as unique_products
FROM superstore_sales_table;
