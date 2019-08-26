#!/usr/bin/env perl
use Mojolicious::Lite;

my @entries = ();

get '/' => sub {
    my $c = shift;
    $c->stash( kakikomi => \@entries );
    $c->render('index');
};

post '/post' => sub {
    my $c     = shift;
    my $entry = $c->param('body');
    push @entries, $entry;
    $c->redirect_to('/')
        ;    # 投稿を受け付けた後に、get で / に移動
};

get '/update' => sub {
    my $c     = shift;
    my $index = $c->param('update');
    $c->stash(
        index => $index,
        entry => $entries[$index],
    );

    $c->render('update');
};

post '/update' => sub {
    my $c = shift;

    my $index = $c->param('index');
    my $entry = $c->param('body');

    splice @entries, $index, 1, $entry;

    $c->redirect_to('/')
        ;    # 投稿を受け付けた後に、get で / に移動
};

post '/delete' => sub {
    my $c     = shift;
    my $index = $c->param('delete');
    splice @entries, $index, 1;
    $c->redirect_to('/')
        ;    # 投稿を受け付けた後に、get で / に移動
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'BBS';
<h1>掲示板です</h1>

<form action="/post" method="post">
    <input name="body" type="text" value="">
    <input type="submit" value="POSTで投稿する">
</form>

<table border ="1">
<tr>
  <th>ID</th>
  <th>書き込み</th>
  <th>更新</th>
  <th>削除</th>
</tr>

<% for my $index ( 0 .. $#{$kakikomi} ){ %>
  <tr>
    <td><%= $index %></td>
    <td><%= $kakikomi->[$index] %></td>
    <td><form action="/update" method="get"><button type="submit" name="update" value="<%= $index %>">更新</button></form></td>
    <td><form action="/delete" method="post"><button type="submit" name="delete" value="<%= $index %>">削除</button></form></td>
  </tr>
<% } %>
</table>

@@ update.html.ep
% layout 'default';
% title 'BBS';
<h1>書き込み内容の更新です</h1>

<form action="/update" method="post">
    <input name="index" type="hidden" value="<%= $index %>">
    <input name="body" type="text" value="<%= $entry %>">
    <input type="submit" value="POSTで投稿する">
</form>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
