-- 4. АНАЛИЗ ЭФФЕКТИВНОСТИ ДОСТАВКИ
SELECT 
    "Ship Mode",
    COUNT(*) as total_orders,
    ROUND(SUM(Sales), 2) as total_sales,
    ROUND(SUM(Profit), 2) as total_profit,
    ROUND(AVG(JULIANDAY("Ship Date") - JULIANDAY("Order Date")), 1) as avg_delivery_days,
    ROUND(AVG(Discount) * 100, 1) as avg_discount_percent,
    ROUND(SUM(Profit) / COUNT(*), 2) as profit_per_order
FROM superstore
GROUP BY "Ship Mode"
ORDER BY profit_per_order DESC;
