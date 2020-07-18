SELECT COUNT(*) cnt, speciality.name
FROM (SELECT class.speciality_id
      FROM student
           JOIN class ON student.class_id = class.id
      WHERE student.gender = 'famale') t
     JOIN speciality ON speciality.id = t.speciality_id
GROUP BY t.speciality_id
ORDER BY cnt DESC
LIMIT 2;

SELECT COUNT(*) cnt, speciality.name
FROM student
     JOIN class ON student.class_id = class.id
     JOIN speciality ON class.speciality_id = speciality.id
WHERE student.gender = 'famale'
GROUP BY speciality_id
ORDER BY cnt DESC
LIMIT 2;

-- IDENTICAL
