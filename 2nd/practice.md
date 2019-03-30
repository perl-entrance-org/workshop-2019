# Perl入学式 #2 復習問題

- 解答例は`ansewr/`フォルダにサポーターごとに格納してあります
- Perlのモットーは TMTOWTDI（やり方はいっぱいある）, 同じ問題で同じ答えなのに様々な書き方ができます
- 第2回の復習問題以降は「使える知識」より以下を省略します
    - print文
    - スカラー変数
    - 標準入力
    - 四則演算


## if文

1. even_or_odd.pl

    - 標準入力により数値を1つ読み込み, その数値が偶数なら"even", 奇数なら"odd" という文字を出力する `even_or_odd.pl` を作成しよう

    - 使える知識
        - if, else文
        - 比較演算子( <, >, ==, != )


1. lexical_order.pl

    - 標準入力を2回利用して文字列を2つ読み込み, 2つの文字列を辞書に登場する順に出力する `lexical_order.pl` を作成しよう

    - 同じ文字列の場合には "equal" と表示すること

    - 使える知識
        - if, else文
        - 比較演算子(eq, ne, gt, lt)


1. logical_operators.pl

    - 標準入力により数値を1つ読み込み, その数字が「2でも3でも割り切れる」なら"Multiple of six"という文字列を出力する `logical_operators.pl` を作成しよう

    - 使える知識
        - if, else文
        - 論理演算子( &&, || )


## 配列

1. continuity_number.pl

    - 標準入力により0以上の数値を1つ読み込み, 0から入力した数値までの連続した数の配列を作成し、表示してみよう

    - 使える知識
        - 配列
        - 範囲演算子


1. factorial.pl

    - 標準入力により数値を1つ読み込み, その数値を[階乗](https://ja.wikipedia.org/wiki/%E9%9A%8E%E4%B9%97)した値を出力する`factorial.pl`を作成しよう

        - 例: 入力した数値が6 -> 6の階乗は `6 * 5 * 4 * 3 * 2 * 1 = 720` なので, ｢720｣を出力する

    - 使える知識
        - 配列
        - 繰り返し（ for文 ）


1. split_join.pl

    - `Swiss-Army chainsaw`という文字列を `join` と `split` を用いて `Swiss Army chainsaw`という3つの単語に分けましょう

    - 使える知識
        - 配列
        - 配列の操作( join, split, push, pop, shift, unshift, reverse, sort )


1. unshift_pop.pl

    - 以下の配列を用意します

    `my @array = (5 .. 10);`

    - この配列の中身が `( 0, 1, 2, 3, 4 )`　となるよう, `unshift` と `pop`で調整して出力しましょう

    - 使える知識
        - 配列
        - 配列の操作( join, split, push, pop, shift, unshift, reverse, sort )


1. shift_push.pl

    - 以下の配列を用意します

    `my @array = (5 .. 10);`

    - この配列の中身が `( 0, 1, 2, 3, 4 )`　となるよう, `shift` と `push`で調整して出力しましょう

    - 使える知識
        - 配列
        - 配列の操作( join, split, push, pop, shift, unshift, reverse, sort )


1. lexical_sort.pl

    - 標準入力を3回利用して文字列を3つ読み込み, 3つの文字列を辞書に登場する順に出力する`lexical_order.pl`を作成しよう

    - 使える知識
        - 配列
        - 繰り返し（ for文 ）
        - 配列の操作( join, split, push, pop, shift, unshift, reverse, sort )


## ハッシュ

1. tv_hash.pl

    - テレビ局の「リモコンキーID」をkeyに、テレビ局名をvalueにしたハッシュを作成し, 出力しよう
    - 参考:[日本のテレビジョン放送局](https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E3%81%AE%E3%83%86%E3%83%AC%E3%83%93%E3%82%B8%E3%83%A7%E3%83%B3%E6%94%BE%E9%80%81%E5%B1%80)

    - 使える知識
        - ハッシュ
        - ハッシュの操作（ keys, delete, exists ）

1. merge_saitama.pl

    - 下記のハッシュを作成する

        `%saitama_cities = (urawa => '486538', omiya => '457298', yono  => '83620');`

    - 以下の操作を順番に行う

        1. スカラー変数 `$saitama_poplation` に `urawa`, `omiya`, `yono` の値の合計を格納する

        1. ハッシュ `%saitama_cities` に key 'saitama' と, それに対応する value として `$saitama_poplation` を追加する

        1. ハッシュ `%saitama_cities` から key `urawa`, `omiya`, `yono` を削除する

        1. key `urawa`, `omiya`, `yono` が削除されているか `exists` を使って確認する

        1. ハッシュ `%saitama_cities` に格納されている `key` と `valuse`を出力する

    - 参考:[さいたま市](https://ja.wikipedia.org/wiki/%E3%81%95%E3%81%84%E3%81%9F%E3%81%BE%E5%B8%82)

    - 使える知識
        - ハッシュ
        - ハッシュの操作（ keys, delete, exists ）
