select
  user_id,
  tex1,
  data1
FROM
  hashtag as h,
  twitt as t
where
  not exists(
    select
      *
    from
      blocked AS b
    where
      b.blocked = 'mmdch'
      and b.blocker = t.user_id
  )
  and t.user_id = 'sk'
  and h.twitt_id = t.id
  and h.tag = '#abcde'