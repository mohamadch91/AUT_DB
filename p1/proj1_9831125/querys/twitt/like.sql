insert into
  liked
select
  2,
  'sk'
where
  not exists(
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