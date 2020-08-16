/* prerequisites
 * Найти уникальных студ. по фамилиям.
 * 4 варианта запроса
 * 1) Каждый посл. вар. запроса не имеет права использовать те констр. SQL которые были в пред. вар.
 * 2) Чистый SQL без особенностей диалектов. Должен работать на всех субд
 * 3) Нельзя исп. врем. таблицы, хранимые проц и т.п.
 */

-- 1
SELECT *
FROM student
GROUP BY student.last_name
HAVING COUNT(*) = 1;

-- 2
SELECT *
FROM student st1
WHERE (SELECT COUNT(*)
       FROM student st2
       WHERE st1.last_name = st2.last_name) = 1;

-- 3
SELECT *
FROM student st1
WHERE NOT EXISTS(SELECT *
                 FROM student st2
                 WHERE st1.id != st2.id AND
                       st1.last_name = st2.last_name);
-- 4
SELECT *
FROM student st1
     LEFT JOIN (SELECT st2.last_name, st2.id
                 FROM student st2
                 GROUP BY last_name
                 HAVING COUNT(*) > 1) st2 ON st1.last_name = st2.last_name
WHERE st2.id IS NULL;
