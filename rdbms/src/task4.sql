SELECT first_name,
       last_name
FROM student st1
     JOIN student_result str1 ON st1.id = str1.student_id
WHERE (SELECT AVG(str2.rating)
       FROM student st2
            JOIN student_result str2 ON st2.id = str2.student_id
       WHERE st2.id = st1.id) >= (SELECT AVG(str3.rating)
                                  FROM student_result str3)
GROUP BY st1.id


