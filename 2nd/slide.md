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
- if, else文
- 論理演算子
- 配列
- 配列の操作
- for文
- ハッシュ
- ハッシュの操作

---
# 前回の復習

___
## ターミナルからディレクトリ操作
```
    $ cd                    # ホームディレクトリに移動する
    $ pwd                   # 現在のパスを表示する
    $ ls -l                 # ファイル・フォルダの一覧を表示する
    $ mkdir perl-entrance   # perl-entrance というフォルダを作成する
    $ cd perl-entrance      # 作成した perl-entrance フォルダに移動する
    $ mkdir 2nd             # 2nd というフォルダを作成する
    $ cd 2nd                # 作成した 2nd というフォルダに移動する
```

> ｢ホームディレクトリ｣とは, ユーザごとに用意された作業場所のようなものです (第1回 第2部)

- `perl-entrance` ディレクトリがすでにある方は, 4行目の `mkdir perl-entrance` は省略してください

- 今日作成するスクリプトは, この `2nd` ディレクトリの中に入れていくと良いでしょう

___
## おまじない
```
    #!/usr/bin/env perl
    use strict;
    use warnings;
```
- `#!/usr/bin/env perl`
    - Perlの実行プログラムの場所を指定します
- `use strict`
    - 厳密な書式を定めたり, 未定義の変数を警告するといった効果があります
- `use warnings`
    - 望ましくない記述を警告してくれる効果があります

- 以下, この資料のサンプルコードでは｢おまじない｣を省略します

- **書かれているもの**として扱ってください

___
## Hello, World!(hello.pl)
    print "Hello, World!\n";

- このように書いたものを, `hello.pl`として保存します

- `print`は, 端末に文字を出力します

- `\n`は改行を表します

- 最後に`;`を忘れずに！

- ｢おまじない｣の3行も忘れないこと！
___
## Hello, World! の実行
```
    $ perl hello.pl
    Hello, World!
```
1. ターミナルを開きます

1. `perl` から1つスペースを空けて `hello.pl` と入力してenterキーを押します

    - perlやプログラムに渡される情報, 値などを引数と言います

    - この例では `hello.pl` が引数にあたります

1. プログラムの中に書いた `Hello, World` が表示されます


___
## 復習問題
- `Hello, Perl Entrance!` という文字列を出力する `hello_perl.pl` を書いて下さい

- わからない所があれば, 近くのサポーターに聞いて下さい！

___
## 復習問題 (calc.pl)
    1 + 2 = 3

    1 - 2 = -1

    1 * 2 = 2

    1 / 2 = 0.5

- 標準入力 `<STDIN>` から0以外の整数を2つ読み込み, それらを四則演算(`+`, `-`, `*`, `/`)した結果を上の例のように出力するスクリプト `calc.pl` を作成してください

- わからない所があれば, 近くのサポーターに聞いて下さい！

---
# if, else文

___
## 制御構文(if)
    my $foo = 1;
    if ( $foo == 1 ) {
        print "OK\n"; # 条件が｢真｣の場合
    } else {
        print "NG\n"; # 条件が｢偽｣の場合
    }

- `==` は"右辺と左辺が数値として等しければ真"であることを意味します
    - 真 = 条件が正しい / 偽 = 条件が正しくない
- ここでは`$foo`が`1`と等しい場合に真となり, `OK`という文字が表示されます
- `$foo`が`1`でなければ, 偽となるため`else`に処理が移り`NG`という文字が表示されます

___
## よくあるまちがい (1)
    my $foo == 1; # まちがい

    my $bar =  1; # せいかい

- 代入の`=`と, 数値の比較の`==`をよく間違えます
    - この場合, 実行すると`Use of uninitialized value $foo in numeric eq (==)`のようなエラーになります

___
## よくあるまちがい (2)
    my $foo = 1;
    if ($foo =  2) { ... } # まちがい
    if ($foo == 2) { ... } # せいかい

- 数値の比較の`==`と, 代入の`=`をよく間違えます
    - この場合, 実行すると`Found = in conditional, should be ==`のような警告が出ます

___
## 制御構文(if)
    my $foo = 1;
    if ( $foo == 1 ) {
      print "OK\n"; # 条件が｢真｣なので出力される
    }

