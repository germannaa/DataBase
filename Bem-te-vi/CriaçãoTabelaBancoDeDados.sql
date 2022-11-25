CREATE DATABASE Bemtevi;

USE Bemtevi;

CREATE TABLE tweet (
id int auto_increment,
content varchar(250),
retweet tinyint(1),
owner int,
parent int,
primary key (id)
);

CREATE TABLE user(
id int auto_increment,
nickname varchar(64),
email varchar(64),
password varchar(64),
primary key (id)
);

CREATE TABLE user_follows(
user_follows_id int,
user_followed_id int,
primary key(user_follows_id, user_followed_id),
foreign key (user_follows_id) REFERENCES user(id),
foreign key (user_followed_id) REFERENCES user(id)
);

alter table tweet add
foreign key(owner) references user(id);

alter table tweet add
foreign key(parent) references user(id);

CREATE TABLE user_likes(
user_id int,
tweet_id int,
primary key (user_id, tweet_id),
foreign key(user_id) references user(id),
foreign key(tweet_id) references tweet(id)
);
