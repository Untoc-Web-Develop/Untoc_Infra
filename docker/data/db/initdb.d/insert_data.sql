INSERT INTO `badge` (`id`, `_key`, `title`, `description`) VALUES ('default_admin_badge','admin','관리자','관리자 인증 뱃지');

INSERT INTO `user` (`id`, `username`, `email`, `password`, `phone_number`,`student_id`) VALUES ('default_admin_user','관리자','admin@pusan.ac.kr','$2b$11$sCdyJEtSJZauzZ0PB1FW4eS.LEuwMEyhxsmBkaJ5I6gIJtt7B8WTm','010-0000-0000','202400306');

INSERT INTO `user_badge` (`userId`, `badgeId`) VALUES ('default_admin_user','default_admin_badge');
