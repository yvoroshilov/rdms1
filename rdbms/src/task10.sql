SELECT last_name,
    SUM(IF(exam_result.rating >= 4, 1, 0)) passed,
    SUM(IF(exam_result.rating >= 4, 0, 1)) not_passed
FROM student
         JOIN exam_result ON student.id = exam_result.student_id
         JOIN exam ON exam_result.exam_id = exam.id
GROUP BY student.id,
     exam.discipline_id,
     YEAR(exam.date)
HAVING (passed > 0 AND not_passed > 0) OR
       (not_passed > 2)
