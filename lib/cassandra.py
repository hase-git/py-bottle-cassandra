import time, json

from pycassa.pool import ConnectionPool
from pycassa.columnfamily import ColumnFamily
from pycassa.cassandra.ttypes import NotFoundException

__all__ = ['get_timeline_by_boardid', 'tweet', 'DatabaseError',
    'NotFound', 'InvalidDictionary']

POOL = ConnectionPool(keyspace='board', server_list=['localhost:9160'], prefill=False)

Board = ColumnFamily(POOL, 'timeline')

class DatabaseError(Exception):
    """
    The base error that functions in this module will raise when things go
    wrong.
    """
    pass

class NotFound(DatabaseError):
    pass


class InvalidDictionary(DatabaseError):
    pass



def get_timeline_by_boardid(boardid, start, limit):
    start = long(start) if start else ''
    next = None
    try:
        timeline_json = Board.get(str(boardid), column_start=start,
            column_count=limit + 1, column_reversed=True)
        timeline = []
        for tweetid in timeline_json:
            tweet = json.loads(timeline_json[tweetid])
            tweet['time'] = tweetid
            timeline.append(tweet)
    except NotFoundException:
        return []
    return timeline

def tweet(boardid, name, tweet):
    ts = long(time.time() * 1e6)
    return Board.insert(boardid, {ts: json.dumps({'name': name, 'tweet': tweet})})
