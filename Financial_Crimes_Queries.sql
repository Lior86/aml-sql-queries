High-Value Transactions by Age and Transaction Type in the Last 90 Days:

SELECT 
    customer_id,
    age,
    transaction_type,
    amount,
    location,
    transaction_date
FROM 
    transactions
WHERE 
    transaction_date BETWEEN CURRENT_DATE - INTERVAL 90 DAY AND CURRENT_DATE
    AND amount > 10000
    AND transaction_type IN ('Wire Transfer', 'Cash Deposit')
ORDER BY 
    transaction_date DESC;


Transactions to High-Risk/Tax Haven Countries:

SELECT 
    t.customer_id,
    t.amount,
    t.transaction_date,
    r.destination_country
FROM 
    transactions t
JOIN 
    recipients r ON t.recipient_id = r.id
WHERE 
    r.destination_country IN ('Panama', 'Cayman Islands', 'Luxembourg', 'Switzerland')
    AND t.transaction_type = 'Wire Transfer'
    AND t.amount > 20000;


Incoming Wires from Bordering Countries (Canada/Mexico):

SELECT 
    t.customer_id,
    c.country_of_origin,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM 
    transactions t
JOIN 
    customers c ON t.customer_id = c.id
WHERE 
    transaction_type = 'Incoming Wire'
    AND c.country_of_origin IN ('Canada', 'Mexico')
    AND t.transaction_date BETWEEN '2025-01-01' AND '2025-03-31';

Transactions by Demographics and Risk Location:

SELECT 
    customer_id,
    age,
    gender,
    location,
    transaction_type,
    amount,
    transaction_date
FROM 
    transactions
WHERE 
    location IN ('Dubai', 'Panama City', 'Zurich')
    AND age BETWEEN 25 AND 40
    AND amount > 15000
    AND transaction_type = 'Wire Transfer';
