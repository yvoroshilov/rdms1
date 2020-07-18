SELECT COUNT(*)
FROM student
     JOIN exam_result ON student.id = exam_result.student_id
     JOIN exam ON exam_result.exam_id = exam.id
     JOIN discipline ON exam.discipline_id = discipline.id
WHERE discipline.name = 'Mathematical Physics' AND
      student.class_id = 2 AND
      exam_result.rating IN (4, 5)