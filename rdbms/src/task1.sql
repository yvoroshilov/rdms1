SELECT first_name,
       last_name,
       rating
FROM student
     JOIN class ON student.class_id = class.id
     JOIN exam_result ON student.id = exam_result.student_id
     JOIN exam ON exam_result.exam_id = exam.id
     JOIN discipline ON exam.discipline_id = discipline.id
WHERE discipline.name = 'RDBMS' AND
      class.id = 1 AND
      exam_result.rating >= 4
ORDER BY exam_result.rating DESC;
