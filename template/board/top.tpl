% include template/header.tpl title='Board', scripts=['/public/js/boards/page.js']
<div class="container">
  <div class="row">
    <div class="span4">
      <div class="well">
        <form method="POST" action="/board/tweet" class="form-inline">
          <dl>
            <dd>
              <input type="text" name="name" placeholder="your name" class="span3"/>
            </dd>
            <dd>
              <input type="text" name="tweet" placeholder="今の気持ちをつぶやいてみよう" class="span3"/>
            </dd>
          </dl>
          <dl>
            <dd>
              <button type="button" id="tweet-btn" class="btn btn-primary">投稿</button>
            </dd>
          </dl>
        </form>
      </div>
    </div>
    <div class="span8">
      <div class="well">
        <span class="alert alert-info span6" style="display:none;"></span>
        <legend>投稿</legend>
        <table class="table table-bordered">
          <tbody>
            % for tweet in timeline:
              <tr>
                <td>
                  <dl>
                    <dt>{{tweet['time']}} - {{tweet['name']}}</dt>
                    <dd>{{tweet['tweet']}}</dd>
                  </dl>
                </td>
              </tr>
            % end
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
% include template/footer.tpl
