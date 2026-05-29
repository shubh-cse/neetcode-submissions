-- Write your query below
WITH cte_exam AS(
SELECT *, RANK() OVER(PARTITION BY student_id ORDER BY score DESC, exam_id) AS rnk
FROM exam_results)
SELECT student_id, exam_id, score
FROM cte_exam
where rnk = 1
ORDER BY student_id;