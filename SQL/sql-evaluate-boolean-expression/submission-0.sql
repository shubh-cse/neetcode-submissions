-- Write your query below
SELECT e.*,
CASE 
    WHEN e.operator = '>' THEN vl.value > vr.value
    WHEN e.operator = '<' THEN vl.value < vr.value
    ELSE vl.value = vr.value 
    END AS value
FROM variables vl JOIN expressions e
ON vl.name = e.left_operand
JOIN variables vr
ON vr.name = e.right_operand