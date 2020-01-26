#!/usr/bin/env perl
use Mojolicious::Lite;
use lib 'lib';
use Model;

get '/' => sub {
    my $c = shift;
    $c->render( template => 'index' );
};

post '/' => sub {
    my $c = shift;

    # 最低限のValidation
    my $v = $c->validation;

    # CSRFトークンのチェック
    $v->csrf_protect;
    return $c->render( text => 'Bad CSRF token!', status => 403 )
      if $v->has_error('csrf_token');

    # numパラメータが数字かどうか
    $v->required('num')->like(qr/[1-9][0-9]*/);
    return $c->render( text => 'Bad parameter for number!' )
      if $v->has_error;

    # パラメータをModel::fizzbuzzメソッドに渡す
    my $num = $v->param('num');
    my $res = Model::fizzbuzz($num);

    # 結果をスタッシュに入れる
    $c->stash( 'num', $num );
    $c->stash( 'res', $res );
    $c->render( template => 'index' );
};

app->start;
