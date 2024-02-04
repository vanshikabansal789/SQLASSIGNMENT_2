--Assignment 2

use mavenmovies;
select count(rental_id) as Total_number_of_rentals
from rental;

select  avg(datediff(return_date,rental_date)) as avg_duration_in_days
from rental;

select upper(first_name), upper(last_name)
from customer;

select rental_id, month(rental_date)
from rental;

select c.customer_id, count(r.rental_id) as total_rentals
from customer as c
left join rental as r on c.customer_id=r.customer_id
group by c.customer_id;

select s.store_id, sum(p.amount)
from store as s
join staff as t
on s.store_id = t. store_id
join payment as p
on t.staff_id=p.staff_id
group by s.store_id;

select f.title, c.first_name, c.last_name
from film as f
join inventory as i
on f.film_id=i.film_id
join rental as r
on i.inventory_id=r.inventory_id
join customer as c
on r.customer_id=c.customer_id;

select a.first_name, a.last_name
from actor as a 
join film_actor as fa
on a.actor_id=fa.actor_id
join film as f
on fa.film_id=f.film_id
where f.title='gone with the wind';

select count(r.rental_id), fc.category_id
from film_category as fc
join inventory as i
on fc.film_id=i.film_id
join rental as r
on i.inventory_id=r.inventory_id
group by fc.category_id;

select l.name, avg(f.rental_rate)
from film as f
join language as l
on f.language_id=l.language_id
group by l.name;

select c.first_name, sum(p.amount)
from customer as c
join rental as r
on c.customer_id=r.customer_id
join payment as p
on r.rental_id=p.rental_id
group by c.first_name;

select c.first_name, c.last_name, f.title
from customer as c
join address as a
on c.address_id=a.address_id
join city as ct
on a.city_id=ct.city_id
join rental as r
on c.customer_id=r.customer_id
join inventory as i
on r.inventory_id=i.inventory_id
join film as f
on i.film_id=f.film_id
where ct.city='london'
order by c.first_name, c.last_name, f.title;

select f.title, count(*) as rental_count
from film as f
join inventory as i
on f.film_id=i.film_id
join rental as r
on i.inventory_id=r.inventory_id
group by f.title
order by rental_count desc
limit 5;

select  c.customer_id, c.first_name, c.last_name
from customer as c
join rental as r
on c.customer_id=r.customer_id
join inventory as i
on r.inventory_id=i.inventory_id
join store as s
on i.store_id=s.store_id
where s.store_id in('1','2')
group by c.customer_id, c.first_name, c.last_name
having count(distinct s.store_id)=2;

