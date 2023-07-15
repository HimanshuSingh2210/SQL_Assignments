--2
select name 'Band Name' from bands

--___________________________________

--3
select top 1 *from albums
where release_year is not null
order by release_year

--4
select  distinct ba.id,ba.name 
from bands ba  join albums as al
on ba.id=al.band_id

--5
select   ba.id,ba.name
from bands ba
left join albums as al
on ba.id=al.band_id
group by ba.id,ba.name
having count (al.id )=0

--


--6
select top 1
al.name 'Name',
al.release_year 'Release Year',
sum(so.length) 'duration'
from albums al
join songs so
on al.id=so.album_id
group by al.name,al.release_year
order by duration desc

----7

update albums set release_year=1986 
where id=4

---8
insert into bands (id,name) values (8,'fav_band')

INSERT INTO albums(id,name,release_year,band_id) VALUES (1,'msd',2018,8)

--9

delete from albums where band_id=8

--10
select avg(length) as 'total avg'
from songs

--11
select al.name 'Name',al.release_year 'Release Year',max(so.length) as 'Top Song Duration'
from albums al
join songs so
on al.id=so.album_id
group by al.name,al.release_year

--12
select ba.name 'Name',
count(so.id) 'total songs'
from bands ba
join albums al on ba.id=al.id
join songs so on al.id=so.album_id
group by ba.name


