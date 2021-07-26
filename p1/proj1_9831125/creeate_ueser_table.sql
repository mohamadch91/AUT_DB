create table user(
  fname varchar(30) NOT NULL,
  lname varchar(30) NOT NULL,
  id varchar(20) NOT NULL,
  pass varchar(128) NOT NULL,
  bio varchar(64) NOT NULL,
  birthday DATE NOT NULL,
  login DATE NOT NULL,
  primary key (id)
)