- `else`の部分は省略することもできます
    - この状況で条件が「偽」の場合(`$foo`が`1`ではない場合), 何の処理も行われません

___
## 数値の比較演算子
    == # 右辺と左辺が等しいならば真
    != # 右辺と左辺が等しくないならば真
    <  # 右辺より左辺が小さいならば真
    >  # 右辺より左辺が大きいならば真
    <= # 右辺が左辺以上ならば真
    >= # 右辺が左辺以下ならば真

- 数字同士を比較するときは, このような比較演算子を使います

___
## 文字列の比較演算子
    eq  ==  equal
    ne  !=  not equal
    gt  >   greater than
    ge  >=  greater equal
    lt  <   less than
    le  <=  less equal

- 数値を比較する場合は`==`や`!=`を使いますが, 文字列を比較する場合は`eq`や`ne`といった演算子を使います
    - もっとも, `eq`, `ne`以外はあまり使いません
    - 「文字列の大小」とは, 辞書順に並べた時に前にくるものが小さく, 後ろにくるものが大きいという意味です

___
## 文字列比較
    my $foo = 'hello';
    if ( $foo eq 'hello' ) {
        print "OK\n";
    } else {
        print "NG\n";
    }

- 今回は文字列を比較しているので, `==`ではなく`eq`を用いています

___
## 数値の比較と文字列の比較
    if ('42strings' == 42) {
      print "OK\n";
    }

- `use warnings`が有効であれば, 文字列を数値用の比較演算子で比較しようとすると, 次のような警告を出力します
    - `Argument "42strings" isn't numeric in numeric eq (==)`
- このような場合, Perlは文字列を無理やり数値として解釈して処理を継続します
    - この場合, '42strings'には先頭に`42`という数値が含まれているので, Perlは`==`の演算子の左辺は`42`として処理を実行します
    - そのため, この比較は真となり, ｢OK｣という文字列が出力されます
- 一般の文字列を `==` で比較することはバグの元ですので, こういう比較をしないように気をつけましょう

___
## 数値の比較と文字列の比較

    if ('42' eq 42) {
      print "OK\n";
    }

- 逆に, 文字列の比較演算子で数値を比較しようとした場合, 警告は出力されません
    - Perlは自動的に数値を文字列として解釈して, `eq`演算子の右辺は`'42'`として扱われます
    - そのため, この比較は「真」となり, ｢OK｣という文字列が出力されます

___
## Perlにおける真偽値

- Perlには, `true`や`false`などで真偽値を表すことはできません
    - 他のプログラミング言語では, `true`や`false`という単語は特別な意味を持つキーワードとして扱われることが多いです
    - `true`は条件が真であることを意味するキーワード, `false`は条件が偽であることを意味するキーワードですが,
    - Perlでは, `true`や`false`にこのような特別な意味はありません
- そのかわりPerlでは, 次の5つの値が｢偽｣の値(偽値)として扱われます
    - 数値｢`0`｣
    - 文字列｢`'0'`｣と｢`''`｣
    - 空のリスト｢`()`｣
    - `undef`
- そしてこれ以外の値は, Perlでは全て「真」として扱われます
- 明示的な真値が必要な場合, 数値の `1` を使う場合が多いです

___
## 複数の制御構文
    my $foo = 1;
    if ( $foo == 1 ) {
        ...
    } elsif ( $foo == 2 ) {
        ...
    } elsif ( $foo == 3 ) {
        ...
    } else {
        ...
    }

- `elsif`を使うことで, 分岐条件をさらに増やすことができます
    - PerlにはC言語の`switch`にあたるものはないので, `if`, `elsif`, `else`で代用しましょう

___
## 練習問題(question\_word.pl)
    #!/usr/bin/env perl
    use strict;
    use warnings;
    my $answer = 'perl'; # 好きな文字を入力しておく

- 簡単な文字当てゲーム `question_word.pl`を作成しよう
- 端末から, 標準入力で文字列を一つ入力し, その文字列が`$answer`と一致したら`OK`, 外れたら`NG`と表示します

---
# 論理演算子

___
## 関係演算子
    && -> かつ
    || -> または

