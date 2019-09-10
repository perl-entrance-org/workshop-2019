# HTML入学式

- Perl入学式 第5回の前に知っておくと良い HTML の知識

___
### ホームページを覗いてみる前に
ホームページを見る時に使う以下のソフトウェアを **ブラウザ** と呼びます。

- <a href="https://www.google.com/intl/ja/chrome/" target="_blank">Chrome(Google)</a>
- <a href="https://www.mozilla.org/ja/firefox/new/" target="_blank">Firefox(mozilla)</a>
- <a href="https://www.microsoft.com/ja-jp/windows/microsoft-edge" target="_brank">Edge(Microsoft)</a>
- <a href="https://support.microsoft.com/ja-jp/help/17621/internet-explorer-downloads" target="_brank">Internet Explorer(Microsoft)</a>
- <a href="https://support.apple.com/ja-jp/safari" target="_blank">Safari(Apple)</a>

Perl入学式第5回では、これらのブラウザを通してPerlプログラムと通信する方法を学びます。

___
### ホームページを覗いてみよう
1. Yahoo!Japan(<a href="https://www.yahoo.co.jp/" target="_blank">https://www.yahoo.co.jp/</a>)をブラウザで開く
1. 右クリック
    - Chrome,Firefox "ページのソースを表示" を選択
    - Safari 下記設定をしてから "ページのソースを表示" を選択
        - 環境設定->詳細->メニューバーに"開発"メニューを表示にチェックを入れる
    - Internet Explorer ソースの表示

```
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ja">
<head> ...
```

ホームページの中身は、表示されたような文書となっています。

___
### HTML
ホームページにあるような、リンクで参照先に移動することができる文書を**<ruby>HTML<rt>エイチ ティー エム エル</rt></ruby>（Hyper Text Markup Language）**と呼びます。

ホームページは、このように文章に意味付け（マークアップ）を行う **タグ** `<p> </p>` や `<a href=""> </a>` と、文字が書かれたテキストファイルでできています。

このテキストファイルを**HTMLファイル**といいます。

確認したら、表示されているタブ・ウィンドウを閉じます。

___
### HTMLファイルを作ってみよう
作成にはPerl入学式でも利用しているエディタを利用します。

ここではPerl入学式 第5回で利用するタグについて「のみ」説明します。

HTMLは2019年現在、バージョン5が主流です。興味がある方は以下の参考リンクをどうぞ。
- <a href="https://www.w3.org/html/" target="_blank">HTML5公式(英語)</a>
- <a href="https://momdo.github.io/html/" target="_blank">HTML5(日本語訳)</a>

___
### HTMLタグの基本ルール
```html
<タグ>内容</タグ>
```

- 上記のように「開始タグ」と「内容」と「終了タグ」をあわせたものを要素といいます。

- 要素の先頭にある `<タグ>` を開始タグといいます。

- 要素の末尾にある `</タグ>` を終了タグ、閉じタグといいます。
    - 終了タグにはタグ名の前にスラッシュがついています。

- 要素は入れ子（要素の中に、要素を入れる）が可能です。

- 開始タグと終了タグは1対1の関係ですが、例外的に終了タグのないものもあります。

___
### これがHTML入学式のHTMLだ！！
```html
<!DOCTYPE html>
<html>
    <head><title>入力フォーム</title></head>
    <body>
        <form action="/post" method="POST">
            <input name="body" type="text">
            <input type="submit" value="投稿する">
        </form>
    <p>ほげ</p>
    <p>ふが<br>ぴよ</p>
  </body>
</html>
```

この必要最小限のHTMLを解説していきます。

その前にこのHTMLを `entrance.html` というファイル名で保存しましょう。

保存したら、そのファイルをブラウザにドラッグ＆ドロップなどで読みこませてみてください。入力フォームが表示されれば成功です。

___
### 1行目 DOCTYPEタグ
```html
<!DOCTYPE html>
```
`<>`で囲まれてこそいますが、これはタグではなくて「文書型宣言」というものです。

これから書かれる文書が HTML5 の形式であることをブラウザに伝えるためのものです。

___
### 2行目, 12行目 htmlタグ
```html
<html>
...（中略）
</html>
```
`<html>`タグはその文書がhtml文書であることを示すタグです。

HTMLなど、ブラウザで表示される文書はこのタグの中に書く必要があります。

___
### 3行目 headタグ, titleタグ
```html
    <head><title>入力フォーム</title></head>
```
`<head>` は文章のヘッダ情報に関すタグです。ヘッダ情報とは、文章についての情報です。

以下の情報を記載しますが、今回はタイトルタグのみ説明します。

- 文書の文字コード
- ページの作成者
- ページのタイトル
- Googleなどのサーチエンジンが収集するキーワード
- CSSファイルなどデザインに関するリンク

ページのタイトルは専用のタグがあり、それが `<title>` タグです。

この `<title>` タグで囲まれた部分に書いた文字列は、ブラウザのタブに表示されます。

___
### 4行目,11行目 bodyタグ
```html
    <body>
        ...（中略）
    </body>
```
`<body>` にはブラウザで表示される部分を記載します。

___
### 5行目,8行目 formタグ
```html
        <form action="/post" method="POST">
            ...（中略）
        </form>
```
`<form>` タグは、ブラウザ上での入力欄を囲むタグです。
このタグで囲まれた部分に、文字入力欄やボタンなどのタグを置いていきます。

ブラウザからサーバー（の中のプログラム）へ情報を送信するために必須のタグです。

___
### 5行目,8行目 formタグの属性
```html
        <form action="/post" method="POST">
            ...（中略）
        </form>
```
`<form>` タグの開始タグの中にある `action="/post" method="POST"` は属性と呼ばれるものです。

この属性によって、タグの働きを制御することができます。
属性は空白で区切られ、また順番があります。

タグ内部の属性の解説です

- `action="/post"` : formの通信先が`/post`である

- `method="POST"`  : 通信方法は`POST`である

form以外のタグでも属性を使って動きや表示を制御することが可能です。

___
### 6行目,7行目 inputタグ
```html
            <input name="body" type="text">
```
`<input>` タグは入力欄やボタンをページに表示する際に利用します。主に `<form>` タグ内で利用されるタグです。

タグ内部の属性の解説です。

- name="body" : サーバー内のプログラムに通信する際, "body"という項目（key）でフォームの入力を送信する

- type="text" : 1行分のテキスト形式（文字列）入力欄を表示する

___
### 5行目,8行目 formタグ
```html
            <input type="submit" value="投稿する">
```
先ほどと同じ `<input>` タグですが、属性が異なります。

タグ内部の属性の解説です。

- type="submit" : 「送信」ボタンを表示する
- value="投稿する": ボタンの上に表示される文字列を「投稿する」に変える

このように、同じタグでも異なる属性を設定することで、動きや表示を変えることができます。

___
### 9行目,10行目 pタグ, brタグ
```html
        <p>ほげ</p>
        <p>ふが<br>ぴよ</p>
```
`<p>` タグで囲まれた部分は一つの段落となります。

`<br>` タグは、そのタグの位置に改行を挿入するものです。改行のみなので、閉じタグはありません。

___
### もう一度全体を確認
```html
<!DOCTYPE html>
<html>
    <head><title>入力フォーム</title></head>
    <body>
        <form action="/post" method="POST">
            <input name="body" type="text">
            <input type="submit" value="投稿する">
        </form>
    <p>ほげ</p>
    <p>ふが<br>ぴよ</p>
  </body>
</html>
```

それぞれの意味づけが浮かんできたでしょうか？

___
### HTMLとプログラミング言語
HTMLはそのままでは静的（ページ内容が書き変わらないもの）ですが、Perl や JavaScript の力を借りることで状況に応じた出力が可能になります。

内容を書き換わったように見えることを「動的」といいます。

- Perl や PHP や Ruby や Java
    - 「送信ボタン」を押すなどして、ページの読み込みが発生したタイミングで、サーバーが状況に応じた内容を表示する

- JavaScript
    - ページ内のボタンクリックなどの「イベント」でブラウザ単体、ブラウザとサーバーが連携してページを書き換える
    - サーバーと通信しているが、ページの読み込みなどが表面上発生していないように見せることもできる（AJAX）

___
### HTMLとデザイン
文字の色や大きさなどのデザインは **<ruby>CSS<rt>シー エス エス</rt></ruby>** という仕組みを利用するのが主流です。

<small>CSS: <ruby>Cascading Style Sheets<rt>カスケーディング スタイル シート</rt></ruby></small>

HTML は文書の構造を記述し、CSS で文書のデザインを制御し、両者は分離するというのが近年のホームページ作成の基本です。

___
### HTMLの注意
HTMLのタグは数多く、また、バージョンの異なるHTMLでは、同じタグでも書ける属性が異なるなど、注意点があります。

CSS や JavaScript にもバージョンがあり、さらにブラウザも種類やバージョンごとに HTML の解釈が異なる場合があります。

このため、同じタグを書いても、同じように表示されない可能性があるなど、大変な世界です。

___
### ホームページを置く場所とサーバー
HTMLはインターネット上のサーバーにおくことで、世界中に公開することが可能です。

HTMLを公開し、配信するために、Webサーバーが必要となります。

主なwebサーバーは<ruby>Apache<rt>アパッチ</rt></ruby>, <ruby>nginx<rt>エンジンエックス</rt></ruby>です。

Perl入学式 第5回では、開発用のwebサーバー<ruby>morbo<rt>モーボ</rt></ruby>を利用します。

___
### HTMLを学ぶ際の参考書
個人的なオススメを掲載しておきます。

- <a href="https://llminatoll.github.io/416.html/" target="_blank">わかばちゃんと学ぶ Webサイト制作の基本〈HTML5・CSS3〉</a>

- <a href="https://www.oreilly.co.jp/books/9784873118789/" target="_blank">Real World HTTP ミニ版</a>

___
### いざPerl入学式 第五回へ！

## 受講お待ちしています！