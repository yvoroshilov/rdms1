SELECT first_name,
       last_name,
       student.id
FROM student
     JOIN student_result ON student.id = student_result.student_id
WHERE student_result.rating = 5
GROUP BY student.id
LIMIT 5
