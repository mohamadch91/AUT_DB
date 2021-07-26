select
  *
from
  twitt as twitt1,
  twitt as twitt2,
  reply as r
where
  (r.twitt_id = twitt1.id)
  and (r.reply_id = twitt2.id)
  and twitt_id = 2
  and not exists (
    select
      *
    from
      blocked as b
    where
      (
        twitt1.user_id = b.blocked
        and twitt2.user_id = B.blocker
      )
      OR (
        twitt1.user_id = b.blocker
        and twitt2.user_id = B.blocked
      )