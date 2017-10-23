CREATE TABLE `myaac_account_actions`
(
	`account_id` INT(11) NOT NULL,
	`ip` INT(11) NOT NULL DEFAULT 0,
	`ipv6` BINARY(16) NOT NULL DEFAULT 0,
	`date` INT(11) NOT NULL DEFAULT 0,
	`action` VARCHAR(255) NOT NULL DEFAULT '',
	KEY (`account_id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_admin_menu`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL DEFAULT '',
	`page` VARCHAR(255) NOT NULL DEFAULT '',
	`ordering` INT(11) NOT NULL DEFAULT 0,
	`flags` INT(11) NOT NULL DEFAULT 0,
	`enabled` INT(1) NOT NULL DEFAULT 1,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_bugtracker`
(
	`account` VARCHAR(255) NOT NULL,
	`type` INT(11) NOT NULL DEFAULT 0,
	`status` INT(11) NOT NULL DEFAULT 0,
	`text` text NOT NULL,
	`id` INT(11) NOT NULL DEFAULT 0,
	`subject` VARCHAR(255) NOT NULL DEFAULT '',
	`reply` INT(11) NOT NULL DEFAULT 0,
	`who` INT(11) NOT NULL DEFAULT 0,
	`uid` INT(11) NOT NULL AUTO_INCREMENT,
	`tag` INT(11) NOT NULL DEFAULT 0,
	PRIMARY KEY (`uid`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_changelog`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`body` VARCHAR(500) NOT NULL DEFAULT '',
	`type` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 - added, 2 - removed, 3 - changed, 4 - fixed',
	`where` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 - server, 2 - site',
	`date` INT(11) NOT NULL DEFAULT 0,
	`player_id` INT(11) NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

INSERT INTO `myaac_changelog` (`id`, `type`, `where`, `date`, `body`, `hidden`) VALUES (1, 3, 2, UNIX_TIMESTAMP(), 'MyAAC installed. (:', 0);

CREATE TABLE `myaac_commands`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`words` VARCHAR(30) NOT NULL DEFAULT 0,
	`description` VARCHAR(300) NOT NULL,
	`ordering` INT(11) NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE (`words`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_config`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	`value` VARCHAR(1000) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE (`name`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_faq`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`question` VARCHAR(255) NOT NULL DEFAULT '',
	`answer` VARCHAR(1020) NOT NULL DEFAULT '',
	`ordering` INT(11) NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_forum_boards`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(32) NOT NULL,
	`description` VARCHAR(255) NOT NULL DEFAULT '',
	`ordering` INT(11) NOT NULL DEFAULT 0,
	`guild` INT(11) NOT NULL DEFAULT 0,
	`access` INT(11) NOT NULL DEFAULT 0,
	`closed` TINYINT(1) NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;
INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`, `closed`) VALUES (NULL, 'News', 'News commenting', 0, 1);
INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`) VALUES (NULL, 'Trade', 'Trade offers.', 1);
INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`) VALUES (NULL, 'Quests', 'Quest making.', 2);
INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`) VALUES (NULL, 'Pictures', 'Your pictures.', 3);
INSERT INTO `myaac_forum_boards` (`id`, `name`, `description`, `ordering`) VALUES (NULL, 'Bug Report', 'Report bugs there.', 4);

CREATE TABLE `myaac_forum`
(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`first_post` int(11) NOT NULL default '0',
	`last_post` int(11) NOT NULL default '0',
	`section` int(3) NOT NULL default '0',
	`replies` int(20) NOT NULL default '0',
	`views` int(20) NOT NULL default '0',
	`author_aid` int(20) NOT NULL default '0',
	`author_guid` int(20) NOT NULL default '0',
	`post_text` text NOT NULL,
	`post_topic` varchar(255) NOT NULL DEFAULT '',
	`post_smile` tinyint(1) NOT NULL default '0',
	`post_date` int(20) NOT NULL default '0',
	`last_edit_aid` int(20) NOT NULL default '0',
	`edit_date` int(20) NOT NULL default '0',
	`post_ip` varchar(32) NOT NULL default '0.0.0.0',
	`sticked` INT(11) NOT NULL DEFAULT '0',
	`closed` INT(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`),
	KEY `section` (`section`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_hooks`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL DEFAULT '',
	`type` INT(2) NOT NULL DEFAULT 0,
	`file` VARCHAR(100) NOT NULL,
	`ordering` INT(11) NOT NULL DEFAULT 0,
	`enabled` INT(1) NOT NULL DEFAULT 1,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_items`
(
	`id` INT(11) NOT NULL,
	`article` VARCHAR(5) NOT NULL DEFAULT '',
	`name` VARCHAR(50) NOT NULL DEFAULT '',
	`plural` VARCHAR(50) NOT NULL DEFAULT '',
	`attributes` VARCHAR(500) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_monsters` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`hidden` tinyint(1) NOT NULL default 0,
	`name` varchar(255) NOT NULL,
	`mana` int(11) NOT NULL DEFAULT 0,
	`exp` int(11) NOT NULL,
	`health` int(11) NOT NULL,
	`speed_lvl` int(11) NOT NULL default 1,
	`use_haste` tinyint(1) NOT NULL,
	`voices` text NOT NULL,
	`immunities` varchar(255) NOT NULL,
	`summonable` tinyint(1) NOT NULL,
	`convinceable` tinyint(1) NOT NULL,
	`race` varchar(255) NOT NULL,
	`loot` varchar(500) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_videos`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(100) NOT NULL DEFAULT '',
	`youtube_id` VARCHAR(20) NOT NULL,
	`author` VARCHAR(50) NOT NULL DEFAULT '',
	`ordering` INT(11) NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_news`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(100) NOT NULL,
	`body` TEXT NOT NULL,
	`type` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 - news, 2 - ticket, 3 - article',
	`date` INT(11) NOT NULL DEFAULT 0,
	`category` TINYINT(1) NOT NULL DEFAULT 0,
	`player_id` INT(11) NOT NULL DEFAULT 0,
	`last_modified_by` INT(11) NOT NULL DEFAULT 0,
	`last_modified_date` INT(11) NOT NULL DEFAULT 0,
	`comments` VARCHAR(50) NOT NULL DEFAULT '',
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_news_categories`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL DEFAULT "",
	`description` VARCHAR(50) NOT NULL DEFAULT "",
	`icon_id` INT(2) NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

INSERT INTO `myaac_news_categories` (`id`, `icon_id`) VALUES (NULL, 0);
INSERT INTO `myaac_news_categories` (`id`, `icon_id`) VALUES (NULL, 1);
INSERT INTO `myaac_news_categories` (`id`, `icon_id`) VALUES (NULL, 2);
INSERT INTO `myaac_news_categories` (`id`, `icon_id`) VALUES (NULL, 3);
INSERT INTO `myaac_news_categories` (`id`, `icon_id`) VALUES (NULL, 4);

CREATE TABLE `myaac_notepad`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`account_id` INT(11) NOT NULL,
	/*`name` VARCHAR(30) NOT NULL,*/
	`content` TEXT NOT NULL,
	/*`public` TINYINT(1) NOT NULL DEFAULT 0*/
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_pages`
(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	`title` VARCHAR(30) NOT NULL,
	`body` TEXT NOT NULL,
	`date` INT(11) NOT NULL DEFAULT 0,
	`player_id` INT(11) NOT NULL DEFAULT 0,
	`php` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '0 - plain html, 1 - php',
	`access` TINYINT(2) NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_gallery`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`comment` VARCHAR(255) NOT NULL DEFAULT '',
	`image` VARCHAR(255) NOT NULL,
	`thumb` VARCHAR(255) NOT NULL,
	`author` VARCHAR(50) NOT NULL DEFAULT '',
	`ordering` INT(11) NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;

INSERT INTO `myaac_gallery` (`id`, `ordering`, `comment`, `image`, `thumb`, `author`) VALUES (NULL, 1, 'Demon', 'images/gallery/demon.jpg', 'images/gallery/demon_thumb.gif', 'MyAAC');

CREATE TABLE `myaac_spells`
(
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`spell` VARCHAR(255) NOT NULL,
	`name` VARCHAR(255) NOT NULL,
	`words` VARCHAR(255) NOT NULL,
	`category` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 - attack, 2 - healing, 3 - summon, 4 - supply, 5 - support',
	`type` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '1 - instant, 2 - conjure, 3 - rune',
	`level` INT(11) NOT NULL DEFAULT 0,
	`maglevel` INT(11) NOT NULL DEFAULT 0,
	`mana` INT(11) NOT NULL DEFAULT 0,
	`soul` TINYINT(3) NOT NULL DEFAULT 0,
	`conjure_count` TINYINT(3) NOT NULL DEFAULT 0,
	`item_id` INT(11) NOT NULL DEFAULT 0,
	`premium` TINYINT(1) NOT NULL DEFAULT 0,
	`vocations` VARCHAR(100) NOT NULL DEFAULT '',
	`hidden` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	UNIQUE (`name`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_visitors`
(
	`ip` VARCHAR(16) NOT NULL,
	`lastvisit` INT(11) NOT NULL DEFAULT 0,
	`page` VARCHAR(100) NOT NULL,
	UNIQUE (`ip`)
) ENGINE = MyISAM;

CREATE TABLE `myaac_weapons`
(
	`id` INT(11) NOT NULL,
	`level` INT(11) NOT NULL DEFAULT 0,
	`maglevel` INT(11) NOT NULL DEFAULT 0,
	`vocations` VARCHAR(100) NOT NULL DEFAULT '',
	PRIMARY KEY (`id`)
) ENGINE = MyISAM;
