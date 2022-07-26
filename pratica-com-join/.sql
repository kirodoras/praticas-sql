-- Questão 1:
SELECT users.id, users.name, cities.name AS city
FROM users 
JOIN cities 
ON cities.name = 'Rio de Janeiro';

--Questão 2:
SELECT testimonials.id, w.name AS writer, r.name AS recipient, testimonials.message
FROM testimonials
JOIN users w
ON w.id = testimonials."writerId"
JOIN users r
ON r.id = testimonials."recipientId";

--Questão 3:
SELECT u.id, u.name, co.name AS course, s.name AS school, e."endDate"
FROM users u
JOIN educations e
ON u.id = 30 AND u.id = e."userId" AND e.status = 'finished'
JOIN courses co
ON e."courseId" = co.id
JOIN schools s
ON e."schoolId" = s.id;

--Questão 4:
SELECT u.id, u.name,r.name AS role, comp.name AS company, ex."startDate"
FROM users u
JOIN experiences ex
ON u.id = 50 AND u.id = ex."userId" AND ex."endDate" IS NULL
JOIN companies comp
ON ex."companyId" = comp.id
JOIN roles r
ON ex."roleId" = r.id;

--Questão Bônus:
SELECT s.id, s.name AS school, courses.name AS course, c.name AS company, r.name AS role
FROM users u
JOIN applicants a
ON a."userId" = u.id
JOIN jobs j
ON a."jobId" = j.id
JOIN companies c
ON j."companyId" = c.id
JOIN roles r
ON j."roleId" = r.id AND r.id = 2
JOIN educations e
ON u.id = e."userId"
JOIN schools s
ON e."schoolId" = s.id
JOIN courses
ON e."courseId" = courses.id;