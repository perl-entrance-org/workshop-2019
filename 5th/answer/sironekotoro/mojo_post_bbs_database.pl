#!/usr/bin/env perl
use Mojolicious::Lite;

# https://tutorial.perlzemi.com/blog/20091121124667.html

# 要 DBI, DBD::SQLite モジュール
use DBI;
use DBD::SQLite;
my $database    = 'test.db';
my $data_source = "dbi:SQLite:dbname=$database";
# 書き込み可能にしておく
chmod 0666, $database;
my $dbh = DBI->connect($data_source);

# テーブルがなければ作成する、というSQL文
my $create_table = <<'EOS';
CREATE TABLE IF NOT EXISTS bbs(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  entry
)
EOS

$dbh->do($create_table);

get '/' => sub {
    my $c = shift;

    my $rows = $dbh->selectall_arrayref('SELECT * FROM bbs');

    $c->stash( rows => $rows );
    $c->render('index');
};

post '/post' => sub {
    my $c     = shift;
    my $entry = $c->param('body');

    my $sth = $dbh->prepare('INSERT INTO bbs (entry) values (?)');
    $sth->execute($entry);
    $sth->finish;

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
    <input name="body" type="text">
    <input type="submit" value="POSTで投稿する">
</form>

<p>
<% for my $row (@{$rows}){ %>
    <%= $row->[1] %><br>
<% } %>
</p>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
