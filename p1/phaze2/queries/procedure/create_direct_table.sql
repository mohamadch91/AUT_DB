create table message(
  sender varchar(20) NOT NULL,
  reciever varchar(20) NOT NULL,
  twitt_id int,
  TYPE int NOT NULL,
  text varchar(256),
  data date,
  foreign key (sender) references user(id),
  foreign key (reciever) references user(id),
  foreign key (twitt_id) references twitt(id)
)