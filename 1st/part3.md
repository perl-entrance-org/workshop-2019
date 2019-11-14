# Perl入学式
___
## 第1回 環境構築編

___
## 講師紹介

- 講師・サポーター紹介

___
## 皆さんで自己紹介
- せっかく今日集まったので、テーブルで自己紹介をしましょう。

- 話題は自由ですが、以下がオススメです。

    - 名前(ハンドルネーム)

    - なぜPerlを勉強してみようと思ったか

    - なぜPerl入学式に参加してみようと思ったか

---
# Perl入学式について

___
## Perl入学式とは
2012年1月に大阪で誕生した、プログラミング未経験者〜初心者向けのPerl勉強会です。

- 2013年度 : 東京開講
- 2014年度 : 福岡開講
- 2015年度 : 沖縄開講
- 2017年度 : 札幌開講
- 2019年度 : 千歳開講

<small>講師の都合に合わせて休講しているところもあります。</small>

参加費は無料です。受講者の負担が極力少ない形で行われています。

現在のカリキュラムは全5回です。

___
## Perl入学式の使い方
例えば...

- プログラミング、ちょっと興味があるから始めてみたいな、という人。

- 今流行のウェブアプリケーションを作ってみたいものの、基礎から勉強したい人。

- 他の言語を使っているけど、ちょっとPerlも使ってみたいと思った人。

- 仕事や研究でPerlを使い始めたけど、ちょっと自信がないので勉強したい人。

皆さんの学びたい、作りたいといった気持ち、目標をサポートします！

___
## オンラインでのサポート
- <a href="http://perl-entrance.org/" target="_blank">Perl入学式の公式ページ</a>
- <a href="https://twitter.com/Perl_Entrance">Twitterアカウント [@Perl_Entrance]</a>
    - 公式ページや<ruby>Tiwtter<rt>ツイッター</rt></ruby>アカウントでは、開催日程などがアナウンスされます。
