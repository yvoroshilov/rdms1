SELECT DISTINCT COUNT(*) OVER()
FROM teacher_discipline
WHERE YEAR(teacher_discipline.begin_date) = 2020
GROUP BY teacher_discipline.teacher_id
HAVING COUNT(teacher_discipline.discipline_id) > 1;
