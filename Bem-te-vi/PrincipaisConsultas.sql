• Elabore as consultas SQL para:
1. Listar todos os tweets de um usuário

SELECT * from tweet where owner = (select id from user where nickname = {nickname};

				   
2. Listar todos os tweets de pessoas que um usuário segue

				   
SELECT * from tweet TweetDeQuemEuSigo  where owner = (select u.id 
				from user_follows as uf, user as u
				where u.id = uf.user_follows_id 
                                    and u.nickname = {nicknameSeguindo}
                                    and uf.user_id = (select u.id
						   from user as u
                                                    where nickname = {nickname};

				   
				   
3. Listar todos usuários que um usuário segue
                        
select u.name as QuemEuSigo 
from user as u
where u.id = (select uf.user_follows_id  
		from user_follows as uf
                where uf.user_id = (Select u.id
				   from user as u
                                    where nickname = {meuNickname};						      
						      
						      
4. Listar por quem esse usuário é seguido
				    

select u.name as QuemMeSegue 
from user as u
where u.id = (select uf.user_id  
		from user_follows as uf
                where uf.user_follows_id = (Select u.id
					from user as u
                                        where nickname = {meuNickname};



						      
						      
5. Listar todos os tweets que tem “copa do mundo”
no texto
					

						      
						      
6. Listar todas as respostar de um determinado
tweet (utilize o parent)
						      
