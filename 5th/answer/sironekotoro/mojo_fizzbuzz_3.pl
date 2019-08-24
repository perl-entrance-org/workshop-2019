#!/usr/bin/env perl
use Mojolicious::Lite;

# テンプレート部ではなく、コントローラー部に fizzbuzz を書いてテンプレート経由で表示する

get '/' => sub {
    my $c        = shift;
    # サブルーチンを呼び出し、その返り値を変数に入れる
    my $fizzbuzz_array_ref = return_fizzbuzz();
    # 変数をstashでセットして、viewに渡せるようにする
    $c->stash( fizzbuzz => $fizzbuzz_array_ref );
    $c->render( template => 'index' );
};

sub return_fizzbuzz {

    # fizzbuzz格納用の配列
    my @fizzbuzz;

    for my $num ( 1 .. 100 ) {
        if ( $num % 15 == 0 ) {
            push @fizzbuzz, 'fizzbuzz';
        }
        elsif ( $num % 3 == 0 ) {
            push @fizzbuzz, 'fizz';
        }
        elsif ( $num % 5 == 0 ) {
            push @fizzbuzz, 'buzz';
        }
        else {
            push @fizzbuzz, $num;
        }
    }
    # 配列リファレンスにして返す。
    # 配列で返してもいいが、どうせstashでviewに渡すときに
    # 配列リファレンスにするので、ここでリファレンス化しておく
    return \@fizzbuzz;
}

app->start;
__DATA__
@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
<!-- viewでは単に配列リファレンスをでリファレンスして順に表示しているだけ -->
<% for my $e ( @{$fizzbuzz}) { %>
    <%= $e %>
<% } %>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
