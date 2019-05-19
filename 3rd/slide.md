# Perl入学式 第3回
___
### 配列操作/ハッシュ/リファレンス編

___
## 諸注意
- 会場について
- 写真撮影について

___
## 紹介
- 講師・サポーター紹介
- 自己紹介

___
## 今日の流れ
- 前回の復習
- ハッシュ
- ハッシュの操作（ keys, delete, exsts ）




---
# ハッシュ

___
## ハッシュとは

ハッシュはPerlのデータ構造の1つで, **連想配列** とも呼ばれます

配列と同じく, 要素の格納・取り出しができます

ただし, 要素は **名前** と **値** のペアで格納されます

> 配列の一つ一つの要素にアクセスする場合は $変数名[添字] を使います
> <div style="text-align: right;">第2回 配列要素の添字</div>

ハッシュは添字ではなく、 **名前** でデータにアクセスします

要素を指定するための名前を **key** と呼び, key によって指定される値を **value** と呼びます

___
## ハッシュを作ってみよう
```perl
    my %hash = (
        name => 'Alice',
        age  => 16,
    );
```

ハッシュは `%` を使って定義します

`=>` はファットコンマ演算子と呼ばれ, コンマと同等の役割を果たします

左にkey（名前）, `=>` , 右にvalue（値）と順番に書くことで, 関係性が明確になります

keyは文字列として解釈されるので, クォートの必要はありません

1つのハッシュ内に文字列や数値が混在しても構いません

最後の要素に `,` があってもなくても構いませんが, 追加や変更の可能性をふまえて付けることをお勧めします.

___
## ハッシュを使ってみよう
ハッシュの要素にアクセスし, 取り出してみましょう

ハッシュにアクセスするときは, 添字の指定は波括弧 `{ }` を使います

`{ }`にkey（名前）を入れることで、対応するvalue（値）を取り出せます
```perl
    my %hash = (
        name => 'Alice',
        age  => 16,
    );
    print "$hash{name}\n";    # Alice
    print "$hash{age}\n";     # 16
```

___
## ハッシュを使ってみよう
ハッシュに新たな要素を代入してみましょう。
取り出すときと同様に、`{key}` を使います。
```perl
    my %hash = (
        name => 'Alice',
        age  => 16,
    );
    $hash{job} = 'Programmer';    # key 'job', value 'Programmer'を追加
    print "$hash{job}\n";         # Programmer
```

これで、ハッシュの中身は以下のようになりました。
```perl
        name => 'Alice',
        age  => 16,
        job  => 'Programmer',
```

既に存在する `key` の値を代入すると, 上書きされます

___
## ハッシュの基本
ハッシュには他にも利点があります。

以下のような配列があったとき、
```perl
    my @user = ( 'Name', 'Job', 'Affiliation' );
    print "$user[1]\n"    # Job
```

もし突然、要素の順番が入れ替わってしまったらどうなるでしょう？
```perl
    my @user = ( 'Affiliation', 'Name', 'Job' );
    print "$user[1]\n"    # Name
```

同じ添字 `[1]` でも、添字と値の関係が変わってしまうため、影響するコードを書き換える必要がでてきます

___
## ハッシュの基本
しかしハッシュであれば, 値は添字の数値（順番）ではなく, 名前（key）で対応づけられているので, 順番の変更に影響を受けません。
```perl
    my %user = (
        affiliation => 'PerlEntrance',
        job         => 'Programmer',
        name        => 'Alice',
    );

    print "$user{name}\n";       # nameが表示される => "Alice"
    print "$user{job}\n";        # jobが表示される => "Programmer"
    print "$user{affiliation}\n";# affiliationが表示される => "PerlEntrance"
```

___
## ハッシュの中身を見たい！
```perl
    my %hash = (
        name => 'Alice',
        age  => 16,
        job  => 'Programmer',
    );

    print "%hash\n";   # %hash 変数名がそのまま表示される
```

- 質問: ハッシュの中身を全部一度に見たい場合はどうするの？変数展開できない！

- 回答: `Data::Dumper` モジュールを使います。これについては第4回で解説します。

___
## 練習問題
次の処理をする `hash_profile.pl` を作りましょう。

1. 自分の名前 (`name`), 年齢 (`age`), 好きな食べ物 (`food`) を key にしたハッシュ `%my_profile` を作ってください

1. key である `name`, `age`, `food` を使って、それぞれの value を出力してください

---
# ハッシュの操作

___
## ハッシュの操作 keys, delete, exists
ハッシュを便利に扱うための関数について説明します。

- keys

- delete

- exists

___
## keys
```perl
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance',
    );
    my @keys = keys %hash;
    print "@keys\n";    # name job affiliation （順不同）
```

`keys` 関数は、ハッシュの key を配列にして返します

ただし、この時 key は **順不同** で返ってきます. ハッシュに書かれた順番で返ってくるとは限りません

同じ順番で受け取りたい場合は, `sort` 関数を使って並び替えましょう

値のみをを順不同で受け取る `values` 関数もありますが, ここでは説明しません

___
## delete
```perl
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance',
    );
    delete $hash{affiliation};

    print "$hash{affiliation}\n"    # 「おまじない」記載時エラーになる
```

`delete` 関数は、指定したハッシュの key と、それに対応する value を削除します

___
## exists
```perl
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance',
    );
    if ( exists $hash{job} )  { print "exists\n" }    # exists
    if ( exists $hash{team} ) { print "exists\n" }    # 何も出てこない
```

`exists` 関数は, 指定したハッシュの key が存在するか確認します

存在すれば `1` を返し, 存在しなければ `'　'`(空文字)を返します

___
## ハッシュの key 指定について
```perl
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance',
    );
    my $key = 'job';
    print $hash{$key};    # Programmer
```

ハッシュの key は文字列が入ったスカラー変数でも指定可能です。

- `{foo}` であれば foo という文字列が key 名

- `{$foo}` であればスカラー変数 `$foo` に代入された文字列が key 名となります。

___
## ハッシュの key 指定について
```perl
    my %hash = (
        name        => 'Alice',
        job         => 'Programmer',
        affiliation => 'PerlEntrance',
    );

    for my $key ( keys %hash ) {
        my $value = $hash{$key};
        print "$key => $value\n";
    }
```

`keys` 関数と組み合わせると、keyとvalueのペアをfor文で一つずつ処理することができます。

___
## 練習問題
次の処理をする `hash_func.pl` を作りましょう。

1. `keys` 関数を使って, `hash_profile.pl` で作ったハッシュのkeyをすべて出力してください

1. `delete` 関数を使って, 1で使ったハッシュから年齢( `age` )の要素を削除してください

1. `exists` 関数を使って、`name`, `age`, `food` の各要素が存在するか確認してください.
   存在している場合は `name is exist.`, 存在しない場合は `name is not exist.` と表示してください
