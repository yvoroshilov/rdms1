SELECT speciality.name
FROM student
     JOIN class ON student.class_id = class.id
     JOIN speciality ON class.speciality_id = speciality.id
WHERE student.gender = 'famale'
GROUP BY speciality_id
ORDER BY COUNT(*) DESC
LIMIT 2;
