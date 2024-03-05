CREATE TABLE `about` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_19b1f361f6815119124e3d6a06` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `apply` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `name` varchar(255) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `apply_question` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `question` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `apply_setting` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `generation` int(11) NOT NULL,
  `open_at` datetime NOT NULL,
  `close_at` datetime NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_a3411151d903330e791f165679` (`generation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `apply_value` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `value` varchar(255) NOT NULL,
  `apply_id` varchar(36) DEFAULT NULL,
  `apply_question_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_c1dbd70553cce45ddb688b6d631` (`apply_id`),
  KEY `FK_71906830bc7ab06b0a3c6b2785e` (`apply_question_id`),
  CONSTRAINT `FK_71906830bc7ab06b0a3c6b2785e` FOREIGN KEY (`apply_question_id`) REFERENCES `apply_question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_c1dbd70553cce45ddb688b6d631` FOREIGN KEY (`apply_id`) REFERENCES `apply` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `board` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `title` varchar(255) NOT NULL,
  `discordHook` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `history` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `title` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `contents` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `meetup` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_e12875dfb3b1d92d7d7c5377e2` (`email`),
  UNIQUE KEY `IDX_01eea41349b6c9275aec646eee` (`phone_number`),
  UNIQUE KEY `IDX_726563a72061070f771b221345` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `team` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `name` varchar(255) NOT NULL,
  `description_title` varchar(255) NOT NULL,
  `description_content` varchar(255) NOT NULL,
  `leader_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_273a5ddfc2f86baf752c860d163` (`leader_id`),
  CONSTRAINT `FK_273a5ddfc2f86baf752c860d163` FOREIGN KEY (`leader_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `team_meetup` (
  `meetupId` varchar(36) NOT NULL,
  `teamId` varchar(36) NOT NULL,
  PRIMARY KEY (`meetupId`,`teamId`),
  KEY `IDX_8c107771c3bfda0c0740a5ff1d` (`meetupId`),
  KEY `IDX_931dfdce61f247c80baca7c63c` (`teamId`),
  CONSTRAINT `FK_8c107771c3bfda0c0740a5ff1dc` FOREIGN KEY (`meetupId`) REFERENCES `meetup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_931dfdce61f247c80baca7c63c4` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `post` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `title` varchar(255) NOT NULL,
  `author_id` varchar(36) DEFAULT NULL,
  `board_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2f1a9ca8908fc8168bc18437f62` (`author_id`),
  KEY `FK_63753e3ee6a3c42e4a8a34cb7ec` (`board_id`),
  CONSTRAINT `FK_2f1a9ca8908fc8168bc18437f62` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_63753e3ee6a3c42e4a8a34cb7ec` FOREIGN KEY (`board_id`) REFERENCES `board` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `file` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `link` varchar(255) NOT NULL,
  `badge_id` varchar(36) DEFAULT NULL,
  `post_id` varchar(36) DEFAULT NULL,
  `team_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6f5531bea310c8d5d58f2e7b2f0` (`post_id`),
  KEY `FK_85ff5e8682035fa42fbd245b2a7` (`team_id`),
  CONSTRAINT `FK_6f5531bea310c8d5d58f2e7b2f0` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_85ff5e8682035fa42fbd245b2a7` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `badge` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `_key` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `icon` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_4c7611320c54217c182ae0dc55` (`_key`),
  UNIQUE KEY `REL_f75c40644b02a1363c980448c9` (`icon`),
  CONSTRAINT `FK_f75c40644b02a1363c980448c91` FOREIGN KEY (`icon`) REFERENCES `file` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `badge_log` (
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `is_given` tinyint(4) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `badge_id` varchar(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_4cb7d0b1f2c9105d7754fa68209` (`user_id`),
  KEY `FK_8f20b2438203af2041f55c71049` (`badge_id`),
  CONSTRAINT `FK_4cb7d0b1f2c9105d7754fa68209` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8f20b2438203af2041f55c71049` FOREIGN KEY (`badge_id`) REFERENCES `badge` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `user_badge` (
  `userId` varchar(36) NOT NULL,
  `badgeId` varchar(36) NOT NULL,
  PRIMARY KEY (`userId`,`badgeId`),
  KEY `IDX_dc6bb11dce7a0a591b5cae0af2` (`userId`),
  KEY `IDX_8a49533f303db990198b8c9ddf` (`badgeId`),
  CONSTRAINT `FK_8a49533f303db990198b8c9ddf7` FOREIGN KEY (`badgeId`) REFERENCES `badge` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_dc6bb11dce7a0a591b5cae0af25` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELIMITER $$
CREATE TRIGGER `untoc`.`user_badge_AFTER_INSERT` AFTER INSERT ON `user_badge` FOR EACH ROW
BEGIN
	INSERT INTO badge_log(is_given, user_id, badge_id) VALUE (true, new.userId, new.badgeId);
END;
$$

CREATE TRIGGER `untoc`.`user_badge_AFTER_DELETE` AFTER DELETE ON `user_badge` FOR EACH ROW
BEGIN
	INSERT INTO badge_log(is_given, user_id, badge_id) VALUE (false, old.userId, old.badgeId);
END;
$$

DELIMITER ;

CREATE TABLE `user_team` (
  `teamId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  PRIMARY KEY (`teamId`,`userId`),
  KEY `IDX_e50bd38e4f1ba4fa1f3c6a356b` (`teamId`),
  KEY `IDX_32ecd75ddc134fd687792507e9` (`userId`),
  CONSTRAINT `FK_32ecd75ddc134fd687792507e90` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_e50bd38e4f1ba4fa1f3c6a356bc` FOREIGN KEY (`teamId`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `vote` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `meetup_id` varchar(36) DEFAULT NULL,
  `vote_user` varchar(36) DEFAULT NULL,
  `selected_team_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_28012d5d490df95f07df5d113f9` (`meetup_id`),
  KEY `FK_00f97ad54f9a6c63a55ef5d64be` (`vote_user`),
  KEY `FK_3758fcc3d4db7b7aeb13fd3ca2e` (`selected_team_id`),
  CONSTRAINT `FK_00f97ad54f9a6c63a55ef5d64be` FOREIGN KEY (`vote_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_28012d5d490df95f07df5d113f9` FOREIGN KEY (`meetup_id`) REFERENCES `meetup` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_3758fcc3d4db7b7aeb13fd3ca2e` FOREIGN KEY (`selected_team_id`) REFERENCES `team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `whitelist` (
  `id` varchar(36) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `updated_at` datetime(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `student_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_66255db864f20e48ce68e89ce7` (`phone_number`),
  UNIQUE KEY `IDX_676adbd0f42f454f3aa85cb849` (`email`),
  UNIQUE KEY `IDX_fbd4652aa4962ca5b7cebd8509` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;