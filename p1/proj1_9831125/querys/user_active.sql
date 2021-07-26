select t.user_id,t.data1,t.text1
from twitt as t
where not exists (
	select * 
	from blocked as b
	 where b.blocker = 'sk' and b.blocked = 'mmdch')
and (t.user_id = 'sk') 
