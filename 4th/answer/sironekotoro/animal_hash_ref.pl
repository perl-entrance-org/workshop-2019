#!/usr/bin/env perl
use strict;
use warnings;

#     animal
#       ├─ dog
#       │    ├─ name: 'Taro'
#       │    └─ color: 'brown'
#       └─ cat
#            ├─ name: 'Tama'
#            └─ color: 'white'

# 次の処理をする `animal_hash_ref.pl` を作りましょう。

# ハッシュのハッシュ です。dog , cat はそれぞれkeyと考えてください。

# 1. 上記のデータ構造を表す`%animal`を作ってください。
my %animal = (
    dog => { name => 'Taro', color => 'brown' },
    cat => { name => 'Tama', color => 'white' },
);

print '`%animal`の中にある`white`を表示してください。' . "\n";
print $animal{cat}->{color} . "\n";

print '余裕があれば, 他の要素も表示してみましょう。'
    . "\n";
for my $type ( keys %animal ) {
    print $type . "\n";
    print "  " . $animal{$type}->{name} . "\n";        # アロー記法
    print "  " . ${ $animal{$type} }{color} . "\n";    # 素直にデリファレンス
}
