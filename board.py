from bottle import route, run, template, static_file, post, get, request
import json
from lib import cassandra

@route('/')
def index():
    limit = request.params.get('limit')
    since = request.params.get('since')
    if limit == None:
        limit = 100
    res = cassandra.get_timeline_by_boardid('mainboard', since, int(limit))
    return template('template/board/top', timeline=res)

@route('/public/:fname#.*#')
def static(fname):
    return static_file(fname, root='public')

@post('/boards/tweet')
def tweet():
    name = request.forms.get('name')
    tweet = request.forms.get('tweet')
    return json.dumps(cassandra.tweet('mainboard', name, tweet))

run(host='0.0.0.0', port=8080)
