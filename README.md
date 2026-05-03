SELECT 
    CASE 
        WHEN prod.proName IN ('Over Draft', 'BIL-OD') 
            THEN 'Business Overdraft'

        WHEN prod.proName IN ('BIL', 'BIL(105%)', 'BFS-R/L') 
            THEN 'Business Installment Loan'

        WHEN prod.proName IN ('LAP-Term Loan', 'LAP-OD') 
            THEN 'Loan Against Property'

        WHEN prod.proName = 'IFAP' 
            THEN 'Saadiq Finance Against Property'

        WHEN prod.proName = 'SCM' 
            THEN 'Saadiq Commercial Mortgage'

        WHEN prod.proName = 'IBIF' 
            THEN 'Saadiq Business Instal Finance'

        ELSE prod.proName
    END AS ProductCategory
FROM product prod;
