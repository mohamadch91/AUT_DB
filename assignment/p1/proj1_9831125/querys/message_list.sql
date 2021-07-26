select *
from message as m, twitt as t 
where 'sk' not in (
	select b.blocked
	from blocked as b 
	where b.blocker=t.user_id)
and  m.reciever = 'sk' and m.twitt_id=t.id
order by m.text desc