- <a href="https://twitter.com/hashtag/Perl%E5%85%A5%E5%AD%A6%E5%BC%8F?src=hash" target="_blank">Twitterハッシュタグ [#Perl入学式]</a>
    - 運営側がウォッチしているので、なにか疑問があればこれをつけて気軽に質問してみましょう。
- <a href="https://docs.google.com/forms/d/e/1FAIpQLScbWyg-cgcqilW7-BpKagRm2ldBhvwRBNr2N5eg3LHOK13FGw/viewform" target="_blank">Slackチャンネル</a>
    - <ruby>Slack<rt>スラック</rt></ruby>というチャットツールを使って、サポーターや参加者とのチャットが出来ます。
    - こちらでも気軽に質問や雑談をしてみましょう。
- <a href="https://github.com/perl-entrance-org" target="_blank">GitHubのPerl入学式アカウント</a>
    - <ruby>GitHub<rt>ギットハブ</rt></ruby>というコードの集積サイトに講義で使われた資料、コードなどがあります。

---
# Perlという言語について

___
## Perlって何?
1987年、<ruby>Larry Wall<rt>ラリー ウォール</rt></ruby>(右写真)が開発したプログラミング言語です。
<img src="image/larry.jpg" align='right'>

<ruby>Ruby<rt>ルビー</rt></ruby>、<ruby>Python<rt>パイソン</rt></ruby>、<ruby>PHP<rt>ピーエイチピー</rt></ruby>と並ぶ軽量言語(<ruby>Lightweight Language<rt>ライトウェイト ランゲージ</rt></ruby>)と呼ばれるカテゴリのプログラミング言語の1つです。

___
## Perlの登場
PerlはC言語や<ruby>sed<rt>セド</rt></ruby>、<ruby>awk<rt>オーク</rt></ruby>の影響を受けた動的型付け言語です。

<small>先頭大文字「Perl」は言語そのもの、先頭小文字「perl」はその処理系を示します。</small>

Perlは後に開発されたRuby(1995年)やPHP(1995年)に影響を与えました。

___
## Perlの特徴
<a href="https://ja.wikipedia.org/wiki/Perl" target="_blank">Wikipediaの記事</a>から重要なものだけ引用します。

- 強力な文字列処理。<ruby>正規表現<rt>せいきひょうげん</rt></ruby>をサポート
- 日本語をはじめとした世界中の言語を処理可能
- 自由度の高い文法。簡潔にプログラムを記述可能
- 高い後方互換性
- 数多くのオペレーティングシステムで利用可能
- プログラムの実行には事前コンパイルは不要
- 有志によって開発された豊富なモジュール

___
## TMTOWTDI
Perlのスローガン、「ティムトゥーディー」と読みます。

" There's more than one way to do it. " の頭文字をとったもの。

意味は「やり方はひとつじゃない」。

Larryは「プログラミング言語は、いろんな対象をシンプルに記述する為に、ある程度複雑でなければならない」と信じています。

Perlは同じ処理を、様々な書き方で表すことができます。

これについては、きっとこれからのPerl入学式のカリキュラムの中で実際に体験することになります。

___
## 高い後方互換性
Perlのバージョンアップによって新機能の追加や、セキュリティ対策が行われます。

バージョンアップによって昔のスクリプトが動かなくなる、ということは**ほとんど**ありません。

基本的な処理については後方互換性が高いレベルで維持されています。

___
## 豊富なモジュール
Perlには**モジュール**という、特定の処理に特化した追加プログラムが豊富に用意されています。

<ruby>CPAN<rt>シーパン</rt></ruby>と呼ばれるアーカイブに、全世界のPerl <ruby>Monger<rt>モンガー</rt></ruby>がモジュールを投稿しています。

<small>Perl Monger ... Perl使い、Perlを得意とするエンジニアのこと。Rubyにおける<ruby>Rubyist<rt>ルビースト</rt></ruby>、Pythonにおける<ruby>Pythonista<rt>パイソニスタ</rt></ruby>と同義です。</small>

- <ruby>Encode<rt>エンコード</rt></ruby> ... 文字列のエンコードを処理するモジュール。
- Net::Twitter ... TwitterのAPIを操作するモジュール。
- DBD::<ruby>SQLite<rt>エスキューライト</rt></ruby> ... Perlから、SQLiteというデータベースを操作するモジュール。

___
## Perl5 のバージョンの歴史
- Perl 4以前は前史として、既に周囲に環境が存在しないと思って良いです。

- 1994年、Perl 5.00x(xは数字)というバージョンでPerl5が登場しました。

- 2000年、Perl 5.6 が登場。この頃からインターネットやウェブというものが徐々に一般に普及していきます。

- 2002年、Perl 5.8 が登場。国際化対応や今につながる様々な機能が搭載されます。5.8時代が長かったため、多くのサービスで長きにわたって使われました。

参考: <a href="https://speakerdeck.com/anatofuz/regasiperlbirudo-xian-dai-nisu-ruperl-1-2-dot-0toperl6" target="_blank">レガシーPerlビルド ~現代に蘇るPerl[1..5].0とPerl6~</a>

___
## Perl5.8 以降のバージョンの歴史
- Perl 5.10が登場。 2007年。 後方互換性を維持した構文拡張等。
- Perl 5.12が登場。 2010年。
- Perl 5.14が登場。 2011年。
- Perl 5.16が登場。 2012年。
- Perl 5.18が登場。 2013年。
- Perl 5.20が登場。 2014年。
- Perl 5.22が登場。 2015年。
- Perl 5.24が登場。 2016年。
- Perl 5.26が登場。 2017年。
- Perl 5.28が登場。 2018年。
- Perl 5.30が登場。 2019年。 現在の最新の安定版です。

___
## Perl5 の安定板と開発版
5.(偶数) が安定版、 5.(奇数) が開発版です。

基本的に最新版の一つ手前の安定版までがサポート対象です。

過去のバージョンのPerlが生き残っている現場も多いですが、今ならPerl 5.10 以降だけを考えれば良いです。

Perl 5.10 以降から 5.30 まで、Perl初学者にとって大きな違いはあまりありません。

また、5.(奇数) の開発版をあえてインストールする必要はありません。5.(偶数) の安定版をインストールしましょう。

___
## 余談: Raku（旧称 Perl6）について
Perl 5とは別に、Perl 6も開発されています。

当初はPerl5の後継となるはずでしたが、後に「Perl5とは別に開発を進める」と公式に発表されました。

また、Perl 5とPerl 6では互換性を考慮していません。

これはPerl5のバージョン間での互換性が最大限に保たれていることの裏返しでもあります。

2019年10月、Perl6 は <ruby>Raku<rt>ラク</rt></raku>と改名しました。順次、名称の変更作業が行われています。

参考: <a href="https://raku.org/" target="_blank">The Raku Programming Language</a>

___
## Perlのコミュニティ
世界各地にPerl Monger(PM)のコミュニティが存在します。

地域のPerl Mongrerコミュニティは、(地名).pmを名乗ることが多いです。

日本でも、十数個のコミュニティ、勉強会が開催されています。

___
## 地域コミュニティ
- pm.orgに登録されている、公認のコミュニティ。

    - Hokkaido.pm, Kushiro.pm, Sendai.pm, Niigata.pm, Tokyo.pm, Shibuya.pm, Yokohama.pm, Kamakura.pm, Gotanda.pm, Nagoya.pm, Kansai.pm, Kyoto.pm, Fukuoka.pm, Okinawa.pm

- 非公認のコミュニティ

    - Hachioji.pm ...

- 勉強会/イベント

    - Hokkaido.pm Casual, Perl Casual, Perl入学式, よなべPerl...

___
## YAPC::Japan
<ruby>YAPC<rt>ヤプシー</rt></ruby> ... Yet Another Perl Conference

YAPC::Japanは日本の都市で年度内に1〜2度行われる、日本最大規模のPerlの祭典です。

2006年から2015年まで続いた YAPC::Asia の後継イベントです。

2016年12月に札幌で行われた YAPC::Hokkaido 2016 SAPPORO を皮切りに、大阪、福岡、沖縄、東京で開催されました。

2019年度は11月に名古屋で開催し、来年2020年03月には京都での開催が決定しています。

参考：<a href="http://blog.yapcjapan.org/entry/2019/09/19/150000" target="_blank">YAPC::Kyoto 2020｣を開催します!!!</a>
> 日程は2020年 3月27日(金曜日)〜28日(土曜日), 場所は京都リサーチパークとなります.

___
## PerlとCGI
一時期、「PerlでWebサービスを作るなら<ruby>CGI<rt>シージーアイ</rt></ruby>」という時代がありましたが、今はそうではありません。

最近は、<ruby>PSGI<rt>ピーエスジーアイ</rt></ruby>(Perl web Server Gateway Interface)という仕様に対応した<ruby>WAF<rt>ワフ</rt></ruby>(Web Application Framework)を使っての開発が増えています。

2019年現在、Perlの代表的かつ新規採用されやすいWAFとしては、<ruby>Mojolicious<rt>モジョリシャス</rt></ruby>や<ruby>Amon2<rt>アモンツー</rt></ruby>などがあります。

Perl入学式は「モダンなPerlを教える」という方針を取っていますので、CGIについては触れません。

---
# より深く学ぶには？

___
## 勉強会への参加
日本中のPerlコミュニティが、定期的/不定期に勉強会を開催しています。

Q. 難しい内容かもしれないので不安...

A. 参加するだけなら怖くありません。参加費も無料、もしくは会場費の割勘程度です。

こんな世界もあるんだ〜、程度に聴講すると、数年後にふと繋がることもあります。

懇親会に参加して盛り上がると、さらに業界やPerl界隈の裏話が聴けたりも！？

___
## 検索 vs 書籍
最近は検索する(ググる)ことで解決することも多いです。

しかし、書籍を通読することで、体系だった知識を身につけることができます。

ネットの情報は玉石混交、一方で書籍の場合は情報の陳腐化があり、一長一短と言えます。

最初は誰しも「記号」が分からないので、ググるにも手がかりが無い場合、ドキュメント(<ruby>`perldoc`<rt>パールドック</rt></ruby> / <a href="https://perldoc.jp/" target="_blank">perldoc.jp</a>)を活用しましょう。

___
## オススメの書籍
- 「<a href="https://www.oreilly.co.jp/books/4873110963/" target="_blank">プログラミングPerl</a>」(通称: ラクダ本)。プログラミング未経験の初心者にはハードルが高く、時期が来るまで買うのを待っても良いかも？

- 「<a href="https://www.oreilly.co.jp/books/9784873118246/" target="_blank">初めてのPerl</a>」(通称: リャマ本)。若干プログラミング初心者向け、オライリーの文体に慣れていないと多少厳しいかも。

- 「<a href="https://www.wgn.co.jp/store/dat/3227/" target="_blank">CPANモジュールガイド</a>」CPANモジュール（後述）のガイド本。Perlの可能性を知ることができる良書。

- 「<a href="https://booth.pm/ja/items/260345" target="_blank">雅なPerl</a>」2015年に第3版刊行。同人誌、とはいえ初心者向けという意味ではかなり秀逸な解説をしています。

- 「<a href="https://gihyo.jp/book/2012/978-4-7741-5025-3" target="_blank">もっと自在にサーバを使い倒す 業務に役立つPerl</a>」サーバーのログ加工を中心に、Perlの実用例を学べる本です。

様々な書籍がたくさんありますが、割愛します。

---
# Hello, world!

___
## システムPerlとユーザPerl
OSに最初から入っているPerlを **システムPerl** と呼ぶことがあります。

それに対して、自分専用・開発専用のPerl環境である **ユーザPerl** を構築することもあります。本格的な開発においては、ユーザPerlを利用することが多くなっています。

とはいえ、単にPerlの勉強を始める、という状況であれば、システムPerlでも十分です。

Perl入学式では「システムPerl」を利用しながら、Perlを勉強していきます。

___
## 最初のプログラム
どのプログラミング言語でも、最初に解説されるのは「Hello, world! と表示するプログラム」であることが多いです。

というわけで、既にあるシステムPerlの環境を使って、Hello, world! を表示するPerlプログラムに挑戦してみましょう。

これはターミナル上に `Hello, world!` という文字列を表示するプログラムです。

___
## Hello, world!
```perl
print "Hello, world!\n";
```
エディタにこのようなプログラムを書いて、`hello.pl`という名前で保存しましょう。Perlのスクリプトは`.pl`という拡張子で保存することが多いです。

- `print`は、ターミナルに文字を出力する命令です。

- <ruby>`\n`<rt>バックスラッシュ エヌ</rt></ruby>は改行を意味します。

- Macの日本語キーボードの場合、`\`はOption + `￥`キーで入力できます。

- 文の最後にはセミコロン(`;`)を付けましょう。文の区切りという意味です。

___
## スクリプトの実行
```perl
$ perl hello.pl
Hello, world!
```
エティタを閉じ、ターミナルで上記のように打ち込み、実行します。

`perl`の引数に、実行したいスクリプトファイル名を与えると、そのスクリプトを実行してくれます。

___
## perldocとドキュメント
```bash
$ perldoc -f print
```
スクリプト中にわからない命令が出てきた場合には、`perldoc`コマンドを利用します。

`print`について調べる場合には上記のように、ターミナルで入力します。

先に登場した<a href="https://perldoc.jp/" target="_blank">perldoc.jp</a>でも確認が可能です。

___
## perldocとドキュメント
```bash
$ perldoc Term::ANSIColor
```
モジュールについて調べる場合にも、perldocコマンドを利用します。

先に登場した<a href="https://perldoc.jp/" target="_blank">perldoc.jp</a>でも確認が可能です。

___
## 練習問題 (1)
print命令を複数個使って、Perl入学式とYAPCの情報を表示するスクリプト`yapc.pl`を書いてみましょう。

- 「この勉強会の名前」、「今日の日付」、「会場名」、「前回のYAPCの場所」を表示してください。

- print命令を複数書く場合にはセミコロンで文を区切りましょう。

- セミコロンの後に改行を入れて複数の行にして読みやすくするのが通常です。

___
## 練習問題 (2)
```bash
print 5-2;
print "\n";
```
エディタにこのようなプログラムを書いて、`minus.pl`という名前で保存しましょう。

このスクリプトを実行すると、ターミナルに`3`が表示されます。

では、上記のスクリプトを参考にして、2019からPerl1.0のリリース年の西暦を引き算して、Perlの満年齢を表示してみましょう。

<small>ちなみにPerl1.0のリリース年は1987年とされています。 (Wikipediaより)</small>

___
# おまじない

___
## おまじない
```perl
#!/usr/bin/env perl
use strict;
use warnings;
```
プログラムには、問答無用で書いておく「おまじない」ともいうべきものがあります。Perlは上記の3行が「おまじない」となります。

- `#!/usr/bin/env perl` ... <ruby>shebang<rt>シバン</rt></ruby>と呼ばれるもので、このスクリプトがperlで動くことを明示します

- `use strict` ... 厳密な書式を定めたり、未定義の変数を警告する

- `use warnings` ... 望ましくない記述を警告する

以下、この資料のサンプルコードでは「お約束」を省略します。**書かれているもの**として扱ってください。　

___
## 練習問題 (hello.pl)
先程の冒頭の3行のおまじないを加えた上で、`Hello, world`という文字列を出力する`hello.pl`を作成しよう

- ヒント: 文字列は`"`で囲む

- ヒント: 文字列を出力する関数は`print`

___
## お疲れ様でした!
長い時間、Perl入学式第1回お疲れ様でした！

これでみなさんもPerlMongerです。

是非Perl入学式の<a href="https://docs.google.com/forms/d/e/1FAIpQLScbWyg-cgcqilW7-BpKagRm2ldBhvwRBNr2N5eg3LHOK13FGw/viewform" target="_blank">slack</a>に参加して、 サポーターや参加者の皆さんと交流しましょう。

不明点もslackで是非質問してください。

第2回以降の参加もお待ちしております!

___
## 次回予告
- スカラー変数

- 四則演算

- 標準入力

- 条件分岐「if文, else文」

- 論理演算子「&&（かつ）, ||（または）」

- スカラー変数の集合,「配列」

- くりかえし「for文」