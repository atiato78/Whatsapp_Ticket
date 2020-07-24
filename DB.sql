SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 
--

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(8) NOT NULL,
  `foreign_instructor_id` int(6) DEFAULT NULL,
  `foreign_material_id` int(3) NOT NULL,
  `foreign_class_id` int(5) NOT NULL,
  `chapter_number` varchar(12) CHARACTER SET utf8 NOT NULL,
  `chapter_subject` varchar(40) CHARACTER SET utf8 NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(5) NOT NULL,
  `class_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `class_section` varchar(2) CHARACTER SET utf8 NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`id`, `class_name`, `class_section`, `creation_date`) VALUES
(1, 'brevet', 'A', '2020-04-18 14:20:01'),
(2, 'brevet', 'B', '2020-04-18 14:20:18'),
(3, 'brevet', 'C', '2020-04-18 14:20:33'),
(4, 'terminal (GS)', 'A', '2020-04-18 14:21:29'),
(5, 'terminal (GS)', 'B', '2020-04-18 14:21:41'),
(6, 'terminal (GS)', 'C', '2020-04-18 14:21:54'),
(7, 'terminal (LS)', 'A', '2020-04-18 14:22:08'),
(8, 'terminal (LS)', 'B', '2020-04-18 14:22:21'),
(9, 'terminal (LS)', 'C', '2020-04-18 14:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` int(3) NOT NULL,
  `class` varchar(20) CHARACTER SET utf8 NOT NULL,
  `lang` varchar(2) CHARACTER SET utf8 NOT NULL,
  `material_name` varchar(20) CHARACTER SET utf8 NOT NULL,
  `cover_image` varchar(30) CHARACTER SET utf8 NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `class`, `lang`, `material_name`, `cover_image`, `creation_date`) VALUES
(1, 'brevet', 'en', 'Physics', '9thphysics-en.jpg', '2020-04-15 10:44:39'),
(2, 'brevet', 'en', 'Biology', '9thbiology-en.jpg', '2020-04-15 10:46:43'),
(3, 'brevet', 'en', 'Mathematics', '9thmath-en.jpg', '2020-04-15 10:54:34'),
(4, 'brevet', 'en', 'Chemistry', '9thchemistry-en.jpg', '2020-04-15 11:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `materials_instructors`
--

CREATE TABLE `materials_instructors` (
  `id` int(5) NOT NULL,
  `foreign_material_id` int(3) NOT NULL,
  `foreign_class_id` int(5) NOT NULL,
  `foreign_instructor_id` int(6) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `materials_instructors`
--

INSERT INTO `materials_instructors` (`id`, `foreign_material_id`, `foreign_class_id`, `foreign_instructor_id`, `creation_date`) VALUES
(1, 1, 1, 1, '2020-04-16 01:21:51'),
(2, 3, 1, 2, '2020-04-16 01:23:35'),
(3, 1, 2, 2, '2020-04-16 01:23:57'),
(9, 4, 2, 1, '2020-04-20 07:49:22'),
(11, 3, 4, 2, '2020-04-20 13:54:47'),
(12, 4, 1, 3, '2020-04-20 14:11:28'),
(13, 2, 2, 3, '2020-04-20 14:12:43');

-- --------------------------------------------------------



--
-- Table structure for table `session_content_images`
--

CREATE TABLE `session_content_images` (
  `id` int(8) NOT NULL,
  `foreign_class_id` int(5) NOT NULL,
  `foreign_material_id` int(3) NOT NULL,
  `foreign_chapter_id` int(8) NOT NULL,
  `image_title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `session_image` varchar(50) CHARACTER SET utf8 NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- --------------------------------------------------------

--
-- Table structure for table `session_content_voices`
--

CREATE TABLE `session_content_voices` (
  `id` int(8) NOT NULL,
  `foreign_class_id` int(5) NOT NULL,
  `foreign_material_id` int(3) NOT NULL,
  `foreign_chapter_id` int(8) NOT NULL,
  `foreign_image_id` int(8) NOT NULL,
  `session_voice` varchar(50) CHARACTER SET utf8 NOT NULL,
  `duration` int(3) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(6) NOT NULL,
  `name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `username` varchar(40) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_class_id` int(5) NOT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`, `foreign_class_id`, `status`, `logo`, `type`, `token`, `creation_date`) VALUES
(1, 'Ahmad Musslimany', 'ahmad_muslimany', '12345', 0, 'active', 'noimage.jpg', 'instructor', '--', '2020-04-04 01:28:08'),
(2, 'Hisham Muslimany', 'hisham_muslimany', '12345', 0, 'active', 'hm.jpg', 'instructor', '--', '2020-04-04 01:28:50'),
(6, 'Maher Chahlawi', 'maher_chahlawi', '12345', 0, 'active', 'mc.jpg', 'instructor', '--', '2020-04-14 09:48:36'),
(3, 'Omar Atia', 'omar_atia', '12345', 0, 'active', 'oa.jpg', 'instructor', '--', '2020-04-04 01:29:27'),
(7, 'student_a1', 'student_a1', 'student_a1', 1, 'active', 'noimage.jpg', 'student', '--', '2020-04-15 23:22:27'),
(8, 'student_a2', 'student_a2', 'student_a2', 1, 'active', 'noimage.jpg', 'student', '--', '2020-04-16 01:26:53'),
(9, 'student_b1', 'student_b1', 'student_b1', 2, 'active', 'noimage.jpg', 'student', '--', '2020-04-16 01:28:20'),
(10, 'student_b2', 'student_b2', 'student_b2', 2, 'active', 'noimage.jpg', 'student', '--', '2020-04-16 01:28:47'),
(11, 'terminal_gs_a', 'terminal_gs_a', 'terminal_gs_a', 4, 'active', 'noimage.jpg', 'student', '--', '2020-04-20 14:00:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials_instructors`
--
ALTER TABLE `materials_instructors`
  ADD PRIMARY KEY (`id`);


--
-- Indexes for table `session_content_images`
--
ALTER TABLE `session_content_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `session_image` (`session_image`);

--
-- Indexes for table `session_content_voices`
--
ALTER TABLE `session_content_voices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `materials_instructors`
--
ALTER TABLE `materials_instructors`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `session_content_images`
--
ALTER TABLE `session_content_images`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `session_content_voices`
--
ALTER TABLE `session_content_voices`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
