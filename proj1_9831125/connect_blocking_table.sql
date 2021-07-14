create table blocked(
  blocker varchar(20),
  blocked varchar(20),
  primary key (blocker, blocked),
  foreign key (blocked) references user(id),
  foreign key (blocker) references user(id)
)