- `if文`で複雑な条件を扱いたいときは, `関係演算子`を用いて複数の条件を連結しましょう
    - `&&`演算子は｢かつ｣なので, 両方の条件が真となるときのみ真となります
    - `||`演算子は｢または｣なので, 条件のどちらか1つでも真となるならば真となります

___
## 関係演算子
    my $foo = 64;
    if ( $foo > 0 && $foo % 2 == 0 ) {
        print "&&: OK\n";
    }
    if ( $foo > 0 || $foo % 2 == 1 ) {
        print "||: OK\n";
    }

- 2行目は, ｢64は0より大きい(真)｣かつ｢64を2で割った余りは0(真)｣なので, 真となります
- 5行目は, ｢64は0より大きい(真)｣または｢64を2で割った余りは1(偽)｣なので, 真となります

___
## 3つ以上の値を比較したい場合
    my $small = 10;
    my $medium = 20;
    my $large = 30;

    if ( $small < $medium && $medium < $large ) {
       print "小さい順に並んでます\n";
    }

- `$small < $medium < $large` のように3つ以上の値を同時に比較することはできません
- `$small < $medium` かつ `$medium < $large` と同じ意味なので, 関係演算子を使って比較することができます

___
## 練習問題(question\_num.pl)
    #!/usr/bin/env perl
    use strict;
    use warnings;
    my $answer = 10; # 好きな値を入力しておく

- 簡単な数当てゲーム `question_num.pl`を作成しよう
- 端末から数字を一つ入力し, その数字が`$answer`と一致したら`OK`, `$answer`より大きければ`too big`, 小さければ`too small`と表示します
    - オプション: 入力した値が, `$answer`から-5〜+5の範囲内(例えば, `$answer`が10なら, 5〜15)の場合, `near`と表示するようにしてみましょう(時間に余裕があれば, チャレンジしてみてください!)

---
# for文, 配列

___
## 配列
    my @array = ( 1, "foo", 3 );
    print "@array\n"; #=> 1 foo 3

- 配列を使うことで, 数値や文字列をまとめて格納できます
- `=`演算子を使うことで, 左辺の配列に右辺の値を代入することができます
- 配列は変数名の前に`@`をつけます
    - `@`は`アレイ(array)`の`a`, と覚えるとよいでしょう
- 1行目の右側, `( ... )`の部分をリストと呼びます

___
## 配列

    my @array = ( 1, "foo", 3 );
    print "$array[0]\n"; #=> 1
    print "$array[1]\n"; #=> foo
    print "$array[2]\n"; #=> 3

- 配列の一つ一つの要素にアクセスする場合は`$変数名[添字]`を使います
    - 添字は1ではなく0からスタートして, 1ずつ増えます

___
## 配列
    my @array = ( 1, "foo", 3 );
    print "$array[0]\n"; #=> 1

- 配列に格納された, ある要素を取得する方法が`@変数名[添字]`ではなく`$変数名[添字]`となっているのは, ｢配列に格納された1つの要素｣がスカラ(1つ)のデータであるためです

___
## 配列
    my @array = ( 1, "foo", 3 );
    my $i = 1;
    print "$array[$i]\n"; #=> "foo"
- 配列の添字には, 数字が入ったスカラー変数を置くこともできます.

___
## 配列への代入
    my @array = ( 1, "foo", 3 );
    $array[0] = "bar"; #=> ( "bar", "foo", 3 )

- 配列に新たな要素を代入する際は, 取り出すときと同様に添字を使います

___
## 配列の計算
    my @array = ( 1, "foo", 3 );
    my $sum = $array[0] + $array[2];
    print "$sum\n" #=> 4

- 配列の要素は普通のスカラ変数と同じように扱えるので, このような計算もできます

___
## 配列の要素数
    my @array = ( 1, "foo", 3 );
    print scalar @array; #=> 3
    print $#array;       #=> 2

- 配列を`scalar`演算子に与えると, 配列に格納されている要素の個数を取得できます
- `@array`に対して`$#array`と書くことで, 配列に格納されている最後の要素の添字を取得できます

