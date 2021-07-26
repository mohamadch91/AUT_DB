create table follower(
  follower varchar(20),
  followed varchar(20),
  primary key (follower, followed),
  foreign key  (follower) references user(id),
  foreign key  (followed) references user(id)
)