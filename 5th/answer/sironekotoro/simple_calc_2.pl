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
# ---------------------------

sub add {
    my ( $left, $right ) = @_;
    return $left + $right;
}

sub min {
    my ( $left, $right ) = @_;
    return $left - $right;
}

sub mul {
    my ( $left, $right ) = @_;
    return $left * $right;
}

sub div {
    my ( $left, $right ) = @_;

    # 時間の余った人は「0」で割った際のエラーを回避する仕組みを入れてみよう
    if ($right eq '0'){
        return "Please Input Greater than 0";
    }
    return $left / $right;
}

# 上記のサブルーチンが正しく動いているかを、IF文を使って判定する

print '----- CHECK START -----' . "\n";
if ( add( 10 , 5 ) == 15 ) {
    print 'sum: ok' . "\n";
}

if ( min( 10 , 5 ) == 5 ) {
    print 'min: ok' . "\n";
}
else{
    print 'min: NG' . "\n";
}

if ( mul( 10 , 5 ) == 50 ) {
    print 'mul: ok' . "\n";
}
else{
    print 'mul: NG' . "\n";
}

if ( div( 10 , 5 ) == 2 ) {
    print 'div: ok' . "\n";
}
else{
    print 'div: NG' . "\n";
}

if ( div( 10 , 0 ) eq 'Please Input Greater than 0'  ) {
    print 'div 0 divide: ok' . "\n";
}
else{
    print 'div 0 divide: NG' . "\n";
}

print '----- CHECK END -----' . "\n";

