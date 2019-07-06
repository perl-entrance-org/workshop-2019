# Perl入学式 \#3 復習問題

- 解答例は`ansewr/`フォルダにサポーターごとに格納してあります。

- Perlのモットーは TMTOWTDI（やり方はいっぱいある）、同じ問題で同じ答えなのに様々な書き方ができます。


## ハッシュを使った問題

### food.pl
以下のように、 `$data` に人物名と好きな食べ物がハッシュで与えられています。
食べ物が何回出現したか表示してください。
```perl
my %data = (
    alice => 'sushi',
    bob   => 'soba',
    carol => 'sushi',
    dave  => 'sushi',
    ellen => 'soba',
    frank => 'udon',
);
```

余裕がある人は以下に挑戦してみてください。
Perl入学式では教えていない内容ですが、Perlの本やインターネットで検索しつつ解いてみてください。
- 食べ物の名前順にsortして表示する
- 食べ物の出現回数順にsortして表示する（難易度：高）


### tv_hash.pl
テレビ局の「リモコンキーID」をkeyに、テレビ局名をvalueにしたハッシュを作成して出力してください。
- 参考:[日本のテレビジョン放送局](https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E3%81%AE%E3%83%86%E3%83%AC%E3%83%93%E3%82%B8%E3%83%A7%E3%83%B3%E6%94%BE%E9%80%81%E5%B1%80)


### merge_saitama.pl
まず、下記のハッシュを作成します。

```perl
`%saitama_cities = (urawa => 486538, omiya => 457298, yono  => 83620 );`
```

以下の操作を順番に行ってください。

1. スカラー変数 `$saitama_population` に `urawa`, `omiya`, `yono` の値の合計を格納する

1. ハッシュ `%saitama_cities` に key 'saitama' と, それに対応する value として `$saitama_population` を追加する

1. ハッシュ `%saitama_cities` から key `urawa`, `omiya`, `yono` を削除する

1. key `urawa`, `omiya`, `yono` が削除されているか `exists` を使って確認する

1. ハッシュ `%saitama_cities` に格納されている `key` と `valuse`を出力する

- 参考:[さいたま市](https://ja.wikipedia.org/wiki/%E3%81%95%E3%81%84%E3%81%9F%E3%81%BE%E5%B8%82)



## 正規表現を使った問題

### 準備中



