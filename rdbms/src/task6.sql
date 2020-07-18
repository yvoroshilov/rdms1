-- slow
SELECT YEAR(student_result.date),
       AVG(rating)
FROM student_result
     JOIN student ON student_result.student_id = student.id
     JOIN discipline ON student_result.discipline_id = discipline.id
WHERE YEAR(student_result.date) >= 2015 AND
      discipline.name = 'Maths'
GROUP BY YEAR(student_result.date)

-- fast
SELECT YEAR(student_result.date),
       AVG(rating)
FROM student_result
         JOIN student ON student_result.student_id = student.id
WHERE YEAR(student_result.date) >= 2015 AND
        (SELECT name
         FROM discipline
         WHERE discipline.id = student_result.discipline_id) = 'Math'
GROUP BY YEAR(student_result.date);

