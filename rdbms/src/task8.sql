-- very slow
SELECT teacher.last_name,
       teacher_degree.name,
       t.avg
FROM (SELECT AVG(student_result.rating) avg,
             teacher_discipline.teacher_id
      FROM student_result
           JOIN teacher_discipline ON student_result.discipline_id = teacher_discipline.discipline_id
      GROUP BY student_result.discipline_id LIMIT 3) t
     JOIN teacher ON teacher.id = t.teacher_id
     JOIN teacher_degree ON teacher.teacher_degree_id = teacher_degree.id
ORDER BY t.avg DESC;

-- almost two times faster
SELECT teacher.last_name,
       teacher_degree.name
FROM student_result
     JOIN teacher_discipline ON student_result.discipline_id = teacher_discipline.discipline_id
     JOIN teacher ON teacher.id = teacher_discipline.teacher_id
     JOIN teacher_degree ON teacher.teacher_degree_id = teacher_degree.id
GROUP BY student_result.discipline_id
ORDER BY AVG(student_result.rating) DESC
LIMIT 3
