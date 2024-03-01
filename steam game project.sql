/*copy table*/

create table games(
	index int,
	game_name varchar(500),
	release_date timestamp,
	developer varchar(500),
	publishers varchar(500),
	platforms varchar(500),
	required_age int,
	categories varchar(500),
	genres varchar(500),
	steamspy_tags varchar(500),
	positive_ratings int,
	negative_ratings int,
	price decimal
);

COPY games(index,game_name,release_date,developer,publishers,platforms,required_age,categories,genres,steamspy_tags,positive_ratings,negative_ratings,price)
	FROM 'C:\steaM CLEANED 27000.csv'
	DELIMITER ','
	CSV HEADER;
	
SELECT * FROM public.games;

/* counting platform */

select count(game_name)
from games
WHERE platforms = 'windows,mac,linux'

select count(game_name)
from games
WHERE platforms = 'windows,mac'

select count(game_name)
from games
WHERE platforms = 'windows,linux'

select count(game_name)
from games
WHERE platforms = 'windows'

/*top 10 positive ratings*/

select *
from games
order by positive_ratings desc
LIMIT 10

/*grouping release date*/

select release_date
from games
group by release_date
order by release_date desc

/*releasing games in decade*/

select * from games
where release_date
between '1997-06-30 00:00:00' and '2010-12-20 00:00:00'

/*top 10 games in decade */

select * from games
where release_date
between '1997-06-30 00:00:00' and '2010-12-20 00:00:00'
order by positive_ratings desc
limit 10

/*top 10 games release on windows*/

select * from games
where release_date
between '1997-06-30 00:00:00' and '2010-12-20 00:00:00'
and platforms = 'windows'
order by positive_ratings desc
limit 10

/*releasing games in decade*/

select * from games
where release_date
between '2011-01-10 00:00:00' and '2019-05-01 00:00:00'
order by positive_ratings desc

/*top 10 games in decade windows */

select * from games
where release_date
between '2011-01-10 00:00:00' and '2019-05-01 00:00:00'
and platforms = 'windows'
order by positive_ratings desc
limit 10

/* count genres games */

select genres,
count(genres)
from games 
group by genres
order by genres asc

/*free games on decade*/

select * from games
where release_date
between '1997-06-30 00:00:00' and '2010-12-20 00:00:00'
and platforms = 'windows'
and price = 0
order by positive_ratings desc

/*free games on decade*/

select * from games
where release_date
between '2011-01-10 00:00:00' and '2019-05-01 00:00:00'
and platforms = 'windows'
and price = 0
order by positive_ratings desc



