insert into
  reply(twitt_id, reply_id)
SELECT
  2,
  16
where
  not exists (
    select
      *
    from
      twitt as twitt1,
      twitt as twitt2,
      blocked as b
    where
      (
        twitt2.id = 12
        and twitt2.user_id = b.blocked
      )
      and (
        twitt1.id = 7
        and twitt1.user_id = b.blocker
      )
  )