CREATE TABLE liked(
	twitt_id				INT NOT NULL,
    user_id					VARCHAR(20) NOT NULL,
    primary key (user_id, twitt_id),
    foreign key (twitt_id) references twitt(id),
    foreign key (user_id) references user(id))