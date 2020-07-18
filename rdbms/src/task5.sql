-- slow
SELECT COUNT(DISTINCT teacher_id)
FROM (SELECT *
      FROM teacher_discipline
      WHERE YEAR(teacher_discipline.begin_date) = 2020
      GROUP BY teacher_discipline.teacher_id
      HAVING COUNT(*) > 1) t;

-- faster
SELECT COUNT(DISTINCT(teacher_id))
FROM teacher_discipline td1
WHERE (SELECT COUNT(*)
       FROM teacher_discipline td2
       WHERE td1.teacher_id = td2.teacher_id) > 1;

-- identical to the previous
SELECT COUNT(*) OVER()
FROM teacher_discipline td1
WHERE (SELECT COUNT(*)
       FROM teacher_discipline td2
       WHERE td1.teacher_id = td2.teacher_id) > 1
GROUP BY td1.teacher_id
LIMIT 1
