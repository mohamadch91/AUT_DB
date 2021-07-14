create table reply(
	id							INT AUTO_INCREMENT NOT NULL,
     reply_id					INT NOT NULL,
	twitt_id					INT NOT NULL,
   
    primary key  (id),
    foreign key (twitt_id) references twitt(id),
    foreign key (reply_id) references twitt(id))