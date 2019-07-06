#!/usr/bin/env perl
use strict;
use warnings;

# ## 練習問題(animal_array_ref.pl)
# ```
#     animal
#        ├──┬─ shiba
#        │  └─ bull
#        │
#        ├──┬─ mike
#        │  └─ kuro
#        │
#        └──┬─ eagle
#           └─ crow
# ```

# 次の処理をする `array_ref.pl` を作りましょう。

# 1. 上記のデータ構造を表す`@animal`を作ってください。

# 無名ハッシュを使う方法
my @animal = ( [ 'shiba', 'bull' ], [ 'mike', 'kuro' ], [ 'eagle', 'crow' ] );

# 1. `@animal`の中にある`eagle`を表示してください。
print $animal[2]->[0] , "\n";

# 1. 余裕があれば, 他の要素も表示してみましょう。
print "全ての要素を表示する\n";
for my $group (@animal){
    for my $element (@{$group}){
        print $element , "\n";
    }
}

