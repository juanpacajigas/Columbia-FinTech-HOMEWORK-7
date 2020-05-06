-- How can you isolate (or group) the transactions of each cardholder?
SELECT card_holder_id, creat_date, amount, card_number, merchant_id
FROM credit_card
LEFT JOIN transaction 
    ON card = card_number
ORDER BY card_holder_id ASC;


--Consider the time period 7:00 a.m. to 9:00 a.m.
    --What are the 100 highest transactions during this time period?
SELECT EXTRACT (hour FROM creat_date ) AS hour_transaction, 
EXTRACT (minute FROM creat_date ) AS minute_transaction,
amount, transactions_id, card_number, merchant_id
FROM transaction
WHERE EXTRACT (hour FROM creat_date ) BETWEEN 7 AND 8= true
ORDER BY amount DESC
LIMIT 100;
    --Do you see any fraudulent or anomalous transactions?
        -- Yes I do
    --If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.
        -- There are transactions done with the same credit card at different merchants and with only one minute of difference. One example
        -- is credit card 6500236164848279. There are transactions done at 7:40AM, 7:41AM, and 7:42AM. The three transactions were done at 
        -- different merchants.
        
--Some fraudsters hack a credit card by making several small payments (generally less than  2.00),𝑤ℎ𝑖𝑐ℎ 𝑎𝑟𝑒 𝑡𝑦𝑝𝑖𝑐𝑎𝑙𝑙𝑦 𝑖𝑔𝑛𝑜𝑟𝑒𝑑 𝑏𝑦 𝑐𝑎𝑟𝑑ℎ𝑜𝑙𝑑𝑒𝑟𝑠.𝐶𝑜𝑢𝑛𝑡 
--𝑡ℎ𝑒 𝑡𝑟𝑎𝑛𝑠𝑎𝑐𝑡𝑖𝑜𝑛𝑠 𝑡ℎ𝑎𝑡 𝑎𝑟𝑒 𝑙𝑒𝑠𝑠 𝑡ℎ𝑎𝑛 2.00 per cardholder. Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.    
SELECT card_number, amount, merchant_id ,creat_date
FROM transaction
WHERE amount < 2
ORDER BY merchant_id DESC  

--What are the top five merchants prone to being hacked using small transactions?
SELECT merchant_id, count(merchant_id) AS count_merchant
FROM transaction
WHERE amount < 2
GROUP BY merchant_id
ORDER BY count_merchant DESC
LIMIT 5


