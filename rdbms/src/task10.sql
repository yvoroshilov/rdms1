SELECT COUNT(DISTINCT(student.id))
FROM student
     JOIN exam_result ON student.id = exam_result.student_id
     JOIN exam ON exam_result.exam_id = exam.id
GROUP BY exam_result.student_id,
         exam.discipline_id,
         exam.class_id
HAVING COUNT(*) > 1;
