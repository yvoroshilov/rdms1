SELECT first_name,
       last_name
FROM student st1
     JOIN student_result str1 ON st1.id = str1.student_id
GROUP BY st1.id
HAVING AVG(str1.rating) >= (SELECT AVG(str2.rating)
                            FROM student_result str2)


