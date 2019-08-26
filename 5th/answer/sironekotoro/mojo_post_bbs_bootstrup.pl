#!/usr/bin/env perl
use Mojolicious::Lite;

my @entries = ();

get '/' => sub {
  my $c     = shift;
  $c->stash( kakikomi => \@entries );
  $c->render('index');
};

post '/post' => sub {
  my $c     = shift;
  my $entry = $c->param('body');
  push @entries , $entry;
  $c->redirect_to('/'); # 投稿を受け付けた後に、get で / に移動
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'BBS';
<h1>掲示板です</h1>

<form action="/post" method="post">
    <input name="body" type="text">
    <input type="submit" value="POSTで投稿する">
</form>

<table class="table table-bordered table-hover">
<tr>
  <th>ID</th>
  <th>書き込み</th>
</tr>

<% for my $index ( 0 .. $#{$kakikomi} ){ %>
  <tr>
    <td><%= $index %></td>
    <td><%= $kakikomi->[$index] %></td>
  </tr>
<% } %>
</table>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <title><%= title %></title>
  </head>
  <body><%= content %></body>
</html>
