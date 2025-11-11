-- 3. АНАЛИЗ ВОЗВРАТОВ И УБЫТОЧНЫХ ТОВАРОВ
WITH product_performance AS (
    SELECT 
        "Product Name",
        "Category",
        "Sub-Category",
        SUM(Sales) as total_sales,
        SUM(Profit) as total_profit,
        COUNT(DISTINCT "Order ID") as order_count,
        CASE 
            WHEN SUM(Sales) = 0 THEN 0 
            ELSE ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) 
        END as margin_percent
    FROM superstore
    GROUP BY "Product Name", "Category", "Sub-Category"
)
SELECT 
    "Product Name",
    "Category",
    "Sub-Category",
    total_sales,
    total_profit,
    order_count,
    margin_percent,
    CASE 
        WHEN total_profit < 0 THEN 'Убыточный'
        WHEN margin_percent < 5 THEN 'Низкая маржа'
        WHEN margin_percent BETWEEN 5 AND 15 THEN 'Средняя маржа'
        ELSE 'Высокая маржа'
    END as profit_category
FROM product_performance
WHERE total_profit < 0 OR margin_percent < 5
ORDER BY total_profit ASC
LIMIT 20;
