SELECT COUNT(*)
FROM student
     JOIN exam_result ON student.id = exam_result.student_id
     JOIN exam ON exam_result.exam_id = exam.id
WHERE exam.discipline_id = 10 AND
      student.class_id = 2 AND
      exam_result.rating IN (4, 5)