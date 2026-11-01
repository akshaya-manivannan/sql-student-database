-- Fictional sample data

INSERT INTO students (student_id, first_name, last_name, email, enrolled_year) VALUES
(1, 'Nimal',  'Perera',    'nimal.perera@example.com',   2024),
(2, 'Anika',  'Fernando',  'anika.fernando@example.com', 2024),
(3, 'Kavin',  'Raj',       'kavin.raj@example.com',      2025),
(4, 'Sara',   'Silva',     'sara.silva@example.com',     2025),
(5, 'Dilan',  'Jayasuriya','dilan.j@example.com',        2025),
(6, 'Meera',  'Nair',      'meera.nair@example.com',     2026),
(7, 'Ruwan',  'Bandara',   'ruwan.b@example.com',        2026),
(8, 'Tharu',  'Weerasinghe','tharu.w@example.com',       2026);

INSERT INTO courses (course_id, course_name, credits) VALUES
(1, 'Databases',              4),
(2, 'Software Testing',       3),
(3, 'Web Development',        3),
(4, 'Python Programming',     4),
(5, 'Information Design',     2);

INSERT INTO enrollments (enrollment_id, student_id, course_id, grade, semester) VALUES
(1,  1, 1, 82, '2025-S1'),
(2,  1, 2, 74, '2025-S1'),
(3,  2, 1, 91, '2025-S1'),
(4,  2, 3, 68, '2025-S2'),
(5,  3, 1, 55, '2025-S2'),
(6,  3, 4, 62, '2025-S2'),
(7,  4, 2, 88, '2026-S1'),
(8,  4, 5, 79, '2026-S1'),
(9,  5, 3, 71, '2026-S1'),
(10, 5, 4, NULL, '2026-S2'),
(11, 6, 1, 94, '2026-S2'),
(12, 6, 2, 85, '2026-S2'),
(13, 7, 5, 60, '2026-S2');
-- Student 8 (Tharu) has no enrollments on purpose, for the LEFT JOIN query.
