create table login(
  id varchar(20) NOT NULL,
  time1 date,
  foreign key (id) references user(id)
)