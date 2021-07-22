from datetime import datetime
import mysql.connector
def connect():
    db = mysql.connector.connect(
        host='mysql',
        username='root',
        password='root',
        database='twitter',
        port='8081'
    )
    return db
def get_cursor(db):
    return db.cursor(named_tuple=True)
def commit(db):
    db.commit()

def refresh_cursor(cursor):
    cursor.fetchall()

def login(cursor, args):
    cursor.callproc('Login', args)
    return cursor.stored_results()

def get_all_users(cursor):
    cursor.callproc('GetUsers')
    return cursor.stored_results()

def contains_user(cursor, args):
    cursor.callproc('haveUser', args)

    return cursor.stored_results()


def register(cursor, args):
    cursor.callproc('signup', args)


def login_history(cursor):
    cursor.callproc('History')

    return cursor.stored_results()


def tweet(cursor, args):
    cursor.callproc('twitt', args)


def get_personal_tweet(cursor):
    cursor.callproc('getPVtwitt')

    return cursor.stored_results()


def get_user_tweet(cursor, args):
    cursor.callproc('UserTweet', args)

    return cursor.stored_results()


def get_hashtag(cursor, args):
    cursor.callproc('GetHashtag', args)

    return cursor.stored_results()


def follow(cursor, args):
    cursor.callproc('Follow', args)


def unfollow(cursor, args):
    cursor.callproc('Unfollow', args)


def my_followers(cursor):
    cursor.callproc('MyFollowers')

    return cursor.stored_results()


def get_followers(cursor, args):
    cursor.callproc('GetFollower', args)

    return cursor.stored_results()


def my_following(cursor):
    cursor.callproc('MyFollowing')

    return cursor.stored_results()


def get_following(cursor, args):
    cursor.callproc('GetFollowing', args)

    return cursor.stored_results()


def block(cursor, args):
    cursor.callproc('block', args)


def unblock(cursor, args):
    cursor.callproc('Unblock', args)


def blocked(cursor, args):
    cursor.callproc('blocked', args)

    return cursor.stored_results()


def timeline(cursor):
    cursor.callproc('Timeline')

    return cursor.stored_results()


def user_activity(cursor, args):
    cursor.callproc('Activity', args)

    return cursor.stored_results()


def reply(cursor, args):
    cursor.callproc('Reply', args)


def show_replies(cursor, args):
    cursor.callproc('Replies', args)

    return cursor.stored_results()


def upvote(cursor, args):
    cursor.callproc('Upvote', args)


def upvote_count(cursor, args):
    cursor.callproc('voteCount', args)

    return cursor.stored_results()


def upvote_list(cursor, args):
    cursor.callproc('voteList', args)

    return cursor.stored_results()


def trends(cursor):
    cursor.callproc('Trend')

    return cursor.stored_results()


def send_message(cursor, args):
    cursor.callproc('SendMessage', args)


def send_tweet(cursor, args):
    cursor.callproc('sned_twitt', args)


def get_message(cursor, args):
    cursor.callproc('GetMessage', args)

    return cursor.stored_results()


def get_tweet(cursor, args):
    cursor.callproc('GetTweet', args)

    return cursor.stored_results()


def get_message_list(cursor):
    cursor.callproc('MessageList')

    return cursor.stored_results()


def get_tweet_list(cursor):
    cursor.callproc('TweetList')

    return cursor.stored_results()


def index():
    log = False

    while not log:
        uin = int(input('welcome to Twitter:)\n1.Register\n2.Login\n'))

        if uin == 1:
            print('please insert your personal information')
            register(cursor, [input('firstname: '), input('lastname: '),
                                       input('username: '), input('password: '),
                                       input('date of birth: '), datetime.today().strftime('%Y-%m-%d'),
                                       input('biography: ')])
            print('account created, welcome to Twitter')
            log = True
        elif uin == 2:
            res = login(cursor, [input('username: '), input('password: ')])
            res = fetch(res)[0][0]

            if res == 1:
                log = True
                print('welcome back')
            else:
                print('username or password is incorrect, try again')
        else:
            print('invalid input')

    commit(db)

def refactor(src):
    src = src[1:-1].strip()
    src = src.replace(', ', ' : ')

    return src


def fetch(result):
    return next(result).fetchall()


def get_table(rows):
    table = []

    for row in rows:
        result = refactor(str(row))
        row = []

        for i in result.split(' : '):
            row.append(i)

        table.append(row)

    return table


def display_tweets(table):
    builder = ''
    for row in table:
        builder = builder + '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n'
        builder = builder + 'username: <' + row[1] + '> tid: <' + row[0] + '>\n\n'
        builder = builder + '> ' + row[2][1:-1] + '\n\n'
        builder = builder + row[3][14:] + '-' + row[4] + '-' + row[5][0:-1] + '\n'
        builder = builder + '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n'

    print(builder)

