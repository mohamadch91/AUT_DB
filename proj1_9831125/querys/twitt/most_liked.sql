select
  COUNT(twitt_id),
  m.ID,
  m.user_id,
  m.text1,
  m.data1
from
  liked as s
  join twitt as m on m.ID = s.twitt_id
group by
  s.twittid
order by
  COUNT(TWEET_ID) desc