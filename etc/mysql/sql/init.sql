USE isuconp;

CREATE TABLE IF NOT EXISTS `users`
(
  id INT NOT NULL AUTO_INCREMENT,
  account_name VARCHAR(64) NOT NULL UNIQUE,
  passhash VARCHAR(128) NOT NULL,
  authority TINYINT(1) NOT NULL DEFAULT 0,
  del_flg TINYINT(1) NOT NULL DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id)
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `posts`
(
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  mime VARCHAR(64) NOT NULL,
  imgdata MEDIUMBLOB NOT NULL,
  body TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `comments`
(
  id INT NOT NULL AUTO_INCREMENT,
  post_id INT NOT NULL,
  user_id INT NOT NULL,
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id)
) ENGINE=InnoDB CHARSET=utf8;