def handler():
    # index()

    end = False

    while True:
        uin = input('> ')
        dec = uin.split()

        print(dec)

        if dec[0] == 'actvses':
            active_session(dec)
        elif dec[0] == 'tweet':
            tweet(dec, uin)
        elif dec[0] == 'follow':
            follow(dec)
        elif dec[0] == 'unfollow':
            unfollow(dec)
        elif dec[0] == 'block':
            block(dec)
        elif dec[0] == 'unblock':
            unblock(dec)
        elif dec[0] == 'timeline':
            timeline(dec)
        elif dec[0] == 'userack':
            user_activity(dec)
        elif dec[0] == 'reply':
            reply(dec)
        elif dec[0] == 'hashtag':
            hashtag(dec)
        elif dec[0] == 'like':
            like(dec)
        elif dec[0] == 'message':
            message(dec)
        elif dec[0] == 'help':
            help_message()
        elif dec[0] == 'logout':
            index()
        elif dec[0] == 'exit':
            break

        commit(db)


def help_message():
    print('commands::\n' +
          'actvses                                           active session\n' +
          'tweet <-p::post[content], -s::self>\n' +
          'follow [username]\n' +
          'unfollow [username]\n' +
          'block [username]\n' +
          'unblock [username]\n' +
          'timeline\n' +
          'userack::user activity [username]\n' +
          'reply <-p [id, content], -s[show]>\n' +
          'hashtag [tag]\n' +
          'like <-u::upvote [id], -c::count [id], -l::list [id], -t::trend>\n' +
          'message <{send <-m::send_message [username, content], -t::send_tweet [username, id]}\n' +
          '         {get <-m::get_message [username], -t::get_tweet [username]}\n' +
          '         {getl::get_list <-m::get_message_list, -t::get_tweet_list}\n')


def message(dec):
    if dec[1] == 'send':  # send
        if dec[2] == '-m':  # message
            if len(dec) <= 4:
                print('invalid input')
                return

            send_message(cursor, [dec[3], dec[4]])
        elif dec[2] == '-t':  # tweet
            if len(dec) != 5:
                print('invalid input')
                return

            send_tweet(cursor, [dec[3], dec[4]])
    elif dec[1] == 'get':  # get
        if dec[2] == '-m':  # message
            if len(dec) != 4:
                print('invalid input')
                return

            result = get_message(cursor, [dec[3]])
            print(fetch(result))
        elif dec[2] == '-t':  # tweet
            if len(dec) != 4:
                print('invalid input')
                return

            result = get_tweet(cursor, [dec[3]])
            print(fetch(result))
    elif dec[1] == 'getl':  # get list
        if dec[2] == '-m':  # message
            if len(dec) != 3:
                print('invalid input')
                return

            result = get_message_list(cursor)
            print(fetch(result))
        elif dec[2] == '-t':  # tweet
            if len(dec) != 3:
                print('invalid input')
                return

            result = get_tweet_list(cursor)
            print(fetch(result))


def like(dec):
    if dec[1] == '-u':  # upvote
        if len(dec) != 3:
            print('invalid input')
            return

        upvote(cursor, [dec[2]])
    elif dec[1] == '-c':  # count
        if len(dec) != 3:
            print('invalid input')
            return

        result = upvote_count(cursor, [dec[2]])
        print(fetch(result))
    elif dec[1] == '-l':  # list
        if len(dec) != 3:
            print('invalid input')
            return

        result = upvote_list(cursor, [dec[2]])
        print(fetch(result))
    elif dec[1] == '-t':  # trend
        if len(dec) != 2:
            print('invalid input')
            return

        result = trends(cursor)
        display_tweets(get_table(fetch(result)))


def hashtag(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    result = get_hashtag(cursor, [dec[1]])
    display_tweets(get_table(fetch(result)))


def reply(dec):
    if dec[1] == '-p':  # post
        if len(dec) <= 3:
            print('invalid input')
            return

        content = ' '.join(dec[3:])
        print(content)

        if len(content) > 256:
            print('tweet character limit is 256')
            return

        reply(cursor, [dec[2], content])
    elif dec[1] == '-s':  # show
        if len(dec) != 3:
            print('invalid input')
            return

        result = show_replies(cursor, [dec[2]])
        display_tweets(get_table(fetch(result)))


def user_activity(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    result = user_activity(cursor, [dec[1]])
    display_tweets(get_table(fetch(result)))


def timeline(dec):
    if len(dec) != 1:
        print('invalid input')
        return

    result = timeline(cursor)
    display_tweets(get_table(fetch(result)))


def unblock(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    unblock(cursor, [dec[1]])


def block(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    block(cursor, [dec[1]])


def unfollow(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    unfollow(cursor, [dec[1]])


def follow(dec):
    if len(dec) != 2:
        print('invalid input')
        return

    follow(cursor, [dec[1]])


def tweet(dec, uin):
    # if len(dec)

    if dec[1] == '-p':  # post
        content = uin[8:]

        if len(content) > 256:
            print('tweet character limit is 256')
            return

        tweet(cursor, [content])
    elif dec[1] == '-s':  # self
        if len(dec) != 2:
            print('invalid input')
            return

        result = get_personal_tweet(cursor)
        display_tweets(get_table(fetch(result)))


def active_session(dec):
    if len(dec) != 1:
        print('invalid input')
        return

    result = login_history(cursor)
    print(fetch(result))


if __name__ == '__main__':
    db =connect()
    cursor = db.cursor(named_tuple=False)

    handler()
