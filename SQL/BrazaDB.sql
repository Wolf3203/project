#id = identification
#nm = name
#ds = description
#fl = flag
#nr = number
#dt = date

CREATE TABLE tb_special_category (
  id_special_category int NOT NULL AUTO_INCREMENT,
  nm_special_category varchar(100) NOT NULL,
  PRIMARY KEY (`id_special_category`)
) ENGINE=InnoDB;

CREATE TABLE tb_product (
  id_product int NOT NULL AUTO_INCREMENT,
  id_special_category int NOT NULL,
  nm_product varchar(100) NOT NULL,
  ds_product varchar(100) NOT NULL,
  nr_price numeric(10,2) NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB;


ALTER TABLE tb_product ADD CONSTRAINT ref_tb_product_to_tb_special_category FOREIGN KEY (`id_special_category`)
	REFERENCES tb_special_category(`id_special_category`)
	MATCH SIMPLE
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;
	
CREATE TABLE tb_gallery (
  id_gallery int NOT NULL AUTO_INCREMENT,
  ds_photo varchar(200) NOT NULL,
  nr_order smallint NOT NULL DEFAULT 1,
  fl_active bool NOT NULL DEFAULT TRUE,
  PRIMARY KEY (`id_gallery`)
) ENGINE=InnoDB;

CREATE TABLE tb_customers_reviews (
  id_customers_reviews int NOT NULL AUTO_INCREMENT,
  ds_name varchar(100) NOT NULL,
  ds_job varchar(100) NOT NULL,
  ds_avatar varchar(200) NOT NULL,
  ds_message varchar(200) NOT NULL,
  nr_order smallint NOT NULL DEFAULT 1,
  fl_active bool NOT NULL DEFAULT TRUE,
  PRIMARY KEY (`id_customers_reviews`)
) ENGINE=InnoDB;

CREATE TABLE tb_reservation (
  id_reservation int NOT NULL AUTO_INCREMENT,
  nr_person smallint NOT NULL,
  nm_contact_name varchar(100) NOT NULL,
  nm_contact_email varchar(200) NOT NULL,
  nm_contact_phone varchar(100) NOT NULL,
  dt_data timestamp NOT NULL,
  dt_created timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY (`id_reservation`)
) ENGINE=InnoDB;

CREATE TABLE tb_stuff (
  id_stuff int NOT NULL AUTO_INCREMENT,
  nm_stuff varchar(100) NOT NULL,
  nm_job varchar(100) NOT NULL,
  ds_social_facebook varchar(200),
  ds_social_gplus varchar(200),
  ds_social_instagran varchar(200),
  ds_social_linkedin varchar(200),
  nr_order smallint NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_stuff`)
) ENGINE=InnoDB;

CREATE TABLE tb_user (
  id_user int NOT NULL AUTO_INCREMENT,
  nm_user varchar(100) NOT NULL,
  nm_login varchar(200) NOT NULL UNIQUE,
  ds_pass varchar(200) NOT NULL,
  ds_avatar varchar(200) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB;

CREATE TABLE tb_blog (
  id_blog int NOT NULL AUTO_INCREMENT,
  id_user int NOT NULL,
  nm_blog varchar(100) NOT NULL,
  ds_content text NOT NULL,
  ds_photo varchar(200) NOT NULL,
  dt_created timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY (`id_blog`)
) ENGINE=InnoDB;

ALTER TABLE tb_blog ADD CONSTRAINT ref_tb_blog_to_tb_user FOREIGN KEY (`id_user`)
	REFERENCES tb_user(`id_user`)
	MATCH SIMPLE
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

CREATE TABLE tb_blog_comment (
  id_blog_comment int NOT NULL AUTO_INCREMENT,
  id_blog int NOT NULL,
  id_blog_comment_recursive int COMMENT 'used to reply to a comment',
  id_user int NOT NULL,
  ds_comment text NOT NULL,
  dt_created timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY (`id_blog_comment`)
) ENGINE=InnoDB;

ALTER TABLE tb_blog_comment ADD CONSTRAINT ref_tb_blog_comment_to_tb_blog FOREIGN KEY (`id_blog`)
	REFERENCES tb_blog(`id_blog`)
	MATCH SIMPLE
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE tb_blog_comment ADD CONSTRAINT ref_tb_blog_comment_to_tb_user FOREIGN KEY (`id_blog_comment_recursive`)
	REFERENCES tb_blog_comment(`id_blog_comment`)
	MATCH SIMPLE
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;

ALTER TABLE tb_blog_comment ADD CONSTRAINT ref_tb_blog_comment_to_tb_blog_comment FOREIGN KEY (`id_user`)
	REFERENCES tb_user(`id_user`)
	MATCH SIMPLE
	ON DELETE RESTRICT
	ON UPDATE RESTRICT;
	
CREATE TABLE tb_contact (
  id_contact int NOT NULL AUTO_INCREMENT,
  nm_name varchar(100) NOT NULL,
  nm_email varchar(200) NOT NULL,
  ds_message text NOT NULL,
  dt_created timestamp NOT NULL DEFAULT now(),
  PRIMARY KEY (`id_contact`)
) ENGINE=InnoDB;