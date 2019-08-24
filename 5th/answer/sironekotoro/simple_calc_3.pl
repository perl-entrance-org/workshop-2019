#!/usr/bin/env perl
use strict;
use warnings;

# 次のようなサブルーチンを持つコードを simple_calc.pl という名前で作成しよう。

#     2つの引数の和（足し算）を計算する add
#     2つの引数の差（引き算）を計算する min
#     2つの引数の積（掛け算）を計算する mul
#     2つの引数の商（割り算）を計算する div

# これらのサブルーチンが正しく実装できているか(与えた2つの引数に対して, 適切な値を返すか)を確認するコードも一緒に書くこと。

#     時間の余った人は「0」で割った際のエラーを回避する仕組みを入れてみよう

#     さらに時間の余った人は数字以外が入力された場合に 'INPUT NUMBER PLEASE'と表示する仕組みを入れてみよう


# ---------------------------
# COMMENT:
# サブルーチンの引数受け取り方法を @_ で受け取る方法に統一
# 0 で割った時の処理を分岐
#
# 数字以外が入力された時の処理を
#  add サブルーチン内に記述
#  min 引数を1つとって数字かどうかを判断する is_number サブルーチンを利用
#  mul,div 引数を2つとって数字かどうかを判断する is_both_number サブルーチンを利用

sub add {
    my ( $left, $right ) = @_;

    # 正規表現で、2つの変数の中身が数字であることを
    # 確認する
    if ( $left =~ /\d+/ && $right =~ /\d+/ ) {

   # 2つの変数がともに数字であれば、足し算の結果を返す
        return $left + $right;
    }

    # 数字ではない場合には、メッセージを返す
    else {
        return 'INPUT NUMBER PLEASE';
    }
}

sub min {
    my ( $left, $right ) = @_;

# サブルーチン is_number() で、変数の中身が数字であることを
# 確認する
    if ( is_number($left) && is_number($right) ) {

# サブルーチンの返り値が「正」であれば、計算の結果を返す
# サブルーチンの返り値が「偽」の場合は、メッセージを返す
        return $left - $right;
    }
    else {
        return 'INPUT NUMBER PLEASE';
    }
}

sub mul {
    my ( $left, $right ) = @_;
    if ( is_both_number( $left, $right ) ) {
        return $left * $right;
    }
    else {
        return 'INPUT NUMBER PLEASE';
    }
}

sub div {
    my ( $left, $right ) = @_;
    if ( is_both_number( $left, $right ) ) {

# 時間の余った人は「0」で割った際のエラーを回避する仕組みを入れてみよう
        if ( $right eq '0' ) {
            return "Please Input Greater than 0";
        }
        return $left / $right;
    }
    else {
        return 'INPUT NUMBER PLEASE';
    }
}

# 1つの引数が数字であれば 真 を、数字でなければ 偽 を返すサブルーチン
sub is_number {
    my $argv = shift @_;
    if ( $argv =~ /\d+/ ) {
        return 1;
    }
    else {
        return 0;
    }
}

# 2つの引数がともに数字であれば 真 を、数字でなければ 偽 を返すサブルーチン
sub is_both_number {
    my ( $left, $right ) = @_;

    # サブルーチンからサブルーチンを呼び出すことも可能
    if ( is_number($left) && is_number($right) ) {
        return 1;
    }
    else {
        return 0;
    }
}

# 上記のサブルーチンが正しく動いているかを、IF文を使って判定する

print '----- CHECK START -----' . "\n";
if ( add( 10, 5 ) == 15 ) {
    print 'add: ok' . "\n";
}
else {
    print 'add: NG' . "\n";
}

if ( min( 10, 5 ) == 5 ) {
    print 'min: ok' . "\n";
}
else {
    print 'min: NG' . "\n";
}

if ( mul( 10, 5 ) == 50 ) {
    print 'mul: ok' . "\n";
}
else {
    print 'mul: NG' . "\n";
}

if ( div( 10, 5 ) == 2 ) {
    print 'div: ok' . "\n";
}
else {
    print 'div: NG' . "\n";
}

if ( div( 10, 0 ) eq 'Please Input Greater than 0' ) {
    print 'div 0 divide: ok' . "\n";
}
else {
    print 'div 0 divide: NG' . "\n";
}

if ( add( 'a', 1 ) eq 'INPUT NUMBER PLEASE' ) {
    print 'sum input not number: ok' . "\n";
}
else {
    print 'sum input not number: NG' . "\n";
}

if ( min( 'a', 1 ) eq 'INPUT NUMBER PLEASE' ) {
    print 'min input not number: ok' . "\n";
}
else {
    print 'min input not number: ok' . "\n";
}

if ( mul( 'a', 1 ) eq 'INPUT NUMBER PLEASE' ) {
    print 'mul input not number: ok' . "\n";
}
else {
    print 'mul input not number: ok' . "\n";
}

if ( div( 'a', 1 ) eq 'INPUT NUMBER PLEASE' ) {
    print 'div input not number: ok' . "\n";
}
else {
    print 'div input not number: ok' . "\n";
}

print '----- CHECK END -----' . "\n";

