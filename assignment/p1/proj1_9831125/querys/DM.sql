insert into message  (sender, reciver, type,twiit_id, data ) select 'mmdch','sk',0, 12, current_date()
from twitt as t
where not exists(
	select * from blocked AS b
	where  (B.blocker = 'sk' AND B.blocked = 'mmdch')or (b.blocker = 'mmdch' AND B.blocked = 'sk') ) and 
     'sk' not in (
	select b.blocked 
	from blocked as b 
	where b.blocker=t.user_id)

and t.id=12
