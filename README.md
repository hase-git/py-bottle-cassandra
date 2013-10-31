# python-bottle-cassandra

インフラの課題でカサンドラで掲示板作るってのがあるらしいので

カサンドラ + bottleを使ってみる

# 環境

## bottle

pythonのシンプルなフレームワーク

### アノテーション

ルート、view定義
```
@route('/boards/top')

@view('/boards/top')
```
### パラメータ取得
```
request.params.get('limit')

request.forms.get('name')
```

### テンプレートエンジン

SimpleTemplateEngine

インクルード
```
% include template/footer.tpl
```
パラメータ埋め込み
```
% include template/header.tpl title='Board', scripts=['/public/js/boards/page.js']

{{tweet['time']}} 
```

## pycassa

pythonのカサンドラORM、コネクションプーリングをやってくれる

### Connection取得
```
POOL = ConnectionPool(keyspace='TEST', server_list=['localhost:9160'], prefill=False)
```
### カラムファミリ取得
```
Board = ColumnFamily(POOL, 'Board')
```

### get

```
timeline_json = Board.get(str(boardid), column_start=start,
  column_count=limit + 1, column_reversed=True)
```

### put

```
Board.insert(boardid, {ts: json.dumps({'name': name, 'tweet': tweet})})
```

## cassandra

このへんパスとうしたりするのが現状うまくいってない

あとコマンドよくわかってない


```
cd /usr/local/cassandra

bin/cassandra -f

cassandra start

cassandra-cli

[default@unknown] create keyspace board;

[default@board] create column family timeline WITH column_type='Standard' AND comparator='LongType' AND key_validation_class='UTF8Type' AND default_validation_class='UTF8Type';

// WITH column_type='Standard' AND comparator='UTF8Type' AND key_validation_class='LongType' AND default_validation_class='LongType';

```

後で調べる

cql, thrift


