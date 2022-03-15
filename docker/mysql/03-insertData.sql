USE timetable;

START TRANSACTION;

SET NAMES utf8mb4;

INSERT INTO `school` (`id`, `owner_id`, `full_name`, `short_name`, `year`, `days`, `emblem`, `code`) VALUES
    (1, 1, 'Roxfort Boszorkány- és Varázslóképző Szakiskola', 'Roxfort', '2021/2022', 5, 'roxfort.png', 'phoenix'),
    (2, 3, 'Egy teljesen átlagos iskola', 'Iskola', '2021/2022', 5, NULL, 'code');

-- --------------------------------------------------------

INSERT INTO `users` (`id`, `school_id`, `username`, `email`, `password`, `created_on`, `active_end`, `ip_address`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `last_login`, `active`) VALUES
    (1, 1, 'Albus Dumbledore', 'admin@admin.com', '$2y$10$hzsJ2B.y2LSu42yzB3gBMeyPIwUldqu/gefyn9gmLK570d9MBpyHm', '2000-01-01', '2100-01-01', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
    (2, 1, 'Minerva McGalagony', 'admin2@admin.com', '$2y$10$hzsJ2B.y2LSu42yzB3gBMeyPIwUldqu/gefyn9gmLK570d9MBpyHm', '2000-01-01', '2010-01-01', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
    (3, 2, 'Test User 3', 'admin3@admin.com', '$2y$10$hzsJ2B.y2LSu42yzB3gBMeyPIwUldqu/gefyn9gmLK570d9MBpyHm', '2000-01-01', '2100-01-01', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

INSERT INTO `subject` (`id`, `school_id`, `name`, `short`, `importance`, `color`) VALUES
    (1, 1, 'Asztronómia', 'Aszt', 3, '#80ffff'),
    (2, 1, 'Átváltoztatástan', 'Átv', 4, '#ff8080'),
    (3, 1, 'Bájitaltan', 'Báj', 5, '#80ff80'),
    (4, 1, 'Bűbájtan', 'Bűb', 5, '#ff80ff'),
    (5, 1, 'Gyógynövénytan', 'Növ', 4, '#008000'),
    (6, 1, 'Jóslástan', 'Jós', 2, '#808000'),
    (7, 1, 'Legendás lények gondozása', 'LLG', 4, '#ba4571'),
    (8, 1, 'Mágiatörténet', 'MT', 3, '#8080ff'),
    (9, 1, 'Mugliismeret', 'Mugl', 3, '#ffff80'),
    (10, 1, 'Párbajszakkör', 'Psz', 4, '#c0c0c0'),
    (11, 1, 'Rúnaismeret', 'Rúna', 3, '#0080ff'),
    (12, 1, 'Seprűlovaglás', 'Sepr', 2, '#800080'),
    (13, 1, 'Sötét varázslatok kivédés', 'SVK', 5, '#400000'),
    (14, 1, 'Számmisztika', 'Szám', 3, '#ff8040');

-- --------------------------------------------------------

INSERT INTO `room` (`id`, `school_id`, `name`, `members`) VALUES
    (1, 1, 'Átváltoztatástan terem', 30),
    (2, 1, 'Bájitaltan terem', 40),
    (3, 1, 'Bűbájtan terem', 100),
    (4, 1, 'Csillagvizsgáló torony', 30),
    (5, 1, 'Északi torony', 30),
    (6, 1, 'Griffendél klubhelyiség', 100),
    (7, 1, 'Hollóhát torony', 100),
    (8, 1, 'Hugrabug klubhelyiség', 100),
    (9, 1, 'Kviddicspálya', 100),
    (10, 1, 'Mágiatörténet tanterem', 30),
    (11, 1, 'Mardekár klubhelyiség', 100),
    (12, 1, 'Mugliismeret tanterem', 30),
    (13, 1, 'Nagy terem', 100),
    (14, 1, 'Növényház', 30),
    (15, 1, 'Rúnaismeret tanterem', 30),
    (16, 1, 'SVK tanterem', 30),
    (17, 1, 'Számmisztika tanterem', 30),
    (18, 1, 'Tiltott Rengeteg', 100);

INSERT INTO `room_subject` (`id`, `school_id`, `room_id`, `subject_id`) VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 3),
    (3, 1, 3, 4),
    (4, 1, 4, 1),
    (5, 1, 5, 6),
    (6, 1, 9, 12),
    (7, 1, 10, 8),
    (8, 1, 12, 9),
    (9, 1, 13, 10),
    (10, 1, 14, 5),
    (11, 1, 15, 11),
    (12, 1, 16, 13),
    (13, 1, 17, 14),
    (14, 1, 18, 7);

-- --------------------------------------------------------

INSERT INTO `teacher` (`id`, `school_id`, `name`, `lesson_number`) VALUES
    (1, 1, 'Aurora Sinistra', 5),
    (2, 1, 'Bathsheba Babbling', 30),
    (3, 1, 'Charity Burbage', 30),
    (4, 1, 'Cuthbert Binns', 30),
    (5, 1, 'Filius Flitwick', 30),
    (6, 1, 'Minerva McGalagony', 30),
    (7, 1, 'Perselus Piton', 30),
    (8, 1, 'Pomona Bimba', 30),
    (9, 1, 'Remus Lupin', 30),
    (10, 1, 'Rolanda Hooch', 30),
    (11, 1, 'Rubeus Hagrid', 30),
    (12, 1, 'Septima Vector', 30),
    (13, 1, 'Sybill Trelawney', 30);

INSERT INTO `teacher_subject` (`id`, `school_id`, `teacher_id`, `subject_id`) VALUES
    (1, 1, 1, 1),
    (2, 1, 2, 11),
    (3, 1, 3, 9),
    (4, 1, 4, 8),
    (5, 1, 5, 4),
    (6, 1, 6, 2),
    (7, 1, 7, 3),
    (8, 1, 7, 10),
    (9, 1, 8, 5),
    (10, 1, 9, 13),
    (11, 1, 10, 12),
    (12, 1, 11, 7),
    (13, 1, 12, 14),
    (14, 1, 13, 6);

-- --------------------------------------------------------

INSERT INTO `class` (`id`, `school_id`, `name`, `year`, `teacher_id`, `room_id`, `members`) VALUES
    (1, 1, '1 Griffendél', 1, 6, 6, 20),
    (2, 1, '1 Hollóhát', 1, 5, 7, 20),
    (3, 1, '1 Hugrabug', 1, 8, 8, 20),
    (4, 1, '1 Mardekár', 1, 7, 11, 20),
    (5, 1, '2 Griffendél', 2, 6, 6, 20),
    (6, 1, '2 Hollóhát', 2, 5, 7, 20),
    (7, 1, '2 Hugrabug', 2, 8, 8, 20),
    (8, 1, '2 Mardekár', 2, 7, 11, 20),
    (9, 1, '3 Griffendél', 3, 6, 6, 20),
    (10, 1, '3 Hollóhát', 3, 5, 7, 20),
    (11, 1, '3 Hugrabug', 3, 8, 8, 20),
    (12, 1, '3 Mardekár', 3, 7, 11, 20),
    (13, 1, '4 Griffendél', 4, 6, 6, 20),
    (14, 1, '4 Hollóhát', 4, 5, 7, 20),
    (15, 1, '4 Hugrabug', 4, 8, 8, 20),
    (16, 1, '4 Mardekár', 4, 7, 11, 20),
    (17, 1, '5 Griffendél', 5, 6, 6, 20),
    (18, 1, '5 Hollóhát', 5, 5, 7, 20),
    (19, 1, '5 Hugrabug', 5, 8, 8, 20),
    (20, 1, '5 Mardekár', 5, 7, 11, 20),
    (21, 1, '6 Griffendél', 6, 6, 6, 20),
    (22, 1, '6 Hollóhát', 6, 5, 7, 20),
    (23, 1, '6 Hugrabug', 6, 8, 8, 20),
    (24, 1, '6 Mardekár', 6, 7, 11, 20),
    (25, 1, '7 Griffendél', 7, 6, 6, 20),
    (26, 1, '7 Hollóhát', 7, 5, 7, 20),
    (27, 1, '7 Hugrabug', 7, 8, 8, 20),
    (28, 1, '7 Mardekár', 7, 7, 11, 20);

-- --------------------------------------------------------

INSERT INTO `lesson` (`id`, `school_id`, `subject_id`, `class_id`, `teacher_id`, `room_id`, `fix_room`, `fix_time`, `day`, `time`, `year`) VALUES
    (1, 1, NULL, NULL, 2, NULL, 0, 1, 1, 7, NULL),
    (2, 1, NULL, NULL, 2, NULL, 0, 1, 2, 7, NULL),
    (3, 1, NULL, NULL, 2, NULL, 0, 1, 3, 7, NULL),
    (4, 1, NULL, NULL, 2, NULL, 0, 1, 4, 7, NULL),
    (5, 1, NULL, NULL, 2, NULL, 0, 1, 5, 7, NULL),
    (6, 1, NULL, NULL, 3, NULL, 0, 1, 1, 7, NULL),
    (7, 1, NULL, NULL, 3, NULL, 0, 1, 2, 7, NULL),
    (8, 1, NULL, NULL, 3, NULL, 0, 1, 3, 7, NULL),
    (9, 1, NULL, NULL, 3, NULL, 0, 1, 4, 7, NULL),
    (10, 1, NULL, NULL, 3, NULL, 0, 1, 5, 7, NULL),
    (11, 1, NULL, NULL, 4, NULL, 0, 1, 1, 7, NULL),
    (12, 1, NULL, NULL, 4, NULL, 0, 1, 2, 7, NULL),
    (13, 1, NULL, NULL, 4, NULL, 0, 1, 3, 7, NULL),
    (14, 1, NULL, NULL, 4, NULL, 0, 1, 4, 7, NULL),
    (15, 1, NULL, NULL, 4, NULL, 0, 1, 5, 7, NULL),
    (16, 1, NULL, NULL, 5, NULL, 0, 1, 1, 7, NULL),
    (17, 1, NULL, NULL, 5, NULL, 0, 1, 2, 7, NULL),
    (18, 1, NULL, NULL, 5, NULL, 0, 1, 3, 7, NULL),
    (19, 1, NULL, NULL, 5, NULL, 0, 1, 4, 7, NULL),
    (20, 1, NULL, NULL, 5, NULL, 0, 1, 5, 7, NULL),
    (21, 1, NULL, NULL, 6, NULL, 0, 1, 1, 7, NULL),
    (22, 1, NULL, NULL, 6, NULL, 0, 1, 2, 7, NULL),
    (23, 1, NULL, NULL, 6, NULL, 0, 1, 3, 7, NULL),
    (24, 1, NULL, NULL, 6, NULL, 0, 1, 4, 7, NULL),
    (25, 1, NULL, NULL, 6, NULL, 0, 1, 5, 7, NULL),
    (26, 1, NULL, NULL, 7, NULL, 0, 1, 1, 7, NULL),
    (27, 1, NULL, NULL, 7, NULL, 0, 1, 2, 7, NULL),
    (28, 1, NULL, NULL, 7, NULL, 0, 1, 3, 7, NULL),
    (29, 1, NULL, NULL, 7, NULL, 0, 1, 4, 7, NULL),
    (30, 1, NULL, NULL, 7, NULL, 0, 1, 5, 7, NULL),
    (31, 1, NULL, NULL, 8, NULL, 0, 1, 1, 7, NULL),
    (32, 1, NULL, NULL, 8, NULL, 0, 1, 2, 7, NULL),
    (33, 1, NULL, NULL, 8, NULL, 0, 1, 3, 7, NULL),
    (34, 1, NULL, NULL, 8, NULL, 0, 1, 4, 7, NULL),
    (35, 1, NULL, NULL, 8, NULL, 0, 1, 5, 7, NULL),
    (36, 1, NULL, NULL, 9, NULL, 0, 1, 1, 7, NULL),
    (37, 1, NULL, NULL, 9, NULL, 0, 1, 2, 7, NULL),
    (38, 1, NULL, NULL, 9, NULL, 0, 1, 3, 7, NULL),
    (39, 1, NULL, NULL, 9, NULL, 0, 1, 4, 7, NULL),
    (40, 1, NULL, NULL, 9, NULL, 0, 1, 5, 7, NULL),
    (41, 1, NULL, NULL, 10, NULL, 0, 1, 1, 7, NULL),
    (42, 1, NULL, NULL, 10, NULL, 0, 1, 2, 7, NULL),
    (43, 1, NULL, NULL, 10, NULL, 0, 1, 3, 7, NULL),
    (44, 1, NULL, NULL, 10, NULL, 0, 1, 4, 7, NULL),
    (45, 1, NULL, NULL, 10, NULL, 0, 1, 5, 7, NULL),
    (46, 1, NULL, NULL, 11, NULL, 0, 1, 1, 7, NULL),
    (47, 1, NULL, NULL, 11, NULL, 0, 1, 2, 7, NULL),
    (48, 1, NULL, NULL, 11, NULL, 0, 1, 3, 7, NULL),
    (49, 1, NULL, NULL, 11, NULL, 0, 1, 4, 7, NULL),
    (50, 1, NULL, NULL, 11, NULL, 0, 1, 5, 7, NULL),
    (51, 1, NULL, NULL, 12, NULL, 0, 1, 1, 7, NULL),
    (52, 1, NULL, NULL, 12, NULL, 0, 1, 2, 7, NULL),
    (53, 1, NULL, NULL, 12, NULL, 0, 1, 3, 7, NULL),
    (54, 1, NULL, NULL, 12, NULL, 0, 1, 4, 7, NULL),
    (55, 1, NULL, NULL, 12, NULL, 0, 1, 5, 7, NULL),
    (56, 1, NULL, NULL, 13, NULL, 0, 1, 1, 7, NULL),
    (57, 1, NULL, NULL, 13, NULL, 0, 1, 2, 7, NULL),
    (58, 1, NULL, NULL, 13, NULL, 0, 1, 3, 7, NULL),
    (59, 1, NULL, NULL, 13, NULL, 0, 1, 4, 7, NULL),
    (60, 1, NULL, NULL, 13, NULL, 0, 1, 5, 7, NULL),
    (61, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 1),
    (62, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 1),
    (63, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 1),
    (64, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 1),
    (65, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 1),
    (66, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 1),
    (67, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 1),
    (68, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 1),
    (69, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 1),
    (70, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 1),
    (71, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 1),
    (72, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 1),
    (73, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 1),
    (74, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 1),
    (75, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 1),
    (76, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 1),
    (77, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 1),
    (78, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 1),
    (79, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 1),
    (80, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 1),
    (81, 1, 12, NULL, 10, 9, 0, 0, 0, 0, 1),
    (82, 1, 12, NULL, 10, 9, 0, 0, 0, 0, 1),
    (83, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 1),
    (84, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 1),
    (85, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 2),
    (86, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 2),
    (87, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 2),
    (88, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 2),
    (89, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 2),
    (90, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 2),
    (91, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 2),
    (92, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 2),
    (93, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 2),
    (94, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 2),
    (95, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 2),
    (96, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 2),
    (97, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 2),
    (98, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 2),
    (99, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 2),
    (100, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 2),
    (101, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 2),
    (102, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 2),
    (103, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 2),
    (104, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 2),
    (105, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 2),
    (106, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 2),
    (107, 1, 12, NULL, 10, 9, 0, 0, 0, 0, 2),
    (108, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 2),
    (109, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 2),
    (110, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 2),
    (111, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 2),
    (112, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 2),
    (113, 1, 1, NULL, 1, 4, 0, 1, 1, 7, 3),
    (114, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 3),
    (115, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 3),
    (116, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 3),
    (117, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 3),
    (118, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 3),
    (119, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 3),
    (120, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 3),
    (121, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 3),
    (122, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 3),
    (123, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 3),
    (124, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 3),
    (125, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 3),
    (126, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 3),
    (127, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 3),
    (128, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 3),
    (129, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 3),
    (130, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 3),
    (131, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 3),
    (132, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 3),
    (133, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 3),
    (134, 1, 10, NULL, 7, 13, 0, 0, 0, 0, 3),
    (135, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 3),
    (136, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 3),
    (137, 1, 12, NULL, 10, 9, 0, 0, 0, 0, 3),
    (138, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 3),
    (139, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 3),
    (140, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 3),
    (141, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 3),
    (142, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 3),
    (143, 1, 1, NULL, 1, 4, 0, 1, 2, 7, 4),
    (144, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 4),
    (145, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 4),
    (146, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 4),
    (147, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 4),
    (148, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 4),
    (149, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 4),
    (150, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 4),
    (151, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 4),
    (152, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 4),
    (153, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 4),
    (154, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 4),
    (155, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 4),
    (156, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 4),
    (157, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 4),
    (158, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 4),
    (159, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 4),
    (160, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 4),
    (161, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 4),
    (162, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 4),
    (163, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 4),
    (164, 1, 10, NULL, 7, 13, 0, 0, 0, 0, 4),
    (165, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 4),
    (166, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 4),
    (167, 1, 12, NULL, 10, 9, 0, 0, 0, 0, 4),
    (168, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 4),
    (169, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 4),
    (170, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 4),
    (171, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 4),
    (172, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 4),
    (173, 1, 1, NULL, 1, 4, 0, 1, 3, 7, 5),
    (174, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 5),
    (175, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 5),
    (176, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 5),
    (177, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 5),
    (178, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 5),
    (179, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 5),
    (180, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 5),
    (181, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 5),
    (182, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 5),
    (183, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 5),
    (184, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 5),
    (185, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 5),
    (186, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 5),
    (187, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 5),
    (188, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 5),
    (189, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 5),
    (190, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 5),
    (191, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 5),
    (192, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 5),
    (193, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 5),
    (194, 1, 10, NULL, 7, 13, 0, 0, 0, 0, 5),
    (195, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 5),
    (196, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 5),
    (197, 1, 12, NULL, 10, 9, 0, 0, 0, 0, 5),
    (198, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 5),
    (199, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 5),
    (200, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 5),
    (201, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 5),
    (202, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 5),
    (203, 1, 1, NULL, 1, 4, 0, 1, 4, 7, 6),
    (204, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 6),
    (205, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 6),
    (206, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 6),
    (207, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 6),
    (208, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 6),
    (209, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 6),
    (210, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 6),
    (211, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 6),
    (212, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 6),
    (213, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 6),
    (214, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 6),
    (215, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 6),
    (216, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 6),
    (217, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 6),
    (218, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 6),
    (219, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 6),
    (220, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 6),
    (221, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 6),
    (222, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 6),
    (223, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 6),
    (224, 1, 10, NULL, 7, 13, 0, 0, 0, 0, 6),
    (225, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 6),
    (226, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 6),
    (227, 1, 12, NULL, 10, 9, 0, 0, 0, 0, 6),
    (228, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 6),
    (229, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 6),
    (230, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 6),
    (231, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 6),
    (232, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 6),
    (233, 1, 1, NULL, 1, 4, 0, 1, 5, 7, 7),
    (234, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 7),
    (235, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 7),
    (236, 1, 2, NULL, 6, 1, 0, 0, 0, 0, 7),
    (237, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 7),
    (238, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 7),
    (239, 1, 3, NULL, 7, 2, 0, 0, 0, 0, 7),
    (240, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 7),
    (241, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 7),
    (242, 1, 4, NULL, 5, 3, 0, 0, 0, 0, 7),
    (243, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 7),
    (244, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 7),
    (245, 1, 5, NULL, 8, 14, 0, 0, 0, 0, 7),
    (246, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 7),
    (247, 1, 6, NULL, 13, 5, 0, 0, 0, 0, 7),
    (248, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 7),
    (249, 1, 7, NULL, 11, 18, 0, 0, 0, 0, 7),
    (250, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 7),
    (251, 1, 8, NULL, 4, 10, 0, 0, 0, 0, 7),
    (252, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 7),
    (253, 1, 9, NULL, 3, 12, 0, 0, 0, 0, 7),
    (254, 1, 10, NULL, 7, 13, 0, 0, 0, 0, 7),
    (255, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 7),
    (256, 1, 11, NULL, 2, 15, 0, 0, 0, 0, 7),
    (257, 1, 12, NULL, 10, 9, 0, 0, 0, 0, 7),
    (258, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 7),
    (259, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 7),
    (260, 1, 13, NULL, 9, 16, 0, 0, 0, 0, 7),
    (261, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 7),
    (262, 1, 14, NULL, 12, 17, 0, 0, 0, 0, 7);

INSERT INTO `event` (`id`, `school_id`, `name`, `start`, `end`) VALUES
    (1, 1, 'Évnyitó, beosztási ceremónia', '2021-09-01', NULL),
    (2, 1, 'Trimágus Tusa 1. próba', '2021-10-20', NULL),
    (3, 1, 'Kviddics: Griffendél vs. Mardekár', '2021-11-05', NULL),
    (4, 1, 'Kviddics: Hugrabug vs. Hollóhát', '2021-11-25', NULL),
    (5, 1, 'Téli szünet', '2021-12-22', '2022-01-02'),
    (6, 1, 'Trimágus Tusa Bál', '2021-12-24', NULL),
    (7, 1, 'Kviddics: Hollóhát vs. Mardekár', '2022-01-10', NULL),
    (8, 1, 'Kviddics: Griffendél vs. Hugrabug', '2022-02-20', NULL),
    (9, 1, 'Trimágus Tusa 2. próba', '2022-03-20', NULL),
    (10, 1, 'Kviddics: Hugrabug vs. Mardekár', '2022-05-05', NULL),
    (11, 1, 'Kviddics: Griffendél vs. Hollóhát', '2022-05-25', NULL),
    (12, 1, 'Vizsgaidőszak', '2022-06-01', '2022-06-30'),
    (13, 1, 'Trimágus Tusa 3. próba', '2022-06-20', NULL),
    (14, 1, 'Évzáró', '2022-06-30', NULL);

INSERT INTO `time` (`id`, `school_id`, `start`, `end`) VALUES
    (1, 1, '09:00', '10:00'),
    (2, 1, '10:15', '11:15'),
    (3, 1, '11:30', '12:30'),
    (4, 1, '13:30', '14:30'),
    (5, 1, '14:45', '15:45'),
    (6, 1, '16:00', '17:00'),
    (7, 1, '23:30', '00:30');

COMMIT;