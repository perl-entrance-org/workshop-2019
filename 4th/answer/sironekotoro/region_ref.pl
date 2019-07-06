#!/usr/bin/env perl
use strict;
use warnings;

# まず, 以下のデータ構造を表す`%japan`を作ってください.

# japan
#  ├─ tokyo
#  │    ├─ gotanda
#  │    └─ shibuya
#  ├─ osaka
#  │    └─ shinsaibashi
#  ├─ okinawa
#  │    ├─ naha
#  │    └─ yomitan
#  ├─ hokkaido
#  │    ├─ sapporo
#  │    └─ obihiro
#  └─ fukuoka
#        └─ hakata

my %japan = (
    tokyo    => [ 'gotanda', 'shibuya' ],
    osaka    => ['shinsaibashi'],
    okinawa  => [ 'naha', 'yomitan' ],
    hokkaido => [ 'sapporo', 'obihiro' ],
    fukuoka  => ['hakata'],
);

# 1. 作成したデータから `tokyo` に含まれる `gotanda`, `shibuya`を表示してください
print '--------' . "\n";
print $japan{tokyo}->[0] . "\n";      # gotanda アロー記法
print ${ $japan{tokyo} }[1] . "\n";   # shibuya 素直にデリファレンス

# 1. 作成したデータの `osaka` に `umeda`を追加してください
print '--------' . "\n";
push @{ $japan{osaka} },
    'umeda';    # 配列リファレンスにpushで追加する場合
print 'check:' . $japan{osaka}->[1] . "\n";

# 1. 作成したデータの `okinawa` に `piyo`を追加してください
print '--------' . "\n";
$japan{okinawa}->[2] = 'piyo';    # 添字を使って直接代入する場合
print 'check:' . $japan{okinawa}->[2] . "\n";

# 1. 作成したデータの `hokkaido` に `chitose`を追加し, `sapporo`を削除してください
print '--------' . "\n";
push @{ $japan{hokkaido} }, 'chitose';
shift @{ $japan{hokkaido} }
    ; # sapporo は配列リファレンスの先頭にあるので、shiftを使ってみる

# 1. 作成したデータの `fukuoka` を削除してください
delete $japan{fukuoka};

# 1. Data::Dumperでデータ構造を表示してください
use Data::Dumper;
print Dumper \%japan;

# 1. 時間の余裕のある人は、Data::Dumper を使わずに `%japan` 内のデータを全て表示してみましょう
for my $region ( keys %japan ) {
    print $region . "\n";
    for my $place ( @{ $japan{$region} } ) {
        print '  ' . $place . "\n";
    }
}

# 1. さらに時間の余裕がある人は`splice`関数について調べてみましょう
# https://perldoc.jp/func/splice
# splice を使うことで、配列の先頭や末尾以外の要素の追加、取り出し削除が可能になる
