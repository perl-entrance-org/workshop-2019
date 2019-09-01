# Perl入学式
### 第5回 サブルーチン / Webアプリ編

___
## 諸注意
- 会場について
    - 飲食・喫煙・トイレetc

- 写真撮影について
    - 写真撮影NGな方は、お手数ですが申し出てください

    - 写真はPerl普及団体の [JPA ( Japan Perl Association )](https://japan.perlassociation.org/)への活動報告に利用します

___
## 講師紹介リファレンス

- 講師・サポーター紹介

___
## 皆さんで自己紹介
- せっかく今日集まったので、テーブルで自己紹介をしましょう。

- 話題は自由ですが、以下がオススメです。

    - 名前(ハンドルネーム)

    - なぜPerlを勉強してみようと思ったか

    - なぜPerl入学式に参加してみようと思ったか

    - 前回参加してからの学習の進捗

___
## 今日の流れ
- サブルーチン

- Webアプリ、その前に
- HTTP の基礎

- Mojolicious の準備
- Mojolicious とは
- Mojolicious::Lite
- Mojolicious 入門
- 簡易 BBS の作成

---
# サブルーチン

___
## サブルーチン
### サブルーチンとは?
プログラムの中で、意味や内容がまとまっている作業をひとかたまりにしたものを **サブルーチン** と呼びます。

Perlにおけるサブルーチンは、｢関数｣とほぼ同義です。

___
## サブルーチン
### サブルーチンと組み込み関数
Perlには、これまで使ってきた `print` や `join` など、Perlが提供する関数(組み込み関数)が用意されています。

サブルーチンを使うことで、 `print` や `join` のように、｢特定の処理を行うコード｣をひとかたまりにして、 簡単に呼ぶことが出来るようになります。

___
## サブルーチン
### サブルーチンの定義
それでは、早速サブルーチンを定義していきましょう。

今回は、末尾に自動的に改行(`\n`)を付与しながら文字列を表示する `say` というサブルーチンを定義してみます。

___
## サブルーチン
### サブルーチンの定義
```perl
sub say {               # -┐
    my $str = shift @_; #  │ サブルーチン say を
    print "$str\n";     #  │ 定義しているところ
}                       # -┘
say("hello, world!"); # hello, world!
```

Perlでサブルーチンを定義する為には、`sub サブルーチン名 { ... }` と書きます。

それでは、詳しく見て行きましょう。

___
## サブルーチン
### サブルーチンの命名規則
```perl
sub say { ... }
```

- 末尾の `}` の後に、 `;` を書く必要はありません。

- サブルーチン名として使える文字は以下です。
  - 大文字・小文字の英数字
  - アンダースコア(`_`)

- ただし、サブルーチン名の先頭文字には以下の制限があります。
  - 英文字
  - `_`

これは変数名と同じルールです。

___
## サブルーチン
### Perlにおけるサブルーチンの命名規則
```perl
sub say_hello_world { ... }

sub say_good_morning { ... }
```

複数の単語でサブルーチン名を構築する時は、このように単語間を `_` で繋げる場合が多いです。

このような `_` で単語をつなげる記法をスネークケース（snake_case）といいます。

Perlでは基本的にスネークケースを推奨しています。

___
## サブルーチン
### サブルーチン命名規則クイズ
```perl
sub hoge!    { ... }

sub _hoge    { ... }

sub 123_hoge    { ... }

sub hoge_123 { ... }
```

この中で、サブルーチン名として正しいものはどれでしょうか？

___
## サブルーチン
### サブルーチン命名規則クイズの正解
```perl
sub hoge!    { ... }    # 記号 '!' はサブルーチン名に使えない

sub _hoge    { ... }

sub 123_hoge    { ... } # 先頭は 英字 or '_' のみ
                        # 数字は先頭に使えない
sub hoge_123 { ... }
```

正解は `_hoge` と `hoge_123` です。

___
## サブルーチン
### サブルーチンの呼び出し
```perl
say('Hello Perl');
```

定義したサブルーチンは、定義したサブルーチン名の後ろに `()` を付けることで利用できます。

行末に書く場合には、 ` ; ` が必要です。

このようにサブルーチンを利用することを「**サブルーチンの呼び出し**」といいます。

サブルーチンに値(引数)を渡したい場合、 `()` の中に書きます。

`()` を使わずに, サブルーチン名の先頭に `&` を付けて `&say` で呼びだすこともできますが、古い書き方なので使わないようにしましょう。

___
## サブルーチン
### サブルーチンの引数
```perl
sub say {
    my $str = shift @_; # ←┐
    print "$str\n";     #  │ サブルーチンの引数 'Hello Perl' は
}                       #  │ @_ という配列に格納される
                        #  │
say('Hello Perl');      # ─┘
```

サブルーチンに与えられた引数は、 `@_` という配列に格納されます。

2行目では、`shift` を使って、この　`@_` の先頭の要素を取得しています。

このサブルーチンを `say('hoge');` のように呼んだ場合、 `@_` の中身は`('hoge')` となり、 `$str` には `hoge` という文字列が入ります。

___
## サブルーチン
### サブルーチンの引数
```perl
sub say {
    my $str = shift;  # @_ が省略されている
    print "$str\n";
}

say('Hello Perl');    # Hello Perl
```

`@_` は、省略することができます。

その為、2行目の `my $str = shift;` は、 `my $str = shift @_;` と同じ意味になります。

___
## サブルーチン
### サブルーチンの位置
```perl
say('Hello Perl');  # Hello Perl

sub say {
    my $str = shift;
    print "$str\n";
}
```

同じファイル内であれば、サブルーチンの位置にかかわらず `say('hoge');` として呼び出すことができます。

ファイル末尾にサブルーチンがまとまっている方が見やすい場合は、このスタイルで書きましょう。

___
## サブルーチン
### サブルーチン｢add｣を作る
```perl
sub add {                     # ┐
    my ($left, $right) = @_;  # │サブルーチン add の定義部
    return $left + $right;    # │
}                             # ┘

my $result = add(2, 5);       # サブルーチン add の呼び出し
print $result . "\n";   # 7
```

次に、2つの引数を受け取り、その和を返すサブルーチン `add` を考えてみることにします。

`add` サブルーチンの定義と呼び出しは、このように書くことができます。

___
## サブルーチン
### サブルーチンに複数の引数を渡す
```perl
sub add {
    my ($left, $right) = @_;  # @_ の中に 2, 5が入る
    return $left + $right;    # ↑
}                             # │
                              # │
my $result = add(2, 5);       # ┘ add の引数 2, 5
print $result . "\n";   # 7
```

サブルーチンに複数の引数が与えられた場合(この場合は `2` と `5` )、サブルーチン側ではこのようにして受け取ることができます。

サブルーチンに複数の引数を与える時は、` ( ) ` の中で配列のようにカンマ　`,` で区切って渡します。

___
## サブルーチン
### サブルーチン側の引数の受け取り方
```perl
sub add {
                        # @_ を省略した場合
    my $left  = shift;  # @_ の先頭から1つ取り出して変数に入れている
    my $right = shift;  # @_ の先頭から1つ取り出して変数に入れている
    return $left + $right;
}
my $result = add(2, 5);
```
```perl
sub add {
    my $left  = $_[0];  # $_[0] : @_ の最初の要素
    my $right = $_[1];  # $_[1] : @_ の次の要素
    return $left + $right;
}
my $result = add(2, 5);
```

先程の引数の受け取り方は、上記のコードと同じ意味になります。

___
## サブルーチン
### 返り値とreturn
```perl
sub add {
    my ($left, $right) = @_;
    return $left + $right;  # $left + $right の結果を返す
}
my $result = add(2, 5);
print $result . "\n";   # 7
```

サブルーチンは, `return` を使うことで、任意のデータを呼び出し元へ返すことができます。

サブルーチンや関数の処理結果のことを **<ruby>返り値<rt>かえりち</rt></ruby>** といいます。

この場合、 `$left + $right` の計算結果が呼び出し元へ返され、 `$result` に格納されます。

___
## サブルーチン
### 複数のreturn
```perl
sub is_same {
    my ( $left, $right ) = @_;
    if ( $left eq $right ) {
        print "true\n";    # $left と $right が等しければ表示
        return 1;
    }
    else {
        print "false\n";    # $left と $right が異なれば表示
        return 0;
    }
    print "YOU WILL NEVER SEE IT\n"; # 絶対に表示されない!
    return;
}
```

`return`はサブルーチンの中に複数個書くことができます。

`return`に到達した場合、それ以降の処理は一切行われず、すぐさま値を返してサブルーチンの実行を終了します。（ガード節といいます）

___
## サブルーチン
### 複数の返り値
```perl
sub add_and_min {
    my ( $left, $right ) = @_;
    return ( $left + $right, $left - $right );
}
my ( $add, $min ) = add_and_min( 5, 4 );
```

サブルーチンは、このようにリストを返すことで複数個の値を返すこともできます。

引数がどのようにサブルーチンに渡されて処理されるか、追ってみましょう。

___
## サブルーチン
## returnがない場合の返り値
```perl
sub add {
    my ($left, $right) = @_;
    $left + $right;         # サブルーチンの中で最後に評価された行
}

my $result = add(2, 5);
print $result . "\n";   # 7
```

サブルーチンの中に `return` がない場合、サブルーチンの返り値は最後に評価された処理の結果(この場合、 `$left + $right`の計算結果)を返します。

値を返すという意図を明確にするため、 `return` は書くようにしましょう。

___
## 練習問題
次のようなサブルーチンを持つコードを `simple_calc.pl` という名前で作成しよう。

- 2つの引数の和（足し算）を計算する `add`
- 2つの引数の差（引き算）を計算する `min`
- 2つの引数の積（掛け算）を計算する `mul`
- 2つの引数の商（割り算）を計算する `div`

これらのサブルーチンが正しく実装できているか(与えた2つの引数に対して, 適切な値を返すか)を確認するコードも一緒に書くこと。

- 時間の余った人は「0」で割った際のエラーを回避する仕組みを入れてみよう

- さらに時間の余った人は数字以外が入力された場合に 'INPUT NUMBER PLEASE'と表示する仕組みを入れてみよう

---
## Webアプリ、その前に

___
## Webアプリ、その前に
### アプリとは？
<blockquote>
    ワープロや表計算などといった、コンピュータを「応用」する目的に応じた、コンピュータ・プログラムである。
    <div style="text-align: right;">wikipedia([アプリケーションソフトウェア](https://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3%E3%82%BD%E3%83%95%E3%83%88%E3%82%A6%E3%82%A7%E3%82%A2))</div>
</blockquote>

___
## Webアプリ、その前に
### Webアプリとは？
<blockquote>
    **インターネット（もしくはイントラネット）などのネットワークを介して使用するアプリケーションソフトウェアである。**<br><br>
    多くの場合、これらのアプリケーションは、Webブラウザ上で動作するプログラミング言語（たとえばJavaScript）によるプログラムと<br><br>
    <strong>Webサーバ側のプログラム</strong><br><br>
    が協調することによって動作し、ユーザはそれをWebブラウザ上で使用する。
    <div style="text-align: right;">wikipedia([ウェブアプリケーション](https://ja.wikipedia.org/wiki/%E3%82%A6%E3%82%A7%E3%83%96%E3%82%A2%E3%83%97%E3%83%AA%E3%82%B1%E3%83%BC%E3%82%B7%E3%83%A7%E3%83%B3))</div>
</blockquote>

___
## Webアプリ、その前に
### Webアプリとは？

この **Webサーバ側のプログラム（スクリプト）** を今回の講義で作成していきます。

___
## Webアプリ、その前に
### これまでのスクリプトの動き

1. スクリプトを作る
1. ターミナルで実行し、入力待ち状態になる
1. **ターミナルの標準入力から入力する**
1. 入力された内容を、スクリプトが処理する
1. **ターミナルの標準出力に、結果が表示される**

___
## Webアプリ、その前に
### これまでのスクリプトの動き（イラスト）
![これまでのスクリプトの動き](https://raw.githubusercontent.com/perl-entrance-org/workshop-2019/master/5th/image/perl_entrance_2019_5th_01.png "サンプル")

___
## Webアプリ、その前に
### 今回作成するWebアプリの動き
1. スクリプトを作る
1. ターミナルで実行し
1. Webブラウザに画面が表示される
1. **Webブラウザの入力フォームに入力する**
1. 入力された内容を、サーバーでスクリプトが処理する
1. **Webブラウザに、結果が表示される**

___
## Webアプリ、その前に
### 今回作成するWebアプリの動き（イラスト）
![これまでのスクリプトの動き](https://raw.githubusercontent.com/perl-entrance-org/workshop-2019/master/5th/image/perl_entrance_2019_5th_02.png "サンプル")


---
# <ruby>Mojolicious<rt>モジョリシャス</rt></ruby><br>の準備

___
## Mojolicious の準備
### モジュールのインストール
プログラムにおいて、必要とされる機能を第三者にも扱えるようにまとめたものを、**モジュール（ライブラリ）**といいます。

第4回目で`Data::Dumper` モジュールを使いましたが、それは Perl に最初から入っている**組み込みモジュール**でした。

これから学習していく Mojolicious は**外部から追加しなくてはならないモジュール**です。

モジュールのインストール方法は様々な方法がありますが、この講義では local::lib と cpanm を使って入れることにします。

___
## Mojolicious の準備
###  local::lib
<ruby>local::lib<rt>ローカル リブ</rt></ruby>は、モジュールを自分のホームディレクトリで管理することができるモジュールです。

local::lib を使うことで、システム全体への影響を抑えることができます。

___
## Mojolicious の準備
### cpanm (cpan minus)
Perlのモジュールの多くは<ruby>[MetaCPAN](https://metacpan.org/)<rt>メタ シーパン</rt></ruby>で公開されています。

このサイトや、GitHubからターミナルでモジュールをインストールすることができるモジュールが <ruby>cpanm<rt>シーパンエム</rt></ruby> です。

cpanm は通常、 perl が入っているディレクトリにモジュールをインストールしますが、 `-l` オプションで指定することで、任意のディレクトリにインストールすることが可能です。

この講義では、自分のホームディレクトリ配下にモジュールをインストールします。

___
## Mojolicious の準備
### Mojolicious のインストール
ターミナルで以下のコマンドを一つずつ打っていきます。
先頭の `$` はターミナルで一般権限ユーザの時に表示されるもので、入力は不要です。

```bash
$ curl -L cpanmin.us -o cpanm
$ chmod +x cpanm
$ ./cpanm -l ~/extlib local::lib
$ perl -I ~/extlib/lib/perl5 -Mlocal::lib=~/extlib | tee -a ~/.bash_profile
$ exec $SHELL -l
$ ./cpanm Mojolicious
```

インストールに躓いたり, エラーが出た時はサポーターを呼んだり、[Slack](https://perl-entrance.slack.com/messages/general/)でエラーメッセージを貼り付けて聞いてみてください。

- [Slack参加フォーム](https://docs.google.com/forms/d/e/1FAIpQLScbWyg-cgcqilW7-BpKagRm2ldBhvwRBNr2N5eg3LHOK13FGw/viewform)

___
## Mojolicious の準備
### Mojolicious のインストール
先ほど入力したものの詳細はこちらです。
```
# curlコマンドでcpanminusプログラムをダウンロードし、cpanmという名前で保存する
$ curl -L cpanmin.us -o cpanm

# cpanmに実行権限をつける
$ chmod +x cpanm

# cpanmの -l(エル)オプションで、指定したディレクトリ(extlib)に指定したモジュール(local::lib)を
インストールする
$ ./cpanm -l ~/extlib local::lib

# perlのモジュール検索パスを追加し(~/extlib/lib/perl5)、extlibにパスを通すための設定を表示
# それをteeコマンドを利用して起動時のシェル設定ファイルにも書き込む
$ perl -I ~/extlib/lib/perl5 -Mlocal::lib=~/extlib | tee -a ~/.bash_profile

# シェルを再起動する
$ exec $SHELL -l

# MSYSのみ実行。Windowsでシンボリックリンクを利用することをMSYSに伝える
$ export MSYS=winsymlinks

# -n テストなしでMojoliciousをインストールする。
# 基本的には -n をつけずにインストールを行うが、時間の都合上、Perl入学式ではテストなしでインストールします。
$ ./cpanm -n Mojolicious
```

___
## Mojolicious の準備
### インストールに成否チェック
以下のコマンドをターミナルから実行し、 Mojolicious のバージョン番号が出力されればインストール成功です。

```
$ perl -MMojolicious -e 'print "$Mojolicious::VERSION\n"'
```

___
## Mojolicious の準備
### モジュールで広がる世界
cpanm を利用することで、 Mojolicious の他にも数多くのモジュールを利用することができます。
気になったモジュールがあれば

```
$ ./cpanm モジュール名
```

でインストールして使ってみましょう！

モジュールの検索は[metacpan](https://metacpan.org/)や[GitHub](https://github.co.jp/)を利用します。

「やりたいこと Perl」 でGoogle検索するのもおすすめです。

___
## Mojolicious の準備
### モジュールで広がる世界
Perlの有用なモジュールは数多くあるので、全ては紹介できません。ごくごく一部を紹介します。

- [`Archive::Zip`](https://metacpan.org/pod/Archive::Zip)
- [`Furl`](https://metacpan.org/pod/Furl)
- [`WWW::Mechanieze`](https://metacpan.org/pod/WWW::Mechanize)
- [`Web::Query`](https://metacpan.org/pod/Web::Query)
- [`DBI`](https://metacpan.org/pod/DBI)
- [`ojo`](https://metacpan.org/pod/ojo)

___
## Mojolicious の準備
### モジュールで広がる世界
また、「・・・有用？」というようなモジュールもあります。これらは<ruby>Acme<rt>アクメ</rt></ruby>モジュールと言われるジョークモジュール群です。

- [`Acme::FizzBuzz`](https://metacpan.org/release/Acme-FizzBuzz)
- [`Acme::MadokaMagica`](https://metacpan.org/pod/Acme::MadokaMagica)
- [`Acme::Nyaa`](https://metacpan.org/pod/Acme::Nyaa)
- [`Acme::SuddenlyDeath`](https://metacpan.org/pod/Acme::SuddenlyDeath)

このように、Perlのモジュールの世界は懐が広いのが特徴です。ぜひ下記の参考リンクも見てみてください。

- [第19回　Acmeで広がるPerlの世界―CPANは愉快なジョークモジュールの宝庫（1）](http://gihyo.jp/dev/serial/01/perl-hackers-hub/001901)
- [ACME大全 2019年版](https://booth.pm/ja/items/1499431)

---
# Mojoliciousとは

___
## Mojoliciousとは
### WAF
**Web アプリケーションフレームワーク（<ruby>WAF<rt>ワフ</rt></ruby>）** とは、Webサービスを作る際の必須機能や定型の処理を、まとめて提供する仕組みのことです。

<blockquote>
  framework 「枠組み」「骨組み」「構造」などと和訳できる英単語
  <div style="text-align: right;">wikipedia([フレームワーク](https://ja.wikipedia.org/wiki/%E9%9B%BB%E5%AD%90%E6%8E%B2%E7%A4%BA%E6%9D%BF))</div>
</blockquote>

___
## Mojoliciousとは
### 様々なWAF
Mojolicious は Perl の軽量WAF の１つです。

類似の軽量WAF
- Amon2 (Perl)
- Sinatra (Ruby)
- Flask (Python)
- Express (Node.js)

似ていない（重量級の）WAF
- Catalyst (Perl)
- Ruby on Rails (Ruby)

___
## Mojoliciousとは
### MVCモデル
WAFでは、機能のまとまりごとに処理を分けて開発を行っていきます。機能の分け方には様々なやり方があり、手法も数多くありますが、ここでは **MVCモデル** を紹介します。

  - M: Model
    - Viewから受け取ったデータの処理や、Viewに提供するデータの用意を行う
  - V: View
    - 見栄え、データの表示や入力受付、装飾などを行う
  - C: Controller
    - アドレス（URL）ごとに、どのModelやViewを割り当てるかの交通整理役

___
## Mojoliciousとは
### MVCモデル（イラスト）
![MVCモデル](https://raw.githubusercontent.com/perl-entrance-org/workshop-2019/master/5th/image/perl_entrance_2019_5th_03.png "MVCモデル")

___
## Mojoliciousとは
### MojoliciousでのMVCモデル
Mojoliciousは**MVCモデル**のうち、Modelを除いた「View」と「Controller」の機能を持っています。

では、 Model はどうするのか？

___
## Mojoliciousとは
### MVCモデル（イラスト）
![MojoliciousではModelを作りこむ必要がある](https://raw.githubusercontent.com/perl-entrance-org/workshop-2019/master/5th/image/perl_entrance_2019_5th_04.png "MojoliciousではModelを作りこむ必要がある")


---
# Mojolicious::Lite

___
## Mojolicious::Lite
### 最初に
この入門では、難しい表現を避けるために、厳密には正しくない事も書いてあります。

また、講義時間内に収めるために、ごくごく一部のコマンドや機能についてのみ説明しています。

沢山の引数やコマンド、記法については、本家サイトなどのリファレンスをご覧ください。

- 本家
    - [Mojolicious - Perl real-time web framework](https://mojolicious.org/)

- 日本語訳
    - [Mojoliciousドキュメント 日本語訳](https://github.com/yuki-kimoto/mojolicious-guides-japanese/wiki)

___
## Mojolicious::Lite
### ひな形を作る
Mojoliciousをインストールすると、`mojo` というコマンドが使えるようになります。ターミナルで以下のコマンドを入力してください。

```bash
$ mojo generate lite_app hello_mojo.pl
```
- `mojo generate lite_app`
    - `Mojolicious::Lite` を利用した小規模アプリ用のひな形を作成するコマンド。
- `hello_mojo.pl`
    - 引数。作成するファイル名。

現在のディレクトリに `hello_mojo.pl` というファイルが作成されていれば成功です。このファイルは雛形であり、このファイルに手を加えてWebアプリケーションを作成していきます。

___
## Mojolicious::Lite
### 開発用サーバ morbo
Mojoliciousをインストールすると、 <ruby>`morbo`<rt>モーボ</rt></ruby> というコマンドも使えるようになります。

`morbo` は開発用の**Webアプリケーションサーバ**です。この morbo コマンドで mojolicious を起動し、ブラウザで表示を確認しつつ、修正やデバッグをしてWebアプリを作成していきます。

インターネット上では主に <ruby>Apache<rt>アパッチ</rt></ruby> や <ruby>nginx<rt>エンジンエックス</rt></ruby> といったWebサーバと、 Webアプリケーションサーバが連携してWebサービスを提供しています。

___
## Mojolicious::Lite
### morboを起動する
ターミナルから、以下のように打ち込んで実行してください。

```bash
$ morbo hello_mojo.pl
```

Web ブラウザで <a href="http://127.0.0.1:3000" target="_blank">`http://127.0.0.1:3000`</a> にアクセスしてみましょう。

画面上に `Server available at http://127.0.0.1:3000.` と表示されれば起動しています。

___
## Mojolicious::Lite
### morboを終了する
ターミナル上で Ctrl（又は Control ）キーを押しながら C キーを押します。

ターミナルが入力待ちの状態に戻れば morbo は終了しています。

ブラウザをリロードすると、ページが表示できなきなくなっています。

___
## Mojolicious::Lite
### IPアドレスとポート番号

入力したアドレスについては簡単な説明で済ませます。興味のある方はネットワークについて勉強してみましょう！

- Webにアクセスする際には、対象のサーバのIPアドレスが必要です。

- `127.0.0.1` は**ローカルループバックアドレス**といい、自分自身を指す特殊なIPアドレスです。

- `:3000` は**ポート番号**とよばれるものです。通常のhttpサーバは80番ポートを使います。メールの送信（SMTP）には25番、メールの受信には110番、など利用するアプリケーションごとに番号が決められています。

___
## Mojolicious::Lite
### コード解説
それでは、先ほど作成した雛形、 `hello_mojo.pl` の解説を簡単に行なっていきます。

コード全体はこちらからも確認できます。

<a href="https://github.com/sironekotoro/hello_mojo_2019/commit/253065a313a25ef9c52c49ccf5d20b36ffd8c5c8?diff=unified" target="_blank">[GitHub] hello_mojo.pl</a>
___
## Mojolicious::Lite
### コード解説（Line 1 - 2）
```perl
#!/usr/bin/env perl
use Mojolicious::Lite;
```

`use Mojolicious::Lite;` とすることで、Mojolicious の関数が利用できるようになります。

また、自動的に `strict` 、 `warnings` 、 `utf8` 、 `Perl 5.10 feature` が有効になります。

___
## Mojolicious::Lite
### コード解説（Line 1 - 2）
```perl
use strict;         # お約束
use warnings;       # お約束
use utf8;           # スクリプトの中でマルチバイト文字（日本語など）を使う時に書く
use feature ':5.10';# Perl バージョン5.10で用意された関数を利用可能にする
```
`use Mojolicious::Lite;` と書くことで、上記の記述を含むことになります。

___
## Mojolicious::Lite
### コード解説（Line 4 - 7 ）
```perl
get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};
```
MVCモデルの Controller の部分です。

ウェブアプリケーションでは、URLごとに処理を変更できると便利です。URLごとに処理を振り分ける機能のことを <ruby>`router`<rt>ルーター</rt></ruby> や <ruby>`dispatcher`<rt>ディスパッチャー</rt></ruby>と呼びます。

`Mojolicious::Lite` では、 情報を取得する GET メソッド用の `router` として `get` という関数が用意されています。

___
## Mojolicious::Lite
### コード解説（Line 4 - 7 ）
```perl
get '/' => sub { 省略 };
```
見慣れない書き方ですが、これは、先に説明した `get` という関数に、2つの引数を渡しているものです。

1つ目の引数が `'/'` という文字列、2つ目の引数がコードリファレンス（サブルーチンリファレンス）です。

コードリファレンス（サブルーチンリファレンス）は `sub` から始まっていますが、先に学習したサブルーチンではありません。**サブルーチンのリファレンス**です。**1点重要な違いとして末尾にセミコロンが必要**です。

このように書くことで、GET メソッドで `/` にアクセスした時、 `sub { ... }` に書かれている処理が行われます。

___
## Mojolicious::Lite
### コード解説（Line 5 - 6 ）
```
my $c = shift;
$c->render(template => 'index');
```
コードリファレンス内の最初の行は、引数を $c というスカラー変数で受け取っています。この $c はコントローラーの略称と思ってください。

$cの中に入るのは、「どのブラウザからアクセスしてきたか？」「入力項目にどのような値が入っているか？」「どのような操作が可能か？」といった情報の塊、オブジェクトです（詳細は「[すぐわかる オブジェクト指向Perl](http://gihyo.jp/book/2008/978-4-7741-3504-5)」で）。

コントローラーには `render` という**メソッド**があり、どのような出力をするのかを書くことができます。メソッドは、オブジェクトに紐づいたサブルーチンと思ってください。

ここでは `index` のテンプレートに出力するように書かかれています。

___
## Mojolicious::Lite
### コード解説（Line 9 ）
```perl
app->start;
```

コントローラーの処理を書いた後、Mojolicious が用意した app オブジェクトの start メソッドを利用してアプリを起動します。

このコードがないと Mojolicious は起動しません。

___
## Mojolicious::Lite
### コード解説（Line 10 ）
```perl
  __DATA__
```

`__DATA__` この行以降を**データセクション**といいます。

Perlはこの行以降は文字通りデータとして扱い、コードとして解釈しなくなります。

Mojolicious::Liteでは、ここにブラウザで表示される部分、MVCフレームワークの View に関するコードを書いていきます。

Mojolicious::Liteでは、Viewをさらに分割しています。
- ページの内容を記述する「テンプレート部」
- ページのレイアウトを設定する「レイアウト（レイアウトテンプレート）部」

___
## Mojolicious::Lite
### コード解説（Line 12 ）
```perl
@@ index.html.ep
```
ここからはページの内容を記述するテンプレート部となります。

`Mojolicious::Lite` では、 `@@ index.html.ep` と書くと、次に `@@` が出てくるまでの範囲を `index.html.ep` というファイルとして扱います。

このようにすれば、1つのPerlスクリプトで多くのページを作ることができ、効率的にWebアプリを書くことができます。

`ep` は、Mojoliciousの標準的なテンプレート機能を使用するための拡張子です。拡張子を `ep` にすることで、テンプレートであることを示します。

___
## Mojolicious::Lite
### コード解説（Line 13 - 15）
```perl
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
```
- `layout` 関数でレイアウトを指定します。ここでは `default` を設定しています。（後ほど詳しく説明します）

- `title` 関数はタイトルを指定します。ここでは `Welcome` を設定しています。（後ほど詳しく説明します）

- それ以外の通常の文字列は、そのままHTMLとして表示されます。

___
## Mojolicious::Lite
### コード解説（Line 17 ）
```perl
@@ layouts/default.html.ep
```
`@@` が書いてあるので「テンプレート部」はこの上の行までとなります。これ以降は「レイアウト（レイアウトテンプレート）部」です。

以下をまとめて書いておくことで、ページごとに記述する手間を省くことができます。

- `<html></html>`タグや`<head></head>`タグ`<body></body>`などの必須HTMLタグ
- タイトルロゴや会社案内などのヘッダーやフッターのHTML

また、このレイアウトもテンプレートと同じく、仮想的なファイル `layouts/default.html.ep` つまり `layouts` ディレクトリにある `default.html.ep` というファイルとして扱われます。


___
## Mojolicious::Lite
### コード解説（Line 18 - 22 ）
```perl
<!DOCTYPE html>
<html>
  <head><title> 省略 </title></head>
  <body> 省略 </body>
</html>
```
- `<!DOCTYPE html>` HTMLのバージョン5(HTML5)で書かれていることをブラウザに伝えるHTMLのマークアップ宣言です。
- `<html>...</html>` このタグの内部にHTMLを記述します。
- `<head>...</head>` このタグの内部にHTMLのヘッダー情報を記述します。
  - `<title></title>` このタグの内部にページタイトルを記述します
- `<body>...</body>` このタグの内部にHTMLの本文を記述します。

___
## Mojolicious::Lite
### コード解説（Line 20 - 21 ）
HTMLタグの内側に書かれているものについての解説です。
```
<head><title><%= title %></title></head>
<body><%= content %></body>
```
-  `<%= ... %>` （あるいは `%=` から始まる行）は、Perl のコードを実行するだけでなく、変数の値を表示したい時に書きます。

-  `<%= title %>` は、14行目で `% title 'Welcome';` と指定したので、 `Welcome` と表示されます。 `title`は、Mojoliciousが用意した関数です。

-  `content` は、レイアウトテンプレート内で使える関数で、テンプレート部（12 - 15行目）の中身がここに代入されます。

___
## Mojolicious::Lite
### コード解説（イラスト）
![hello_mojoコード解説](https://raw.githubusercontent.com/perl-entrance-org/workshop-2019/master/5th/image/perl_entrance_2019_5th_05.png "hello_mojoコード解説")

---
# Mojolicious 入門

___
## Mojolicious 入門
### Controller -> view
`morbo` が起動していない人はターミナルから以下のコマンドで起動します。
```bash
$ morbo hello_mojo.pl
```

先に作成した `hello_mojo.pl` のファイルを編集していきます。

<a href="https://github.com/sironekotoro/hello_mojo_2019/commit/253065a313a25ef9c52c49ccf5d20b36ffd8c5c8?diff=unified" target="_blank">[GitHub] hello_mojo.pl</a>

___
## Mojolicious 入門
### Controller -> view
まず、Controllerで変数を設定して、それをView（テンプレート）に渡してみましょう。
<a href="https://github.com/sironekotoro/hello_mojo_2019/compare/253065a313a25ef9c52c49ccf5d20b36ffd8c5c8..511a3aa2f123384bebfb99f05f135f65444a4fb2?diff=split" target="_blank">[GitHub] hello_mojo.pl</a>
```perl
get '/' => sub {
  my $c = shift;
  $c->stash( greeting => 'Hello Mojo' );  # この行を追加
  $c->render('index');
};
```

コントローラー部で `$c->stash( greeting => 'Hello Mojo' );` と書くことで、テンプレート内でスカラー変数 `$greeting`
（中身は文字列'Hello Mojo'）を利用することが可能になります。

`stash`メソッドの引数がハッシュ形式であることにも注目です。

___
## Mojolicious 入門
### Controller -> view
Controllerで設定した変数を、View（テンプレート）で、表示してみます。
Welcome〜 の行の下に、 ` <%= $greeting %>` と1行追加してください。

<a href="https://github.com/sironekotoro/hello_mojo_2019/compare/511a3aa2f123384bebfb99f05f135f65444a4fb2..41383ecba6ce91b9e0c2fb18198fadfd147e00b0" target="_blank">[GitHub] hello_mojo.pl</a>
```perl
<h1>Welcome to the Mojolicious real-time web framework!</h1>
<%= $greeting %>    # この行を追加
```

追加したらスクリプトを保存して、ブラウザをリロードしてください。

Hello Mojo と表示されたら成功です。

このように、Controller で設定した変数を、 <%= 変数名 %> という特別なタグをつかってテンプレート内で表示することができます。

___
## Mojolicious 入門
### ページの増やし方
つぎに、ページの増やし方です。新たにひな形を作って実践していきます。
```bash
$ mojo generate lite_app mojo_prof.pl

$ morbo mojo_prof.pl
```

作成した `mojo_prof.pl` を編集していきます。

<a href="https://github.com/sironekotoro/mojo_prof_2019/commit/df438373846508b652496a7b838d3ea229b2ea0d?diff=unified" target="_blank">[GitHub] mojo_prof.pl</a>

___
## Mojolicious 入門
### ページの増やし方 Controller
まず、コントローラー部にルーターを追加します。

<a href="https://github.com/sironekotoro/mojo_prof_2019/compare/df438373846508b652496a7b838d3ea229b2ea0d..784fce3a18078eb2b18e094654aca0a747cff9ab" target="_blank">[GitHub] mojo_prof.pl</a>

```
get '/' => sub {
  my $c = shift;
  $c->render(template => 'index');
};

# 以下の4行を追加
get '/profile' => sub {             # get関数の最初の引数が
  my $c = shift;                    # /profile となっている
  $c->render(template => 'index');
};
```

___
## Mojolicious 入門
### ページの増やし方 Controller
ここまで入力したら、ブラウザをリロード（再読み込み）してから以下のアドレスにアクセスしてみてください。

- <a href="http://127.0.0.1:3000" target="_blank">`http://127.0.0.1:3000`</a>
- <a href="http://127.0.0.1:3000/profile" target="_blank">`http://127.0.0.1:3000/profile`</a>

同じページが表示されていれば成功です。

また、ルーターを追加していない適当なアドレスを入力して、エラーが出ることを確認してみましょう。

- <a href="http://127.0.0.1:3000/profile" target="_blank">`http://127.0.0.1:3000/hogehoge`</a>

___
## Mojolicious 入門
### ページの増やし方 View
では、ページのアドレスごとに表示される内容を変更します。引き続き、`mojo_prof.pl`を編集します。今度はViewのテンプレート部に追加します。

Welcome のメッセージ下にある4行をコピペして追加します。なお、`<!-- コメント -->` はテンプレート（HTML部分）にコメントを書くときの記法です。<a href="https://github.com/sironekotoro/mojo_prof_2019/compare/784fce3a18078eb2b18e094654aca0a747cff9ab..2c1d3fe828eebdf3ad1a7689ef9c6778e15fb868" target="_blank">[GitHub] mojo_prof.pl</a>

```perl
<h1>Welcome to the Mojolicious real-time web framework!</h1>
<!-- <h1>タグの下に以下の4行を追加する -->
@@ profile.html.ep
% layout 'default';
% title 'ぷろふぃーる';
<h1>プロフィール</h1>

@@ layouts/default.html.ep
```

___
## Mojolicious 入門
### ページの増やし方 View
view の用意ができたので、コントローラー部の renderメソッドを変更します。

<a href="https://github.com/sironekotoro/mojo_prof_2019/compare/2c1d3fe828eebdf3ad1a7689ef9c6778e15fb868..4f760bbd3a7cd0d75d403a9bd460328b3abfc639" target="_blank">[GitHub] mojo_prof.pl</a>

```perl
  $c->render(template => 'index');
};

# 以下の4行を追加
get '/profile' => sub {
  my $c = shift;
  $c->render(template => 'profile');# ここを index から profile に変更する
};
```

___
## Mojolicious 入門
### ページの増やし方 View
ブラウザをリロード（再読み込み）してから以下のそれぞれのアドレスにアクセスしてみてください。

- <a href="http://127.0.0.1:3000" target="_blank">`http://127.0.0.1:3000`</a>
- <a href="http://127.0.0.1:3000/profile" target="_blank">`http://127.0.0.1:3000/profile`</a>

`http://127.0.0.1:3000/profile` にアクセスした時に「プロフィール」と表示されていたら成功です。

これでページのアドレスごとに異なる内容を表示することができました。

___
## 練習問題
先ほど作成した<a href="http://127.0.0.1:3000/profile" target="_blank">`http://127.0.0.1:3000/profile`</a>を充実させましょう。以下のページからコードをコピペして利用してもokです。

<a href="https://github.com/sironekotoro/mojo_prof_2019/blob/559711cd91afe1fefc1f887f672f554f1c116489/mojo_prof.pl" target="_blank">[GitHub] mojo_prof.pl</a>

```html
@@ profile.html.ep
% layout 'default';
% title 'profile';
<h1>プロフィール</h1>
<p>私の名前は<%= $name %>です</p>
<p>趣味は<%= $hobby %>で, 好きなプログラミング言語は<%= $lang %>です</p>
```
1. テンプレート部の profile を、コピペして上記のものに置き換えます。
1. コントローラー内で stash を利用して `name`, `hobby`, `lang` 変数に値を代入します。
  - 思いつかない人用ハッシュ<br> (name => 'larry', hobby => 'study', lang => 'Perl' )

---
# テンプレートの<br>活用

___
## テンプレートの活用
### テンプレートで制御構文
テンプレートは単にHTMLを表示したり、コントローラーで設定した変数を表示するだけではありません。

if文やfor文のような、Perlの制御構文をテンプレート内で記述することができます。

さっそく練習用の雛形を作って実行してみましょう。

<a href="https://github.com/sironekotoro/mojo_fizzbuzz_2019/commit/49a3e4543880b650e940a9b46cc7bc824205c392?diff=unified" target="_blank">[GitHub] mojo_fizzbuzz.pl</a>

```bash
$ mojo generate lite_app mojo_fizzbuzz.pl

$ morbo mojo_fizzbuzz.pl
```

名前から分かる通り、 fizzbuzz をやってきます。

___
## テンプレートの活用
### テンプレートでfor文
今回はテンプレートの活用なので、テンプレート部の「Welcome 〜 」の下の行から書いていきます。

<a href="https://github.com/sironekotoro/mojo_fizzbuzz_2019/compare/49a3e4543880b650e940a9b46cc7bc824205c392..87e70fa8e8be80e52ec5ee433a38b91d686917fb?diff=split" target="_blank">[GitHub] mojo_fizzbuzz.pl</a>

```perl
<h1>Welcome to the Mojolicious real-time web framework!</h1>
<!-- 以下4行を追加 -->
<% for my $num (1 .. 100){ %>
    <%= $num %>
<% } %>
```

書き終えたら、ブラウザをリロードしてください。1 から 100 までの数字が表示されていれば成功です。

___
## テンプレートの活用
### テンプレートでfor文
では解説します。
```perl
<% for my $num (1 .. 100){ %>
  <%= $num %>
<% } %>
```
テンプレートで利用する特殊なタグを外すとこのようになります。
```perl
for my $num (1 .. 100){
  $num
}
```
Perlで書くfor文とほぼ同じです。

___
## テンプレートの活用
### テンプレートでfor文
```perl
<% for my $num (1 .. 100){ %>

<% } %>
```
テンプレートでのfor文ですが、これはそれぞれの行を `<%  %>` というテンプレート用の特殊なタグで囲っています。
```perl
<% for my $num (1 .. 100){ %>
  <%= $num %>
<% } %>
```
そして、forで処理された変数 `$num` を囲む特殊タグが、forの特殊タグと異なるところに注目してください。

___
## テンプレートの活用
### テンプレートでfor文
変数を表示するタグには `=` があり、Perlの構文を書くタグには `=` がありません。

- 変数を表示する : <%= 変数 %>

- Perlの文を書く: <% Perlの文 %>

このように、その行で何をしているかによって特殊タグを変える必要があります。

なお、変数を表示する際の `print` は不要です。

___
## テンプレートの活用
### テンプレートでif文
引き続き、fizzbuzz.plを編集していきます。

<a href="https://github.com/sironekotoro/mojo_fizzbuzz_2019/compare/87e70fa8e8be80e52ec5ee433a38b91d686917fb..298b579c546ee1741a812f99f9dfa0e8328796d0" target="_blank">[GitHub] mojo_fizzbuzz.pl</a>

```perl
<% for my $num (1 .. 100){ %>
  <% if ($num % 3 == 0 ){ %>
    fizz
  <% } else { %>
    <%= $num %>
  <% } %>
<% } %>
```
for文の中にif文を書いています。一気に難しくなったようにみえますが、分解して解説していきます。

___
## テンプレートの活用
### テンプレートでif文
for文の中のif文の部分だけを取り出してみます。
```perl
<% if ($num % 3 == 0 ){ %>
  fizz
<% } else { %>
  <%= $num %>
<% } %>
```

さらに、テンプレートで利用する特殊なタグを外してみます。
```perl
if ($num % 3 == 0 ){
  fizz
} else {
  $num
}
```
馴染みのある形になったと思います。

___
## テンプレートの活用
### テンプレートでif文
```perl
<% if ($num % 3 == 0 ){ %>
  fizz
<% } else { %>
  <%= $num %>
<% } %>
```
ここでもfor文とほぼ同じで、

- 条件分岐のif文の行は `<% %>` で囲われている

- 単に文字を表示するときはその文字 `fizz` のみ

- 変数を表示するときは `<%= %>`

というルールでタグに囲まれています。

___
## 練習問題
fizzbuzz を完成させましょう。 <a href="https://github.com/sironekotoro/mojo_fizzbuzz_2019/blob/master/mojo_fizzbuzz.pl" target="_blank">[GitHub] mojo_fizzbuzz.pl</a>

- fizzbuzzのルール
    - 1 から 100 までの数をカウントしていく
    - 3 で割り切れる場合、数字ではなく fizz と表示
    - 5 で割り切れる場合、数字ではなく buzz と表示
    - 3 でも 5 でも割り切れる場合、数字ではなく fizzbuzz と表示
    - いずれも満たさない場合は、その数を表示

- 時間が余った人向け課題
  - `<br>` で改行したり、 `<font color ='blue'>` や `<font color ='red'>` などで結果に応じた色をつけてみる
  - テンプレート部ではなく、コントローラー部に fizzbuzz を書いてテンプレート経由で表示する

---
# 簡易 BBS の作成

___
## 簡易 BBS の作成
### 簡易BBSの概要
いよいよPerl入学式の講義も最終項目となりました。

これから作るのは、Webアプリの基本形ともいえる **BBS、掲示板** です。

<blockquote>
  電子掲示板（でんしけいじばん、BBS、英語: Bulletin Board System）とは、コンピュータネットワークを使用した環境で、記事を書き込んだり、閲覧したり、コメント（レス）を付けられるようにした仕組みのことである。<div style="text-align: right;">[wikipedia 電子掲示板](https://ja.wikipedia.org/wiki/%E9%9B%BB%E5%AD%90%E6%8E%B2%E7%A4%BA%E6%9D%BF)</div>
</blockquote>

___
## 簡易 BBS の作成
### なぜ簡易BBSが基本形なのか？
簡易BBSを構成する最低限の要素は以下の３つです。

1. ページが表示できる

1. ページを経由して情報を送信できる

1. 送信した内容に応じて、ページ内の情報やサービスが変わる

これは全てのWebアプリで必須の要素であり、簡易BBSを通して実装を学ぶことができます。

Twitter や Instagram、交通情報や天気、音楽アプリやゲームなどでも共通する要素です。

___
## 簡易 BBS の作成
### CRUD
なお、Webに限らず、アプリの基本要素をまとめたものを<ruby>CRUD<rt>クラッド</rt></ruby>といい、以下の略称となります。
- Create: 情報を生成する。

- Read: 情報を閲覧できる。

- Update: 情報を更新できる

- Delete: 情報を削除できる

Perl入学式での簡易BBS作成は、CRUDのうち、 Create と Read を実装します。


___
## 簡易 BBS の作成
### Perl入学式版BBS
以下を完成形として作っていきます。

- Webブラウザで表示ができる

- ページに入力欄がある

- 入力欄から入力した文字を投稿すると、その文字がページに表示される

- 複数回投稿すると、投稿した順番でページに表示される

___
## 簡易 BBS の作成
### 雛形をつくる

<a href="https://github.com/sironekotoro/mojo_bbs_2019/commit/0a3c0e311589ab92d1a0fd4dcd93882c4cb84449?diff=unified" target="_blank">[GitHub] mojo_bbs.pl</a>

```bash
$ mojo generate lite_app mojo_bbs.pl

$ morbo mojo_bbs.pl
```

作成された `mojo_bbs.pl` を編集していきます。

___
## 簡易 BBS の作成
### テンプレート表示の変更
まず、indexテンプレートを変更します。 <a href="https://github.com/sironekotoro/mojo_bbs_2019/compare/0a3c0e311589ab92d1a0fd4dcd93882c4cb84449..412ca588f6277bf61bbda43a53e0002579854383" target="_blank">[GitHub] mojo_bbs.pl</a>

変更前
```perl
@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>Welcome to the Mojolicious real-time web framework!</h1>
```

変更後（ title と `<h1></h1>` タグの中身を変更）
```perl
@@ index.html.ep
% layout 'default';
% title 'BBS';
<h1>掲示板です</h1>
```
ブラウザをリロードして、「掲示板です」と表示されるか確認します。

___
## 簡易 BBS の作成
### 入力フォームの作成
入力フォームを設置します。

`<h1>掲示板です</h1>` の下に、4行追加します。

<a href="https://github.com/sironekotoro/mojo_bbs_2019/compare/412ca588f6277bf61bbda43a53e0002579854383..e8f706a7f5aed771475334106ac85dbb8ef271d1" target="_blank">[GitHub] mojo_bbs.pl</a>

```html
<h1>掲示板です</h1>
<!-- ここから4行追加 -->
<form action="/" method="get">
    <input name="body" type="text">
    <input type="submit" value="投稿する">
</form>
```

___
## 簡易 BBS の作成
### 入力フォームの作成
追加したら保存します。

ブラウザをリロード (あるいは<a href="http://127.0.0.1:3000" target="_blank">`http://127.0.0.1:3000`</a>)
にアクセス) してみましょう。

入力欄が表示されていれば成功です。

___
## 簡易 BBS の作成
### クエリ文字列
ここで、入力欄に「hogehoge」といれて「投稿する」ボタンを押してみます。

画面上に変化がないように見えます・・・が、ブラウザのアドレスバーに注目してください。以下のようになっているはずです。

```
http://127.0.0.1:3000/?body=hogehoge
```

他の文字を入れた時も、アドレスバーは入力された文字に応じて表示が変わります。

- `body` は テンプレートの `form` タグの `name`
- `hogehoge` は入力内容

この `?body=hogehoge` の部分を**クエリ文字列、クエリストリング(query string)**といいます。

___
## 簡易 BBS の作成
### ここでMVCモデルを思い出す
MVCモデルを思い出しましょう。

いま、入力欄が表示されているのは View です。

この View で入力された情報を View で表示するためには、 一度 Controller に入力内容を渡す必要があります。

そして、Controller から View に情報を渡す必要があります。

___
## 簡易 BBS の作成
### ここでMVCモデルを思い出す（イラスト）
![MojoliciousではModelを作りこむ必要がある](https://raw.githubusercontent.com/perl-entrance-org/workshop-2019/master/5th/image/perl_entrance_2019_5th_04.png "MojoliciousではModelを作りこむ必要がある")

___
## 簡易 BBS の作成
### View -> Controller
クエリ文字列を使って、View（の中にあるフォーム） から Controller に入力内容を渡します。

> （再掲）
> $cの中に入るのは、「どのブラウザからアクセスしてきたか？」「入力項目にどのような値が入っているか？」「どのような操作が可能か？」といった情報の塊、オブジェクトです（詳細はオブジェクト指向Perlで）。

___
## 簡易 BBS の作成
### View -> Controller
確認してみましょう。Controllerに、以下のようなデバッグ情報を追加して保存します。

<a href="https://github.com/sironekotoro/mojo_bbs_2019
/compare/e8f706a7f5aed771475334106ac85dbb8ef271d1..f9585aa962880c5534b884183f9bdbc3247008cf" target="_blank">[GitHub] mojo_bbs.pl</a>

```perl
get '/' => sub {
  my $c = shift;
  print '-----' ."\n"    ;       # 追加:単なる区切り線
  print $c->param('body') . "\n";# 追加:デバッグプリント
  print '-----' ."\n"    ;       # 追加:単なる区切り線
  $c->render('index');
};
```

ブラウザをリロードして、適当な内容をフォームに入れて「投稿する」ボタンを押してみましょう。

ターミナルのログの中に、入力した文字が表示されています。

___
## 簡易 BBS の作成
### View -> Controller
先ほどコントローラー部に追加した4行のうち、デバッグ用の表示部分を除いた肝心の部分はこの1行です。

Mojolicious の get メソッド内にある $c の `param` メソッドです。

```perl
my $entry = $c->param('body'); # 追加
```

この `$c` の `param` メソッドの引数に `form` の `name`（今回はbody） を指定することで、テンプレート内にある入力フォームから送信された内容を取得することが可能です。

___
## 簡易 BBS の作成
### View -> Controllerの流れ

このような流れでテンプレート部のフォームの内容をコントローラーが受け取ります。

1. Viewで表示されたフォームに入力

1. 「投稿する」ボタンを押す

1. フォームのname（今回はbody）と入力内容が含まれたクエリ文字列が作成される

1. クエリ文字列がGETメソッドでサーバー（Mojolicious）に送信される

1. Mojolicousが送信内容を受け取る

___
## 簡易 BBS の作成
### Controller -> viewの流れ
受け取った内容をviewに反映させるため、さらに Controller に追加します。

Controller から View に渡す方法は hello_mojo.pl や mojo_prof.pl で実践済みの `stash` を使います。
<a href="https://github.com/sironekotoro/mojo_bbs_2019
/compare/f9585aa962880c5534b884183f9bdbc3247008cf..28a7ef8fe80d9bf84e2c32dfe1fad78b803cd3e8" target="_blank">[GitHub] mojo_bbs.pl</a>

```perl
get '/' => sub {
  my $c = shift;
  my $entry = $c->param('body') ; # クエリストリング body を受け取り $entry に代入
  $c->stash( kakikomi => $entry );# 追加
  $c->render('index');
};
```
受け取った情報をスカラー変数 `$entry` に代入しています。そして、$entry をstashメソッドの引数（ハッシュのvalue）として渡しています。

___
## 簡易 BBS の作成
### Controller -> view
Controller から受け取った情報を表示します。

formタグの下に、以下を追加します。

<a href="https://github.com/sironekotoro/mojo_bbs_2019
/compare/28a7ef8fe80d9bf84e2c32dfe1fad78b803cd3e8..e5c184cb4c7682142027fdd09e9ddc26fedf91cd" target="_blank">[GitHub] mojo_bbs.pl</a>

```html
<p><%= $kakikomi %></p>
```

ここまで出来たら、保存してからブラウザをリロード (あるいは<a href="http://127.0.0.1:3000" target="_blank">`http://127.0.0.1:3000`</a>にアクセス) してみます。

フォームに文字を入力して、｢投稿する｣ボタンをクリックし、入力した文字がフォームの下に表示されることを確認します。


___
## 簡易 BBS の作成
### 記事を蓄える
さて、ここまでで投稿した内容をページに表示することができるようになりました。

しかし、再度投稿すると、上書きされてしまいます。

過去に投稿した記事がページに表示されるように変更します。

___
## 簡易 BBS の作成
### 記事を蓄える方法
記事を蓄える場合、主に以下のような方法があります。

- MySQL や PostgreSQL 、SQLite などのデータベースを使う

- ファイルを作成し、そのファイルに記事を保存

今回は時間の制約上、データを蓄える方法として配列を使った方法を紹介します。

なお、配列はWebアプリケーションが停止・再起動した時点でデータが消えてしまいます。現実的ではないですが、無駄というわけではありません。

実際には、データベースから抜き出したデータを配列に格納し、Viewに渡す、という用途が多いです。応用が効く方法です。

___
## 簡易 BBS の作成
### 配列を用意する
まず、投稿を保存する配列を用意する必要があります。

<a href="https://github.com/sironekotoro/mojo_bbs_2019
/compare/e5c184cb4c7682142027fdd09e9ddc26fedf91cd..45f223f70d6a88f86ecf43732380682a47882710" target="_blank">[GitHub] mojo_bbs.pl</a>

```perl
use Mojolicious::Lite;

my @entries = (); # 追加する

get '/' => sub {
```
配列は `get` のコードリファレンスの外で宣言します。なぜでしょう？

コードリファレンスの中で `my @entries` とすると、 `get` でアクセスの都度、配列が初期化されてしまい、投稿を貯めることができなくなるためです。

___
## 簡易 BBS の作成
### 配列に投稿を貯める
コントローラーの部分を変更します。

<a href="https://github.com/sironekotoro/mojo_bbs_2019
/compare/45f223f70d6a88f86ecf43732380682a47882710..bacf90c29a92e8a4de97b809dec3f40b5c67fba1" target="_blank">[GitHub] mojo_bbs.pl</a>

```perl
get '/' => sub {
    my $c     = shift;
    my $entry = $c->param('body');
    push @entries , $entry;            # 追加
    $c->stash( kakikomi => \@entries );# 変更
    $c->render('index');
};
```

クエリストリングから取得した記事を配列 `@entries` に `push` します。

また、`stash` メソッドに渡す引数を配列リファレンスに変更します。

___
## 簡易 BBS の作成
### 貯めた投稿を表示する
コントローラーから受け取ったスカラー変数を、テンプレート部で表示しています。
```perl
<p><%= $kakikomi %></p>
```
この時点でブラウザをリロードすると、入力欄の下に ARRAY(0x7fb17f0d1610) などと表示されます。

これは配列リファレンスを print した時と同じです。

コントローラー部からテンプレートへ配列リファレンスが引き渡されていることがわかります。

___
## 簡易 BBS の作成
### 貯めた投稿を表示する
この配列リファレンスをデリファレンスします。配列といえば for 文です。`<p>`タグで囲まれたところを変更します。 <a href="https://github.com/sironekotoro/mojo_bbs_2019
/compare/bacf90c29a92e8a4de97b809dec3f40b5c67fba1..6a14d7a02f766ede4e18939e62cedeac105b48a9" target="_blank">[GitHub] mojo_bbs.pl</a>

変更前
```perl
<p><%= $kakikomi %></p>
```

変更後
```perl
<p>
<% for my $kakiko (@{$kakikomi}){ %>
    <%= $kakiko %><br>
<% } %>
</p>
```
これで、投稿が配列に溜まり続け、また、その投稿が表示されるようになりました。

___
## 最終問題
これまで作成してきた簡易 BBS を, 改造してみましょう!

例えば...?

- 名前/メールアドレスを入力/表示できるようにする

- メールアドレスが｢age｣であれば、記事を `push` ではなく `unshift` する（一番上に表示される）

- テンプレートを整理して、見た目を綺麗にする

- レイアウトにTwitter Bootstrapを使ってみる

などなど。

---
# お疲れ様でした！

___
## お疲れ様でした！
### Webアプリの一歩目
非常に簡単ではありますが、BBS (のような) Web サービスを開発してみました。

Perl を使った Web サービス開発の基本的な流れはこのようになっています。

今日ここまで紹介してきた内容は、基礎中の基礎です。

そして、Webサービス全体のうち、「サーバサイド」と呼ばれる部分の一部です。

｢ Web サービスを作ろう！｣となると、Perl以外にも挑戦しなければならない｢壁｣はいくつもあります。

___
## お疲れ様でした！
### Webアプリ完成までにぶつかる壁（一部）
- HTMLのコーディング
  - HTML5, WEB標準
- Webデザイン、Webアクセシビリティ、ユーザーインターフェイス
  - CSS, スタイルシートフレームワーク
- インタラクティブなサイト作り
  - JavaScript、Javascriptフレームワーク
- WebサーバとWebアプリケーションサーバの運用管理
  - Apache, nginx, plack, starman
- データベースの運用管理
  - MySQL, PostgreSQL, SQLite, Oracle
- ネットワーク
  - ルーティング, CDN, DNS
- セキュリティ
  - XSS, 各種インジェクション攻撃対策

___
## お疲れ様でした！
### 大きな一歩
しかし、皆さんは `Hello World` の表示からはじめて、Webサービスの基礎を学ぶところまでたどり着きました。

同じように、他の分野の知識も一歩一歩着実に学ぶことで身につけることができます。

また、自分ができない分野は、他の誰かが得意な分野かもしれません。

困ったことがあったら、Perl入学式の資料やスタッフを是非頼って下さい！

是非Perl入学式の[slack](https://docs.google.com/forms/d/e/1FAIpQLScbWyg-cgcqilW7-BpKagRm2ldBhvwRBNr2N5eg3LHOK13FGw/viewform)に参加して、 サポーターや参加者の皆さんと交流しましょう。

___
## 全5回、お疲れ様でした！

---
# 落ち穂拾い 1
## HTTP の基礎

___
## HTTP の基礎
### 用語解説
今回はWebアプリケーションを作っていきますが、その前にWebについて最低限の解説を行います。

皆さんが使っているブラウザと、インターネット上にあるサーバは**HTTP**という**プロトコル**を用いて通信を行なっています。
- HTTP: Hyper Text Transfer Protocol
- Hyper Text:複数の文書（テキスト）を相互に関連付け、結び付ける仕組み([wikipedia](https://ja.wikipedia.org/wiki/%E3%83%8F%E3%82%A4%E3%83%91%E3%83%BC%E3%83%86%E3%82%AD%E3%82%B9%E3%83%88))
- プロトコル：手順

___
## HTTP の基礎
### HTTP のメソッド
HTTPというプロトコルでは、情報の取得を行う**メソッド（方法・手段）**として、主に以下の2つが利用されています。

- GET  : （主に）サーバからデータを取得する

- POST : （主に）サーバにデータを送信する

このGETとPOSTを利用して、ブラウザとWebアプリ間の情報をやりとりします。

___
## HTTP の基礎
### GETの特徴
- 主にサーバーからデータを取得する際に利用
- サーバーにデータを送る際、URLに情報が含まれる
- GETの例
  - [Yahoo!Japan](https://www.yahoo.co.jp/)の検索ボックスに Perl という文字を入れて検索すると、移動後のページで以下のようなURLになっている

  https://search.yahoo.co.jp/search?p=Perl&x=wrt&aq=-1&ai=&clone=&ei=UTF-8&fr=top_ga1_sa

  - 検索語である Perl がURLの中に含まれている

___
## HTTP の基礎
### POSTの特徴
- 主にサーバーにデータを送信する際に利用
- サーバーにデータを送る際、URLに情報が含まない
- POSTの例
  - [日本郵便](https://www.post.japanpost.jp/index.html)のページから郵便番号検索した時のURL

  https://www.post.japanpost.jp/cgi-zip/zipcode.php

  - GETの時と違って、入力された情報が移動後のURLの中に含まれない

___
## HTTP の基礎
### GET と POST
GET / POST で通信を行なっているのはパソコンで動いているブラウザだけではありません。

Android や iPhone などのスマホのアプリも、インターネットにあるサーバの情報を GET / POST でやりとりしています。

そして、スマホのアプリがつながるインターネット側では、 Perl をはじめ、node.js ( Javascript ) , Ruby, Python, C や Java などのプログラムが動いています。


---
# 落ち穂拾い 2
## 続・簡易 BBS の作成

___
## 続・簡易 BBS の作成
### POSTメソッド
完成させたBBSのフォームは、GETメソッドを利用してデータを送信していました。
```html
<form action="/" method="get">
（中略）
</form>
```

GETメソッドを利用する際には、以下の注意が必要です。

- 送信データは2KB程度（全角で1000文字くらい）が限度

  - 画像データなどは、2KBを軽く超える

- URLにフォームの内容が残り、セキュリティ上の問題になることも

___
## 続・簡易 BBS の作成
### GETとPOSTの復習
また、 GET と POST は利用用途で使い分ける方が好ましいです。GETとPOSTの復習です。

- GET  : （主に）サーバからデータを取得する

- POST : （主に）サーバにデータを送信する

___
## 続・簡易 BBS の作成
### POSTでのデータやりとり
GETでは、URLに投稿した内容をクエリストリングという形で付与してデータをサーバに送りました。

POSTでは、リクエストメッセージ内のリクエストボディというデータ領域にデータを込めて送ります。

このリクエストメッセージは容量制限が緩く、画像データなどのバイナリデータを込めることが可能です。

___
## 続・簡易 BBS の作成
### POSTメソッドを使った入力フォーム
落ち穂拾いでは、POSTメソッドを使った入力フォームを作っていきます。

また、「表示」と「投稿」で機能を分けた設計にしていきます。

ここまでのコードは本編の終了時のコードを元に編集していきます。ただし、ファイル名は新規に `mojo_post_bbs.pl` とします。ファイルをコピーするなどして対応するか、以下のリンクからコードをコピぺしてください。

<a href="https://github.com/sironekotoro/mojo_post_bbs_2019/commit/5ee90ddd03fbfc55478022627f32631ec55b93a8?diff=unified" target="_blank">[GitHub] mojo_post_bbs.pl</a>

___
## 続・簡易 BBS の作成
### POSTメソッド
まず、テンプレート部にある、既存のフォーム内のボタンを以下のように変更します。

<a href="https://github.com/sironekotoro/mojo_post_bbs_2019
/compare/5ee90ddd03fbfc55478022627f32631ec55b93a8..12adfc68a12148ec964f5f2e99eea5133eee8ed6" target="_blank">[GitHub] mojo_post_bbs.pl</a>

```html
<form action="/" method="get">
    <input name="body" type="text">
    <input type="submit" value="GETで投稿する"> <!-- ボタン名を変更 -->
</form>
```

___
## 続・簡易 BBS の作成
### POSTメソッドフォームを追加する
次に、テンプレート部にPOSTメソッド用の入力フォームを追加します。GETメソッドのフォームとの違いは以下の3つです。

1. `<form>` タグのactionが `/post` になっている
1. `<form>` タグのmethodが `/post` になっている
1. `<form>` タグ内のボタンの文字列をPOSTにしている

<a href="https://github.com/sironekotoro/mojo_post_bbs_2019
/compare/12adfc68a12148ec964f5f2e99eea5133eee8ed6..d4366f736a199bec58f03cdcdd5113dbc9bd5084" target="_blank">[GitHub] mojo_post_bbs.pl</a>

```html
    <input type="submit" value="GETで投稿する">
</form>
<!-- 以下の4行追加 -->
<form action="/post" method="post">
    <input name="body" type="text">
    <input type="submit" value="POSTで投稿する">
</form>
```

___
## 続・簡易 BBS の作成
### POSTメソッドフォームを追加する
この時点でブラウザをリロードすると、POSTで投稿するフォームとボタンが表示されます。

しかし、POSTの入力欄に入れて「POSTで投稿」ボタンを押しても、エラーが出ます。

これは、テンプレートにある入力フォームがPOSTメソッドで情報を送っても、その情報を受け取るコントローラーがないためです。

___
## 続・簡易 BBS の作成
### POSTメソッドをコントローラーで受け取る
POSTを受け付けるコントローラーを追加します。 <a href="https://github.com/sironekotoro/mojo_post_bbs_2019
/compare/d4366f736a199bec58f03cdcdd5113dbc9bd5084..579cdaf21cad7708fa07ec5e3871f79c3f97a67d" target="_blank">[GitHub] mojo_post_bbs.pl</a>
```perl
  $c->render('index');
};
# 以下の6行追加
post '/post' => sub {              # getではなく、post 。また第一引数にも注目
  my $c     = shift;
  my $entry = $c->param('body');
  push @entries , $entry;
  $c->stash( kakikomi => \@entries );
  $c->render('index');
};
```
追加したコントローラーのメソッドが `get` ではなく、 `post` であり、postメソッドの第一引数が `/post` となっています。それ以外は `get` メソッドと同じです。

___
## 続・簡易 BBS の作成
### POSTメソッド実装完了
この時点でPOSTメソッドでの投稿が可能になっています。

GETとPOST、それぞれの方法で投稿して、ブラウザのアドレスバーに表示される内容が異なっていることを確認します。

___
## 続・簡易 BBS の作成
### GETとPOSTの機能に応じたコード作り
ここからは、さらなる「落ち穂拾い」です。

コントローラー部のgetメソッドとpostメソッドを比較すると、異なっているのはそれぞれのコードリファレンスの最初だけです。

```perl
get '/' => sub {
  # 中略
}

post '/post' => sub {
  # 中略
}
```

___
## 続・簡易 BBS の作成
### GETとPOSTの復習（再再掲）
また、 GET と POST は利用用途で使い分ける方が好ましいです。GETとPOSTの復習です。

- GET  : （主に）サーバからデータを取得する

- POST : （主に）サーバにデータを送信する

この、GETとPOSTの原則をコードで再現します。

___
## 続・簡易 BBS の作成
### GETはデータの取得だけ
コントローラー部にあるgetメソッドから、投稿データを受け取り配列に保存する部分をコメントアウトします。

> GET  : （主に）サーバからデータを取得する

<a href="https://github.com/sironekotoro/mojo_post_bbs_2019
/compare/579cdaf21cad7708fa07ec5e3871f79c3f97a67d..0bf3ef36e67ee4981dcebdd33889cd54bc5cdf05" target="_blank">[GitHub] mojo_post_bbs.pl</a>

```perl
get '/' => sub {
  my $c     = shift;
#  my $entry = $c->param('body');    # コメントアウト
#  push @entries , $entry;           # コメントアウト
  $c->stash( kakikomi => \@entries );
  $c->render('index');
};
```

___
## 続・簡易 BBS の作成
### GETはデータの取得だけ
先のコメントアウトにより、getメソッドは「サーバから取得したデータの表示」の役割のみになります。

ブラウザでGETの入力欄に入力して「GETで投稿する」ボタンを押しても、投稿は反映されなくなりました。

___
## 続・簡易 BBS の作成
### POSTはデータの送信だけ
引き続きpostメソッドです。少しだけ複雑です。

> POST : （主に）サーバにデータを送信する

___
## 続・簡易 BBS の作成
### POSTはデータの送信だけ
postメソッドを見ると、以下の二つの機能が原則から外れています。これらはデータの取得と表示のための機能で、POSTの原則である「データの送信」から離れています。これをコメントアウトします。 <a href="https://github.com/sironekotoro/mojo_post_bbs_2019
/compare/0bf3ef36e67ee4981dcebdd33889cd54bc5cdf05..bbd33f0a04a05127c6933803e7afde67ff9465de" target="_blank">[GitHub] mojo_post_bbs.pl</a>

1. テンプレートに投稿（配列リファレンス）を渡すための `stash`

1. indexテンプレートを表示する `render`

```
post '/post' => sub {
  my $c     = shift;
  my $entry = $c->param('body');
  push @entries , $entry;
  # $c->stash( kakikomi => \@entries );# コメントアウト
  # $c->render('index');               # コメントアウト
};
```

___
## 続・簡易 BBS の作成
### POSTはデータの送信だけ
しかし、この時点でブラウザからPOSTで投稿するとタイムアウトしてしまいます。

これは、投稿を保存した後に何を表示するか？という `$c->render('index');` も削ってしまったためです。

ここで、投稿した内容を表示しているのは `get` メソッドであることを思い出し、`post` の処理が終わったら `get` に処理を引き渡す1行を追加します。

___
## 続・簡易 BBS の作成
### redirect_to
postメソッドの処理の最後に、 `get '/'` へ処理を遷移させる `redirect_to` メソッドを追加します。

このように書くことで、postの処理が終わった後にコントローラー内の `get '/'`へと処理が移ります。 <a href="https://github.com/sironekotoro/mojo_post_bbs_2019
/compare/bbd33f0a04a05127c6933803e7afde67ff9465de..79f9b729ae58af006ac3c715fd95402afc00b1e2" target="_blank">[GitHub] mojo_post_bbs.pl</a>

```perl
post '/post' => sub {
  my $c     = shift;
  my $entry = $c->param('body');
  push @entries , $entry;
  # $c->stash( kakikomi => \@entries );# コメントアウト
  # $c->render('index');               # コメントアウト
  $c->redirect_to('/'); # 投稿を受け付けた後に、get で / に移動
};
```

___
## 続・簡易 BBS の作成
### ここまでの処理の流れ

1. getでページが表示される
1. postの入力欄に何かを入力し、「POSTで投稿」ボタンを押す
1. フォームがコントローラーにpostメソッドで情報を送る
1. 投稿内容をコントローラーのpostメソッドが受け取る
1. postメソッドが投稿を配列 `@entries` に追加する
1. 処理をgetメソッドに移す
1. getメソッドは `@entries` を配列リファレンスにして、stashメソッドに格納する
1. getでページが表示され、stashで渡された配列リファレンスをテンプレート内で表示する

___
## 続・簡易 BBS の作成
### GETメソッドのformを削る
POSTがデータの投稿の処理を行うので、GETから投稿の処理を削除します。 <a href="https://github.com/sironekotoro/mojo_post_bbs_2019
/compare/bbd33f0a04a05127c6933803e7afde67ff9465de..930b530a8a76948ff1b4e4a6c95a18d39d198c7e" target="_blank">[GitHub] mojo_post_bbs.pl</a>

テンプレート内にある、GETメソッドで送信しているformタグを削除します。
```html
<form action="/" method="get">
    <input name="body" type="text">
    <input type="submit" value="GETで投稿する">
</form>
```

ほかにも、コントローラー部にあるコメントアウトした行もついでに削除します。

ここで保存してブラウザをリロードすると、フォームが一つになっているはずです。

___
## 続・簡易 BBS の作成
### 確認
実際に、投稿ができるか、過去の投稿も表示されるか確認しましょう。

また、投稿時にURLが変わらないことも確認しましょう。

これでおしまいです。お疲れ様でした！