SELECT YEAR(student_result.date)
FROM student_result
     JOIN discipline ON student_result.discipline_id = discipline.id
GROUP BY YEAR(student_result.date)
ORDER BY AVG(student_result.rating) DESC
LIMIT 1