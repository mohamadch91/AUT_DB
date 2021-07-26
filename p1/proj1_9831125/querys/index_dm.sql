select sender, COUNT(sender) as new
from message as m
where mn.reciever = 'mmdch'
group by sender

