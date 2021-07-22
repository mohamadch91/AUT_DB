create table  login(
	counter					int auto_increment,
    id					VARCHAR(20) NOT NULL,
    time				DATE NOT NULL,
     primary key (counter),
    foreign key (id) references user(id) on delete cascade)
