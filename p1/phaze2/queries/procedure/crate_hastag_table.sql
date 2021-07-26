create table hashtag(
  tag varchar(6) NOT NULL,
  twitt_id INT NOT NULL,
  foreign key (twitt_id) references twitt(id)
)