___
## 範囲演算子
    my @array1 = ( 1, 2 );
    my @array2 = ( 1 .. 5 );
    my @array3 = ( @array1, 3 ); #=> (1, 2, 3)

- `()`を使うことで, 配列にまとめて値を代入することができます
- 連続する数字であれば, 範囲演算子`..`を使って`1 .. 5`と書くことで, `1以上5以下`の値を配列に代入できます
    - ただし, 必ず右側の値が左側の値より大きくなければなりません. `@array2 = ( 5 .. 1 );`のように書くと`@array2`には空の要素が格納されるので注意しましょう
- 3行目のように, 数値や文字列だけでなく, 配列を代入することもできます

___
## for ループ
    my @array = ( 1, "foo", 3 );
    for my $foo ( @array ) {
      print "$foo\n";
    }

- 配列の中身を出力する方法として, `for`文があります
    - `foreach`と書いても問題ありません. 実はPerlの内部では, 同じように処理されます
- この場合, 変数`$foo`に`$array[0]`, `$array[1]` ... という値が順番に代入され, 処理が行われます

___
## 練習問題(for.pl)
1. 配列`@array`に好きな数値や文字列を設定し, for文で出力してください。
2. `<STDIN>`を用いて配列`@array2`に好きな数値や文字列を入力し, for文で出力してください。

    - 2つの入力値を得る場合, 配列の要素として `<STDIN>` を直接書くことはできません。1つずつスカラー変数で受け取り, `chomp` をした後で配列に入れましょう。
    - `my @array = (<STDIN>,<STDIN>)` と書かないでください

___
## forループとリスト

    for my $i (1,2,3){
        print "$i\n";
    }

- for文でループする場合，今までは`()`の中に要素をそのまま入れていました
- しかし，例えば**100回ループさせたい**という時に`(1,2,3,4,5,6....` と書いてしまうと労力がかかります

___
## forループと範囲演算子
    for my $i (1..50){
        print "$i\n";
    }

- 先程学習した範囲演算子`..`を利用することで便利にループ処理を記述することが可能です．

___
## 練習問題(even.pl)

- for文を使って1〜100までを出力してみましょう
- 次に1〜100までのうち偶数のみを出力するようにプログラムを変えてみましょう
    - ヒント: Perlでは計算の余りを求める`%`演算子があります
    - 例えば `5%3` は5/3の余りですので，2が求まります


___
## 練習問題(fizzbuzz.pl)
- `FizzBuzz`問題にチャレンジ!!
    - 1から100までの数字について, 以下のようなルールに従って表示を行う`fizzbuzz.pl`を作成しよう!
        - その数字が`3`で割り切れるなら`Fizz`
        - `5`で割り切れるなら`Buzz`
        - `3`でも`5`でも割り切れるなら`FizzBuzz`
        - `3`でも`5`でも割り切れないなら`その数字`

---
## qw ショートカット
    my @array = qw( Alice Bob Chris );
        #=> ('Alice', 'Bob', 'Chris')

- これまでのリストの書き方 `('this', 'is', 'list', 1, 2, 3)` と異なり, クォート記号が不要です。
- この記法では空白文字 (スペース, タブ, 改行など) が無視され, 残ったものがリストの要素になります。

___
## qw ショートカット
    my @arary = qw(
        Alice
        Bob
    );

- なので, こういう書き方もできます。

___
## qw ショートカット

    qw! Alice Bob !
    qw# Alice Bob #
    qw/ Alice Bob /

デリミタ (区切り文字) には任意の記号文字を使えます。
これらは前述の

    qw( Alice Bob )

と等しくなります。

___
## qw ショートカット
このような問題に遭遇したとき,

    qw/http://www.perl-entrance.org http://www.yahoo.com/
    # エラーになってしまう！
    # デリミタがスラッシュ (/) で
    # 要素にもスラッシュが含まれているため

解決法は2つ。

    # 1. 要素内のスラッシュをバックスラッシュでエスケープする
    #   => 読みにくく感じるかもしれない
    qw/ http:\/\/www.perl-entrance.org https:\/\/www.yahoo.com /
    # 2. デリミタを変える
    #   => ちょっと読みやすいかもしれない
    qw! http://www.perl-entrance.org https://www.yahoo.com !

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
