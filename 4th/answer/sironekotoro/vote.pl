#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

### 1-1. リファレンスの作成

# 1. 自分の名前`name`と、好きな食べ物`favorite_foods`をkeyに持つハッシュリファレンスを作成してください。このとき、好きな食べ物のvalueは配列のリファレンスにしてください。
my $ref_1 = {
    name           => 'sironekotoro',
    favorite_foods => 'ramen',
};

# 2. 同様のハッシュリファレンスを2, 3個作ってみましょう。（例が思い浮かばなければ、周りの人のリアルデータを使ってみましょう）
my $ref_2 = {
    name           => 'doraemon',
    favorite_foods => 'dorayaki',
};

my $ref_3 = {
    name           => 'nobita',
    favorite_foods => 'ramen',
};

### 1-2. リファレンスを配列に格納

# 1-1で作成した複数のハッシュリファレンスを、1つの配列に格納し、表示してみましょう。
my @array = ( $ref_1, $ref_2, $ref_3 );

for my $ref (@array) {
    print '---------' . "\n";
    print 'NAME: ' . $ref->{name} . "\n";
    print 'FOOD: ' . $ref->{favorite_foods} . "\n";
    print '---------' . "\n";
}

### 1-3. ランキングの表示

# どのような方法でも良いので、好きな食べ物のランキングを作って、表示してみてください。

# 食べ物だけ格納した配列を作る
my @food;
for my $ref (@array) {
    push @food, $ref->{favorite_foods};
}

# 食べ物の名前をハッシュのkey、valueに登場回数が来るハッシュを作る
my %hash;
for my $food_name (@food) {
    $hash{$food_name}++;
}

# ハッシュの登場回数でソートして表示する
print 'RANKING' . "\n";
for my $food_name ( sort { $_{$b} <=> $_{$a} } keys %hash ) {
    print $food_name . ' => ' . $hash{$food_name} . "\n";
}

