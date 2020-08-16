SELECT YEAR(student_result.date),
       AVG(rating)
FROM student_result
         JOIN student ON student_result.student_id = student.id
WHERE YEAR(student_result.date) >= 2015 AND
      student_result.discipline_id = 5
GROUP BY YEAR(student_result.date);

