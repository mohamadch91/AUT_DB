create table twitt(
  id INT AUTO_INCREMENT NOT NULL,
  user_id varchar(20) NOT NULL,
  text varchar(256) NOT NULL,
  data DATE NOT NULL,
  primary key (ID),
  foreign key (user_id) references user(id)
)