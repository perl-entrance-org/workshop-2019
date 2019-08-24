#!/usr/bin/env perl
use Mojolicious::Lite;

# <br> で改行したり、 <font color ='blue'> や <font color ='red'> などで結果に応じた色をつけてみる

get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

app->start;
__DATA__
@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
<!-- 以下4行を追加 -->
<% for my $num (1 .. 100){ %>

  <% if ($num % 15 == 0 ){ %>
    <font color="blue">fizzbuzz</font><br>
  <% } elsif ($num % 3 == 0 ){ %>
    <font color="red">fizz</font><br>
  <% } elsif ($num % 5 == 0 ){ %>
    <font color="purple">buzz</font><br>
  <% } else { %>
    <%= $num %><br>
  <% } %>
<% } %>
@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>