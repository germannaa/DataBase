alter table habilidade_pokemon  add
(foreign key (Pokemon_idPokemon) references pokemon(idPokemon));

alter table pokemon_treinador add
(foreign key (Pokemon_idPokemon) references pokemon(idPokemon));

alter table habilidade_pokemon add
(foreign key (Habilidade_idHabilidade) references habilidade (idHabilidade));

alter table pokemon_treinador add
(foreign key (Treinador_idTreinador) references treinador (idTreinador));

alter table item_treinador add
(foreign key (Treinador_idTreinador) references treinador (idTreinador));

alter table item_treinador add
(foreign key (Item_idItem) references item (idItem));

insert into pokemon (idPokemon, nome, tipo) values 
(01, "pikachu", "eletrico"),
(02, "bulbasauro", "planta"),
(03, "charmander", "fogo"),
(04, "snorlax", "cansado"),
(05, "raichu", "eletrico"),
(06, "Squirtle", "água")
;

insert into treinador (idTreinador, nome, sexo, time) values
(01, "Ash", "M", "Time01"),
(02, "Misty", "F", "Time 02"),
(03, "Brock", "M", "Time03")
;

insert into item (idItem, nome, descrição) values
(01, "pedra", "Pedrada"),
(02, "arco e flecha", "flechada")
;

insert into habilidade(idHabilidade, nome, força) values
(01, "agua", 10), 
(02, "fogo", 654),
(03, "terra", 97896),
(04, "coração", 9021873)
;

insert into pokemon_treinador (Pokemon_idPokemon, Treinador_idTreinador) values
(01,01),
(02,01),
(03,02),
(04,02),
(05,03),
(06,03)
;

insert into habilidade_pokemon (Habilidade_idHabilidade, Pokemon_idPokemon) values
(01, 01),
(02,02),
(01,03),
(04,04),
(03,05),
(02,06);

select * from pokemon;


select *
from pokemon
where idPokemon = (select Pokemon_idPokemon
					from habilidade_pokemon
                    where Habilidade_idHabilidade = (select idHabilidade
													from habilidade
                                                    where nome = "terra"));
                                                    

select p.nome, t.nome
from pokemon as p, treinador as t, pokemon_treinador as pt, habilidade_pokemon as hp
where p.idPokemon = hp.Pokemon_idPokemon 
	and hp.Pokemon_idPokemon = pt.Pokemon_idPokemon 
    and pt.Treinador_idTreinador = t.idTreinador;
    
    
select t.nome, i.nome
from treinador as t, item_treinador as it, item as i
where t.idTreinador = it.Treinador_idTreinador and it.Item_idItem = i.idItem;



select * from item_treinador;

select p.nome, h.nome, h.força
from pokemon as p, habilidade as h, habilidade_pokemon as hp
where p.idPokemon = hp.Pokemon_idPokemon and hp.Habilidade_idHabilidade = h.idHabilidade
order by força;

select t.nome, count(pt.Pokemon_idPokemon) as qtdePokemon
from treinador as t, pokemon_treinador as pt
where t.idTreinador = pt.Treinador_idTreinador
group by t.nome;
