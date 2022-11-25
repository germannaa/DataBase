SELECT * from tweet where owner = (select id from user where nickname = {nickname};

SELECT * from tweet where owner = (select u.id 
									from user_follows as uf, user as u
									where u.id = uf.user_followed_id 
                                    and u.nickname = {nickname};
