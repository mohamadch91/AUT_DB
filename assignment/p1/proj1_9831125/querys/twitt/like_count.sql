select
  COUNT(user_id)
from
  liked as s
where
  s.twitt_id = 2
  and not exists(
    select
      *
    from
      blocked as b,
      twitt as t
    where
      t.user_id = b.blocker
      and t.id = 2
      and b.blocked = 'sk'
  )