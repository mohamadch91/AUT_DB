select
  *
from
  liked as s
where
  s.user_id not in (
    select
      b.blocker
    from
      blocked as b
      join tweet as m ON b.blocked = t.user_id
    where
      s.twitt_id = t.id
  )
  and not exists(
    select
      *
    from
      blocked as b,
      tweet as t
    where
      b.blocker = 'mmdch'
      and t.user_id = b.blocker
      and T.ID = 2
  )
  and s.twitt_id = 1