<!DOCTYPE html>
<html>
  <head>
    <title>{{title}}</title>
    <link rel="stylesheet" href="/public/css/bootstrap.min.css">
    <link rel="stylesheet" href="/public/css/bootstrap-responsive.min.css">
    <link rel="stylesheet" href="/public/css/bootstrap-datetimepicker.min.css">
    <style>
      body { padding-top: 40px; }
      @media screen and (max-width: 979px) {
        body { padding-top: 0px; }
      }
      
    </style>
    <script type="text/javascript" language="javascript" src="/public/js/jquery.min.js"></script>
    <script type="text/javascript" language="javascript" src="/public/js/bootstrap.min.js"></script>
    <script type="text/javascript" language="javascript" src="/public/js/moment.min.js"></script>
    <script type="text/javascript" language="javascript" src="/public/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" language="javascript" src="/public/js/bootstrap-datetimepicker.min.js"></script>
    % for url in scripts:
        <script type="text/javascript" language="javascript" src="{{url}}"></script>
    % end
  </head>
  <body>
    <div class="navbar navbar-fixed-top navbar-inverse">
      <div class="navbar-inner">
        <div class="container">
          <button data-toggle="collapse" data-target=".nav-collapse" class="btn btn-navbar">Menu</button><a href="/" class="brand">Board</a>
          <div class="nav-collapse collapse">
          </div>
        </div>
      </div>
    </div>
