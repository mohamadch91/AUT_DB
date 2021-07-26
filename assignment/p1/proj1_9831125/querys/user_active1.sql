select t.user_id,t.data1,t.text1
from twitt as t, follower as f, blocked as b 
where (f.follower_id= 'sk') and(f.following_id = t.user_id) and  (f.follower_id = b.blocker and f.following_id !=b.blocked) ;