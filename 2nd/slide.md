# Perl入学式 第2回

## 構文基礎編

___
## 諸注意
- 会場について
    - 飲食・喫煙・トイレetc

- 写真撮影について
    - 写真撮影NGな方はお手数ですが申し出てください

    - 写真はPerl普及団体の [JPA ( Japan Perl Association )](https://japan.perlassociation.org/)への活動報告に利用します

___
## 講師紹介

- 講師・サポーター紹介

___
## 皆さんで自己紹介
- せっかく今日集まったので, テーブルで自己紹介をしましょう.

- 話題は自由ですが, 以下がオススメです

    - 名前(ハンドルネーム)

    - なぜPerlを勉強してみようと思ったか

    - なぜPerl入学式に参加してみようと思ったか

___
## 今日の流れ
- 前回の復習
- 条件分岐（ if文）
- 比較演算子（ <, >, ==, !=, eq, ne, gt, lt ）
- 論理演算子（ &&, || ）
- 配列
- 繰り返し（ for文 ）
- 配列の操作( join, split, push, pop, shift, unshift, reverse, sort )
- ハッシュ
- ハッシュの操作（ keys, values, delete, exsts ）

---
# 前回の復習

___
## ターミナルからディレクトリ操作
```bash
    $ cd                    # ホームディレクトリに移動する
    $ pwd                   # 現在のパスを表示する
    $ ls -l                 # ファイル・フォルダの一覧を表示する
    $ mkdir perl-entrance   # perl-entrance というフォルダを作成する
    $ cd perl-entrance      # 作成した perl-entrance フォルダに移動する
    $ mkdir 2nd             # 2nd というフォルダを作成する
    $ cd 2nd                # 作成した 2nd というフォルダに移動する
```

> ｢ホームディレクトリ｣とは, ユーザごとに用意された作業場所のようなものです (第1回 第2部)

`perl-entrance` ディレクトリがすでにある方は, 4行目の `mkdir perl-entrance` は省略してください

今日作成するスクリプトは, この `2nd` ディレクトリの中に入れていくと良いでしょう

___
## おまじない
```perl
    #!/usr/bin/env perl
    use strict;
    use warnings;
```
- `#!/usr/bin/env perl`
    - Perlの実行プログラムの場所を指定する
- `use strict`
    - 厳密な書式を定めたり, 未定義の変数を警告する
- `use warnings`
    - 望ましくない記述を警告する

- 以下, この資料のサンプルコードでは紙面の都合上｢おまじない｣を省略しますが, 皆さんは**必ず記述してください**

___
## Hello, World!(hello.pl)
```perl
    print "Hello, World!\n";
```
- このように書いたものを, `hello.pl` として保存します

- `print` は, ターミナルに文字を出力します

- `Hello, World!` はダブルクォーテーション `" "` で囲みます

- `\n` は改行を表します

- 行の最後に `;` を忘れずに！

- そして｢おまじない｣の3行も忘れないこと！

___
## Hello, World! の実行
```bash
    $ perl hello.pl

    Hello, World!
```

1. ターミナルを開きます

1. `perl` から1つスペースを空けて `hello.pl` と入力してenterキーを押します

    - プログラムに渡される情報, 値などを**引数**と言う

    - この例では `hello.pl` が引数にあたる

1. プログラムの中に書いた `Hello, World` が表示されます

___
## 復習問題　(hello\_perl.pl, calc.pl)
1. `Hello, Perl Entrance!` という文字列を出力するスクリプト `hello_perl.pl` を書いて下さい

1. 標準入力 `<STDIN>` から 0 以外の整数を 2 つ読み込み, それらを四則演算(`+`, `-`, `*`, `/`)した結果を下の例のように出力するスクリプト `calc.pl` を作成してください

```text
    1 + 2 = 3

    1 - 2 = -1

    1 * 2 = 2

    1 / 2 = 0.5
```

わからない所があれば, 近くのサポーターに聞きましょう！

---
# if文

___
## 条件分岐
変数の状態に応じてスクリプトの動きを分岐させることを **条件分岐** といいます

条件分岐には様々なパターンがありますが、それらを **真** , **偽** の2つの組み合わせで表現します

真, 偽 の判断に用いる式を **条件式** といいます

___
## Perlにおける真偽値
Perlでは, 次の5つの値が｢偽｣の値として扱われます

1. 数値｢`0`｣

1. 文字列｢`'0'`｣

1. 文字列｢`''`｣（シングルクォーテーションの連続, 間に何もない. 空文字ともいう）

1. 空のリスト｢`()`｣

1. `undef`

そしてこれ以外の値は, Perlでは全て「真」として扱われます

明示的な「真」の値が必要な場合, 数値の `1` を使う場合が多いです

___
## Perlにおける真偽値

他のプログラミング言語では, `true` や `false` という単語に 真 , 偽 の意味を持つキーワードとして扱われることが多いです

しかし, Perlは, `true` や `false` などで真偽値を表すことはできず, また特別な意味もありません

___
## if文
```perl
    if ( 1 ) {           # 明示的な「真」の値である 1

        print "OK\n";    # 条件が｢真｣なので出力される

    }
```

```perl
    if ( 0 ) {           # 「偽」の値である 0

        print "OK\n";    # 条件が｢偽｣なので出力されない

    }
```

___
## 数値の比較演算子
```perl
    == # 右辺と左辺が等しいならば「真」

    != # 右辺と左辺が等しくないならば「真」

    <  # 右辺より左辺が小さいならば「真」

    >  # 右辺より左辺が大きいならば「真」

    <= # 右辺が左辺以上ならば「真」

    >= # 右辺が左辺以下ならば「真」
```

数値同士を比較するときは, このような記号を用いた比較演算子を使います

___
## 数値を使った条件分岐
```perl
    my $foo = 1;

    if ( $foo == 1 ) {
        print "OK\n"; # 条件が｢真｣の場合
    }
    else {
        print "NG\n"; # 条件が｢偽｣の場合
    }
```

`( )`　の中の `$foo == 1` が条件式です

`==` は **右辺と左辺が数値として等しければ真** であることを意味します

ここでは `$foo` が `1` と等しい場合に「真」となり, `OK` という文字が表示されます

`$foo` が `1` と等しくない場合は, 「偽」となり, `else` に処理が移って `NG`　という文字が表示されます

___
## よくあるまちがい (1)
```perl
    my $foo == 1; # NG

    my $bar =  1; # OK
```

数値の比較に用いる `==` と, 代入の `=` を間違えています

この場合, 実行すると以下のエラーが出ます

    Useless use of numeric eq (==) in void context

「おまじない」の3行を忘れた場合はエラーが出ずに危険です

___
## よくあるまちがい (2)
```perl
    my $foo = 1;

    if ($foo =  1) { print $foo } # NG

    if ($foo == 1) { print $foo } # OK
```

条件式に注目してください

代入の `=` と, 数値の比較に用いる `==` を間違えています

この場合, 実行すると以下のエラーが出ます

    Found = in conditional, should be ==

「おまじない」の3行を忘れた場合はエラーが出ずに危険です

___
## 文字列の比較演算子
```perl
    eq  # equal

    ne  # not equal

    gt  # greater than

    ge  # greater equal

    lt  # less than

    le  # less equal
```
文字列を比較する場合は`eq`や`ne`といった単語を用いた比較演算子を使います

「文字列の大小」とは, 文字列の長さではありません

辞書順に並べた時に前にくるものが小さく, 後ろにくるものが大きいという意味です

___
## 文字列を使った条件分岐
```perl
    my $foo = 'hello';

    if ( $foo eq 'hello' ) {
        print "OK\n";   # 文字列が等しいので OK と表示される
    }
    else {
        print "NG\n";
    }
```

文字列を比較しているので, `==` ではなく `eq`を用いています

___
## 練習問題(question\_word.pl)
```perl
    #!/usr/bin/env perl
    use strict;
    use warnings;
    my $answer = 'perl';    # 好きな文字を入力しておく
```

簡単な文字当てゲーム `question_word.pl`を作成しよう

1. ターミナルから, 標準入力で文字列を一つ入力します

1. その文字列が `$answer` と一致したら`OK`と表示します

1. 外れたら `NG` と表示します

___
## 数値 と 文字列 の比較を混合させるアンチパターン
```perl
    if ( '51ichiro' == 51 ) {   # 悪い条件式
        print "OK\n";
    }
```

    Argument "51ichiro" isn't numeric in numeric eq (==) # 警告がでる

警告こそ出るものの, Perlは処理を継続します

1. 文字列 `'51ichiro'` の先頭に `51` という数値がある

1. Perlは `==` の演算子の左辺は数字 `51` として処理を実行する

1. そのため, この比較は真となり,  `OK` という文字列が出力される

文字列を `==` で比較することは意図しない結果を招きます. 数値と文字列の比較をしてはいけません

___
## 数値 と 文字列 の比較を混合させるアンチパターン
```perl
    if ( '51' eq 51 ) {
        print "OK\n";
    }
```

先の例とは逆の場合です

文字列の比較演算子で数値を比較しようとした場合, 警告は出ません

Perlは自動的に数値を文字列として解釈して, `eq` 演算子の右辺は文字列 `'51'` として扱われます

そのため, この比較は「真」となり, `OK` という文字列が出力されます

___
## 複数の条件分岐
```perl
    my $foo = 1;

    if ( $foo == 1 ) {
        print '$foo is One';
    }
    elsif ( $foo == 2 ) {
        print '$foo is Two';
    }
    elsif ( $foo == 3 ) {
        print '$foo is Three';
    }
    else {
        print '$foo is not even One, even Two, even Three';
    }
```
- `elsif`を使うことで, 分岐条件を増やすことができます

- `else if` ではなく, **`elsif`** です

---
# 論理演算子

___
## 論理演算子 AND, OR
```perl
    && # かつ

    || # または
```

`if文`で複雑な条件を扱いたいときは, `論理演算子`を用いて複数の条件を連結します

- `&&` 演算子は｢かつ・AND｣の意味を持ち, 両辺の条件が真となるときのみ真となる

- `||` 演算子は｢または・OR｣の意味を持ち, 条件の片方1つでも真ならば真となる

___
## 論理演算子 AND, OR
```perl
    my $foo = 10;

    if ( $foo > 0 && $foo % 2 == 0 ) {  # $fooが 0 より大きい かつ 2 で割り切れる
        print "&&: OK\n";    # &&: OK
    }
    else{
        print "&&: NG\n"
    }
```

条件式の中の `$foo > 0 && $foo % 2 == 0` が 真 となり, `OK` と表示されます

1. `$foo` が 0 より大きいので, `$foo > 0`　を満たす

1. `$foo` を 2 で割った剰余は 0 なので, `$foo % 2 == 0` も満たす

1. 「1. かつ 2. が 真」の条件を満たすので条件式は 真 となり、`&&: OK` と表示される

___
## 論理演算子 AND, OR
```perl
    my $foo = 10;

    if ( $foo > 0 || $foo % 2 == 1 ) {  # $fooが 0 より大きい または 2 で割り切れない
        print "||: OK\n";    # ||: OK
    }
    else{
        print "&&: NG\n"
    }
```
条件式の中の `$foo > 0 || $foo % 2 == 1` が 真 となり, `||: OK` と表示されます

1. `$foo` が 0 より大きいので, `$foo > 0`　を満たす

1. 「1. または 2. が 真」の条件のうち、「1. が 真 」を満たすので条件式は 真 となり、`||: OK` と表示される

___
## 3つ以上の値を比較したい場合
```perl
    my $small  = 10;
    my $medium = 20;
    my $large  = 30;

    if ( $small < $medium < $medium < $large ) {
        print "小さい順に並んでます\n";
    }
```

`$small < $medium < $large` のように3つ以上の値を同時に比較することはできません

下記のようなエラーとなります

    syntax error at sample.pl line 5, near "$medium <"

___
## 3つ以上の値を比較したい場合
```perl
    my $small  = 10;
    my $medium = 20;
    my $large  = 30;

    if ( $small < $medium && $medium < $large ) {
        print "小さい順に並んでます\n";
    }
```
`$small < $medium` かつ `$medium < $large` というように, 関係演算子を使って比較します

___
## 練習問題(question\_num.pl)
```perl
    #!/usr/bin/env perl
    use strict;
    use warnings;
    my $answer = 10;    # 好きな値を入力しておく
```
簡単な数当てゲーム `question_num.pl`を作成しよう

ターミナルから数字を一つ入力し, その数字とスクリプト中の `$answer`　と比較して以下のように表示してください

- `$answer` と一致したら `OK`

- `$answer` より大きければ `too big`

- `$answer` より小さければ `too small`

- （余裕があれば）入力した値が, `$answer`から-5〜+5の範囲内(例えば, `$answer`が10なら, 5〜15)の場合, `near`と表示する

---
# 配列

___
## 配列
```perl
    my @array = ( 1, "foo", 3 );
```

1行目の右辺, `( 1, "foo", 3 )` の部分を **リスト** と呼びます

このリストをPerlで操作するために **配列変数** に格納します

配列に含まれる `1`, `"foo"`, `3` それぞれを **要素** といいます

スカラー変数と同様に `=` 演算子を使うことで, 左辺の配列に右辺のリストを代入することができます

配列は変数名の前に`@`をつけます. `@` は `アレイ(array)`, `@rray` , と覚えるとよいでしょう. (arrayは配列を意味する英単語です)

___
## 配列変数の展開
```perl
    my @array = ( 1, "foo", 3 );

    print "@array\n";    # 1 foo 3
```

配列変数はスカラー変数と同じく `" "` ダブルクォーテーションで囲むことで変数展開が可能です

___
## 配列の要素にアクセスする
```perl
    my @array = ( 1, "foo", 3 );

    print "$array[0]\n";    # 1
```
配列 `@array` の中の要素にアクセスする方法は `$array[0]` となります

この時, シジルが配列を示す `@` からスカラー変数の `$` になっていることに注目！

これは **取り出す要素の数が1つだけなのでスカラー変数となる** ためです

> - スカラ変数：1つの要素を格納できる
> - 配列、ハッシュ：複数の要素を格納できる (第1回Part4より)

- 配列から複数の要素を取り出すときには[配列スライス](https://tutorial.perlzemi.com/blog/20080216120316.html)を利用します. この時のシジルは `@` になります. が, 時間の都合上説明はしません

___
## 配列要素の添字
```perl
    my @array = ( 1, "foo", 3 );

    print "$array[0]\n";    # 1
    print "$array[1]\n";    # foo
    print "$array[2]\n";    # 3
```

配列の1つ1つの要素にアクセスする場合は `$変数名[添字]` を使います

添字は数字で指定し, 添字は先頭の 0 からスタートして, 末尾に向けて 1 ずつ増えます

___
## 配列要素の添字
```perl
    my @array = ( 1, "foo", 3 );
    my $i = 1;
    print "$array[$i]\n";    # foo
```

配列の添字には, 数値が入ったスカラー変数を置くこともできます

___
## 配列への代入
```perl
    my @array = ( 1, "foo", 3 );
    $array[0] = "bar";    # 先頭の要素に文字列 "bar" を代入する
    print "@array";       #bar foo 3
```

配列に新たな要素を代入する際は, 取り出すときと同様に添字を使います

配列に, 配列を代入することもできます

```perl
    my @array_one_two = ( 1, 2 );
    my @array_numbers = ( @array_one_two, 3 );
    print "@array_numbers";    # 1 2 3

```
___
## 配列の計算
```perl
    my @array = ( 1, "foo", 3 );

    my $sum = $array[0] + $array[2];     # my $sum = 1 + 3

    print "$sum\n"    # 4
```

配列の要素はスカラ変数と同じように扱えるので, このような計算も可能です

___
## 配列の要素数
```perl
    my @array = ( 1, "foo", 3 );

    my $count_array_element = scalar @array;    # 要素の数を取得
    print "$count_array_element\n";             # 3

    my $last_array_index = $#array;             # 配列の末尾の要素の添字を取得
    print "$last_array_index\n";                # 2
```

配列を `scalar` 演算子に与えると, 配列に格納されている**要素の個数**を取得できます

配列`@array` に対して `$#array` と書くことで, 配列に格納されている**末尾の要素の添字**を取得できます

___
## 範囲演算子
```perl
    my @array1 = ( 1 .. 5 );
    print "@array1";    # 1 2 3 4 5
```

- 連続する数字は**範囲演算子** `..` が便利です.

- `1 .. 5` と書くことで, 1 から 5 までの連続する値を配列に代入できます

- ただし, 必ず右側の値が左側の値より大きくなければなりません.

```perl
    my @array2 = ( 5 .. 1 );
    print "@array2\n";              # （何も表示されない）
    print scalar @array2 . "\n";    # 0
```

___
## qw ショートカット
```perl
    my @array = qw( Alice Bob Chris );    # ('Alice', 'Bob', 'Chris')
```

これまでのリストの書き方 `('this', 'is', 'list', 1, 2, 3)` と異なり, クォート記号が不要です。

この記法では空白文字 (スペース, タブ, 改行など) が区切りとなり, 残ったものがリストの要素になります。

___
## qw ショートカット
```perl
    my @arary = qw(
        Alice
        Bob
    );
```

- 改行区切りを利用すれば, このような書き方もできます。

___
## qw ショートカット
```perl
    qw! Alice Bob !
    qw# Alice Bob #
    qw/ Alice Bob /
```
デリミタ (区切り文字) には任意の記号文字を使えます。
これらは下記の表記と等しいものです

```perl
    qw( Alice Bob )
```

___
## qw ショートカットと範囲演算子
```perl
my @array = qw(1 .. 50);
print @array;    # 1..50
```
qwショートカットと範囲演算子は同時に利用することができません

---
# 繰り返し（ for文 ）

___
## for ループ
```perl
    my @array = ( 1, "foo", 3 );
    for my $element (@array) {
        print "$element\n";
    }
```

配列の中身を順番に処理する方法として, **for文** があります

`foreach` と書いてもPerlの内部では同じように処理されます

この場合, 変数 `$element` に 配列の先頭から順番に `$array[0]` , `$array[1]`, `$array[2]` とスカラー値が順番に代入され, 処理が行われます

___
## forループと範囲演算子
```perl
    for my $i ( 1 .. 50 ) {
        print "$i\n";    # 1 から 50 まで1つずつ改行されて表示される
    }
```

配列のところで学習した範囲演算子 `..` を利用することで, 簡便にループ処理を記述することが可能です．

___
## 練習問題(for.pl)

1. 配列 `@array` に好きな数値や文字列を設定し, for文で出力してください。

2. `<STDIN>` を用いて配列 `@array2` に好きな数値や文字列を入力し, for文で出力してください。

    - 2つの入力値を得る場合, 配列の要素として `<STDIN>` を直接書くことはできません

        ```perl
        my @array = ( <STDIN>, <STDIN> );    # NG
        ```

    - 1つずつスカラー変数で受け取り, `chomp` をした後で配列に入れましょう

___
## 練習問題(even.pl)

- for文を使って `1` から `100` までを出力してみましょう

- 次に `1` から `100` までのうち, 偶数のみを出力するようにプログラムを変えてみましょう

    - ヒント: Perlでは計算の剰余を求める `%` 演算子があります

    - 例えば ` 5 % 3 ` は ` 5 / 3 `の余りですので，`2` が求まります

___
## 練習問題(fizzbuzz.pl)
1から100までの数字について, 以下のようなルールに従って表示を行う `fizzbuzz.pl` を作成しよう!

- その数字が `3` で割り切れるなら `Fizz` と表示する

- `5` で割り切れるなら `Buzz` と表示する

- `3` でも `5` でも割り切れるなら `FizzBuzz`

- `3` でも `5` でも割り切れないなら`その数字`

> コンピュータサイエンス学科卒業生の過半数にはそれ(fizzbuzz)ができないのだ<br>
> ()部はsironekotoro追加
> <div style="text-align: right;">参考:[どうしてプログラマに・・・プログラムが書けないのか?](http://www.aoky.net/articles/jeff_atwood/why_cant_programmers_program.htm)</div>

___
## 配列の関数（1）
配列には便利な関数があります。「関数」とは, ある働きをもつ「機能」のことだと思ってください。ここではその一部を紹介します。

- split
- join

___
## join
join は分割された文字列をくっつけて, 1つの文字列にします。

    my @words = qw( I Love Perl. ); # qwショートカット
    my $poem  = join '_', @words;
    print $poem;  # => 'I_Love_Perl.'

- join が受け取る第1引数 (上の例ではアンダースコア) は, リストの要素をくっつける糊のような役割を果たします。
- 第2引数には, 対象の配列を渡します。

___
## split
split は指定したパターンに従って文字列を分割します。

    my $poem  = 'I Love Perl.';
    my @words = split / /, $poem; #=> ('I', 'Love', 'Perl.')

- 引数として与えた文字列を,  // でくくった文字 (上の例では半角スペース) で分割して配列に格納します。
- // は正規表現リテラルと呼ばれるものです。正規表現については次回以降に詳しく説明します。

___
## 練習問題 (1/2)
- 次の処理をする `join.pl` を作りましょう。
    1. `("0120", "123", "XXX")` という配列を作ってください。
    2. 1の配列をjoin関数で連結してください。
       電話番号っぽいので, ハイフン ('-') でくっつけてみましょう。

___
## 練習問題 (2/2)
- 次の処理をする `split.pl` を作りましょう。
    1. "There's more than one way to do it." という文字列を作り, split関数で" "（半角スペース）ごとに分割して配列 `@array` に格納し, 出力してください。
    2. 好きな文字列を作り, 好きな要素で区切って配列 `@array2` に格納し, 出力してください。
        - 日本語や数字を混ぜてもよいでしょう。
        - わからないところがあれば, サポーターに聞いてみましょう！

___
## 復習問題

- [practice.md](./practice.md)
  - 今回の内容を復習することができる問題集です
  - ご不明な点があれば, 気軽にスタッフまでお尋ねください

___
## 練習問題の解答例

- [2019-answer](./answer)
  - 各会場の講師が書いた, 練習問題の解答例はこちらで公開しています
  - ※講義終了後に随時追加していきます

- [2018-answer](https://github.com/perl-entrance-org/workshop-2018/tree/master/2nd/answer)
  - 昨年分の解答例はこちらで公開しています

- [2017-answer](https://github.com/perl-entrance-org/workshop-2017/tree/master/2nd/answer)
  - 一昨年分の解答例はこちらで公開しています

___
## 落ち穂拾い
- その他, 本編で紹介しきれなかった内容を補足します。

___
## for ループ ( 応用 )
- 本編でも説明したとおり, `$#array`は`@array`の最後の添字を表します
    - この場合, `@array`には3個の要素が格納されているので, `$#array`は2となります
- この性質を応用して, 以下のように書くことができます

```
my @array = ( 1, "foo", 3 );
for my $i (0 .. ($#array)) {
  print "$array[$i]\n";
}
```
___
## for ループ ( C言語風 )
    my @array = ( 1, "foo", 3 );
    for ( my $i = 0; $i < scalar(@array); $i++ ) {
      print "$array[$i]\n";
    }

- `scalar(@array)`は, `@array`の要素数を表します
    -この場合, `@array`には3個の要素が格納されているので, `scalar(@array)`は3となります
- 最近のPerlプログラムでは, このC言語風や前述の`$#array`までの添字指定の`for`はあまり使われなくなっているようです.
    - 講義で最初に解説したforループが簡潔で, 多くの要望を満たすことができます.
___
## while ループ
    my @array = (1, "foo", 3);
    my $i = 0;
    while ( $i < scalar(@array) ) {
      print "$array[$i]\n";
      $i++;
    }

- whileループを使って, forループと同じように繰り返し処理ができます
    - whileの()の中には, 繰り返しを行うための条件を書きます
- forループでもwhileループでも同じ処理は書けますが, それぞれ適している・好まれるケースがあります
    - forループは配列全てに対して処理を行う時など, 繰り返す回数が決まっている場合に好まれる書き方です
    - whileループは繰り返す回数は決まっていないが, 特定の条件が真の間ずっと処理を繰り返したいときに好まれる書き方です



---
# 配列の関数（2）

___
## そもそも配列とは
前回、皆さんは配列の基本を勉強しました。

でも、そもそも配列ってどんなときに使うものでしょう？

___
## 配列の用途
- 要素間の順序関係を表現したい場合 (例: 待ち行列)
- 要素の単純な集まりとして表現したい場合 (例: 集合)

こうした操作をしたいとき、配列は役に立ちます

___
## 配列を扱う
配列を自在に操るためには、配列の要素を自由に

- 追加
- 取り出し

できる必要があります。

___
## 要素の追加
- push
- unshift

___
## 要素の取り出し
- pop
- shift

___
## 追加と取り出しの関係
- push / pop
- unshift / shift

___
## push / pop

    my @array = ('Alice', 'Bob');
    push @array, 'Chris';     #=> ('Alice', 'Bob', 'Chris')
    my $element = pop @array; #=> ('Alice', 'Bob')
    print $element;           #=> "Chris"

<h3>push</h3>
`[a][b][c] <=[d]` 末尾に要素を追加する
<h3>pop</h3>
`[a][b] =>[c]` 末尾の要素を取り出す

___
## unshift / shift

    my @array = ('Alice', 'Bob');
    unshift @array, 'Chris';    #=> ('Chris', 'Alice', 'Bob')
    my $element = shift @array; #=> ('Alice', 'Bob')
    print $element;             #=> "Chris"

<h3>unshift</h3>
`[d]=> [a][b][c]` 先頭に要素を追加する
<h3>shift</h3>
`[a]<= [b][c]` 先頭の要素を取り出す

___
## 練習問題 (1/2)

- 次の処理をする `array_pop_shift.pl` を作りましょう。
    1. ('Alice', 'Bob', 'Chris') という配列を作ってください。
    2. 1の配列から 'Chris' を取り出し、出力してください。
    3. 2の配列から 'Alice' を取り出し、出力してください。

___
## 練習問題 (2/2)
- 次の処理をする `array_push_unshift.pl` を作りましょう。
    1. ('Alice', 'Bob', 'Chris') という配列を作ってください。
    2. 1の配列の末尾に `Diana` を追加し、 ('Alice', 'Bob', 'Chris', 'Diana') という配列を作ってください。
    3. 2の処理に続けて、配列の最初に `Eve` を追加し、 ('Eve', 'Alice', 'Bob', 'Chris', 'Diana') という配列を作ってください。
    4. 3の配列をfor文で出力してみましょう。

___
## reverse
reverse はリストを逆順に並べ替えて、そのリストを返します。

    my @lang = qw(perl php ruby python java go);
    my @reversed = reverse @lang;
    print "@reversed"; #=> go java python ruby php perl

___
## reverse
連番を逆順で配列に格納したいときにも便利です。

    my @array = reverse ( 1 .. 5 ); #=> ( 5, 4, 3, 2, 1 )

___
## sort
sort はリストをルール順に並べ替えて、そのリストを返します。
`sort`のみ, あるいは `sort { $a cmp $b } @array` と書くと, 「文字列」として昇順に（`a`から`z`へ）ソートします

    my @lang = qw(perl php ruby python java go);
    my @sorted_lang = sort @lang; #=> go java perl php python ruby

    my @num = ( 5, 200, 40, 3, 1 );
    my @sorted_num = sort @num; #=> (1, 200, 3, 40, 5)

___
## sort
`sort { $a <=> $b } @array`と書くと, 「数値」として昇順（小さい順）にソートします

    my @num = ( 5, 200, 40, 3, 1 );
    my @sorted = sort {$a <=> $b} @num; #=> (1, 3, 5, 40, 200)

変数`$a`と`$b`はsortで使うために予約されているので, **sort以外で使わないようにしましょう**

___
## sort
「数値」として降順（大きい順）にソートする場合、以下の2つの書き方ができます。

    my @num = ( 5, 200, 40, 3, 1 );
    my @sorted1 = sort {$b <=> $a} @num; #=> (200, 40, 5, 3, 1)
    my @sorted2 = reverse sort {$a <=> $b} @num; #=> (200, 40, 5, 3, 1)

---
# ハッシュ

___
## ハッシュとは

- ハッシュはPerlのデータ構造の1つで、「連想配列」とも呼ばれます。
- 配列と同じく、値の格納・取り出しができます。
- しかし配列とは異なり、「数値」ではなく「名前」を使って、格納する「値」を指定します。
    - 要素を指定するための「名前」を "key"、key によって指定された「値」を "value" と呼びます。

___
## ハッシュの基本

以下の要素を持つ人物をハッシュで表現してみましょう。

- 名前: Alice
- 職業: Programmer
- 所属: PerlEntrance

___
## ハッシュの基本
もしこれを配列で表現するなら、以下のようになるでしょう。

    my @user = ('Alice', 'Programmer', 'PerlEntrance');
    print $user[0]; # 最初の要素が表示される  => "Alice"
    print $user[1]; # 2番目の要素が表示される => "Programmer"
    print $user[2]; # 3番目の要素が表示される => "PerlEntrance"

- しかしこの場合は、添字 `0` が名前、`1` が職業、といった条件を覚えておく必要があります。
- これは非常に面倒ですね。

___
## ハッシュの基本
同じ内容をハッシュで表現すると、このようになります。

    my %user = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    print $user{name}; # nameが表示される => "Alice"
    print $user{job};  # jobが表示される => "Programmer"
    print $user{affiliation}; # affiliationが表示される => "PerlEntrance"

- 添字（key）から値（value）を連想できるため、配列を使うよりわかりやすいですね。

___
## ハッシュの基本
ハッシュには他にも利点があります。

以下のような配列があったとき、

    my @user = ('Name', 'Job', 'Affiliation');

もし突然、要素の順番が入れ替わってしまったらどうなるでしょう？

    my @user = ('Affiliation', 'Job', 'Name');

添字と値の関係が変わってしまうため、影響するコードを書き換えなくてはいけません。
しかしハッシュを使えば、値は添字の数値（順番）ではなく、名前（key）で対応づけられているので、そういった問題が起こりません。

___
## ハッシュを使ってみよう
では、ハッシュを作ってみましょう。

    my %hash = (
        name => 'Alice',
        age  => 16
    );

- ハッシュは % を使って定義します。
- `=>` はファットコンマ演算子と呼ばれ、コンマと同等の役割を果たします。
- `=>` の左にkey（名前）、右にvalue（値）を書くことで、関係性が明らかになります。
- keyは文字列として解釈されるので、クォートの必要はありません。
- 1つのハッシュ内に文字列や数値が混在しても構いません。

___
## ハッシュを使ってみよう
ハッシュの要素にアクセスし、取り出してみましょう。
ハッシュにアクセスするときは、添字として波括弧 `{}` を使います。
`{}`にkeyを入れることで、対応するvalue（値）を取り出せます。

    my %hash = (
        name => 'Alice',
        age  => 16,
    );
    print $hash{name}; #=> 'Alice'
    print $hash{age}; #=> 16

___
## ハッシュを使ってみよう
ハッシュに新たな要素を代入してみましょう。
取り出すときと同様に、`{key}` を使います。

    $hash{job} = 'Programmer'; # 新たな値'Programmer'を
                               # key'job'で代入

これで、ハッシュの中身は以下のようになりました。

    my %hash = (
        name => 'Alice',
        age  => 16,
        job  => 'Programmer',
    );

取り出してみましょう。

    print $hash{job}; #=> 'Programmer'

___
## ハッシュを使ってみよう

    my %hash = (
        name => 'Alice',
        age  => 16,
        job  => 'Programmer',
    );

- 質問: ハッシュの中身を全部一度に見たい場合はどうするの？
- 回答: `Data::Dumper`モジュールを使います。これについては後で解説します。

___
## ハッシュを使ってみよう
じつはハッシュは配列の一種なので、このように書くこともできます。

    my %hash = ('name', 'Alice', 'age', 16);
    print $hash{name}; #=> "Alice"
    print $hash{age};  #=> "16"

実際にこのように書くことは少ないですが、配列の一種であることは覚えておくとよいでしょう。

___
## 練習問題
- 次の処理をする `hash_profile.pl` を作りましょう。
    1. 自分の名前 (name)、年齢 (age)、好きな食べ物 (food) を key にしたハッシュ %my_profile を作ってください。
    2. key である `name`, `age`, `food` を使って、それぞれの value を出力してください。

---
## ハッシュの便利な関数たち
ハッシュを便利に扱うための関数について説明します。

- keys
- values
- delete
- exists

___
## keys

    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    my @keys = keys %hash;
    print "@keys\n";    #=> "name job affiliation"

keys関数は、ハッシュの key を配列にして返します。

- ただし、この時 key は順不同です。（※とても重要）
- つまり、ハッシュに書かれた順番で返ってくるとは限りません。
- よって、同じ順番で受け取りたい場合は、`sort`関数を使って並び替えましょう。

___
## values

    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    my @values = values %hash;
    print "@values\n"; #=> "Alice Programmer PerlEntrance"

values関数は、ハッシュの value を配列にして返します。

- value も順不同で返ります。

___
## delete

    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    delete $hash{affiliation};

    # この時、%hash は以下のようになっています
    # %hash = ( name => 'Alice', job => 'Programmer' );

delete関数は、指定したハッシュの key と、それに対応する value を削除します。

___
## exists

    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    if (exists $hash{job})  { print "exists" } #=> 'exists'
    if (exists $hash{team}) { print "exists" } # 何も出てこない

exists関数は、指定したハッシュの key が存在するか確認します。

___
## ハッシュの key 指定について
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    my $key = 'job';
    print $hash{$key}; #=> 'Programmer'

ハッシュの key は文字列が入ったスカラー変数でも指定可能です。

- {foo} であれば foo という文字列が key 名、{$foo} であればスカラー変数 `$foo` に代入された文字列が key 名となります。

___
## ハッシュの key 指定について
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance'
    );
    for my $key ( keys %hash ) {
        my $value = $hash{$key};
        print "$key => $value\n";
    }

keys関数と組み合わせると、keyとvalueのペアをfor文で一つずつ処理することができます。

___
## 練習問題

- 次の処理をする `hash_func.pl` を作りましょう。
    1. keys関数を使って、`hash_profile.pl` で作ったハッシュのkeyをすべて出力してください。
    2. delete関数を使って、1で使ったハッシュから年齢(age)の要素を削除してください。
    3. exists関数を使って、年齢の要素が存在するか確認してください。存在している場合は "Age is exist." 、存在しない場合は "Age is not exist." と表示するようにしてみましょう。
