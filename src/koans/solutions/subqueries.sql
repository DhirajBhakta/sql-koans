-- Meditate on using subqueries with IN
select * from event
where customer_id in (
	select c.id from event
		join customer c on event.customer_id = c.id
	where type = 'Lost'
)
order by datetime desc

-- Meditate on WITH to create a temporary query
with book_losers as (
	select c.id from event
		join customer c on event.customer_id = c.id
	where type = 'Lost'
)
select e.* from book_losers bl
	join event e on bl.id = e.customer_id
order by datetime desc

-- Meditate on using subqueries for deleting data
delete from book
where _____ in (
	select _____
	from event
	where type = 'Lost'
)