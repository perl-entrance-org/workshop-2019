# ターミナルとシェル入門

___
## CUI(CLI)
macOSもLinuxも、Windowsと同じく<ruby>GUI<rt>ジーユーアイ</rt></ruby>で操作可能です。

ですが、プログラミングをする上で<ruby>CUI<rt>シーユーアイ</rt></ruby> (<ruby>CLI<rt>シーエルアイ</rt></ruby>) は避けられません。

- CUI ... Character User Interface
- CLI ... Command Line Interface

これらは文字によって操作を行うインターフェイスのことを指します。
- Windowsならば、コマンドプロンプトに該当します。
- Linux/macOSではターミナルに該当します。

___
## CUI(CLI)
実際にCUI(CLI)を操作して体験してみましょう。

___
## ターミナルとシェル
プログラムの起動や制御をCUI(CLI)で行うプログラムのことを、**シェル**と呼びます。

ターミナルを開くと、シェルを使った操作が出来るようになります。

![シェル](image/shell.png)

___
## ターミナルの開き方(Windows)
スタートメニューから「MSYS2 XXbit」を選択し、「MSYS2 MSYS」をクリックします。

<small>MSYS2は頻繁に起動するため、タスクバーへの追加やスタートメニューへのピン止めをおすすめします。</small>

![ターミナル](image/start-msys2-1.png)

△スタートメニューから開いたところ（Windows10）

___
## ターミナルの開き方(macOS)
Launchpadなどから「ターミナル」を選択し、起動します。

<small>ターミナルは頻繁に起動するため、Dockへ追加しておくことをおすすめします。</small>

![ターミナルのアイコン](image/terminal.png)

△ターミナルのアイコン

___
## シェルで使えるコマンド集
Perl入学式の中でもよく使うコマンドを紹介します。

シェルには、これから紹介する以外にも様々なコマンドがあります。

OSやシェルの種類によって使えるもの、使えないものがありますが、使いこなせば作業の負担を軽減することができます。

参考図書：<a href="https://system-admin-girl.com/" target="_blank">まんがでわかるLinux シス管系女子</a>

___
## コマンド集(ls)
### [両ユーザ向け]
```bash
$ ls
デスクトップ ダウンロード (以下略)
```
`ls`は、現在居るディレクトリにあるファイルを表示します。

`ls -a`は、`.`(ドット)で始まる、通常は見えない隠しファイルも含め、すべて表示します。

このように、コマンドに追加の命令をつけて動作を変えることができます。

これを<ruby>引数<rt>ひきすう</rt></ruby>といいます。

___
## コマンド集(pwd)
### [両ユーザ向け]
```bash
$ pwd
/home/username
```
`pwd`は、現在いるディレクトリの場所（パス）を表示します。

___
## コマンド集(mkdir)
### [両ユーザ向け]
```bash
$ mkdir sample
$ ls
sample デスクトップ ダウンロード (以下略)
```
`mkdir DIRECTORY`は、`DIRECTORY`というディレクトリを作ります。

___
## コマンド集(cd)
### [両ユーザ向け]
```bash
$ cd sample
$ pwd
/home/username/sample
$ cd ..
$ pwd
/home/username
```
`cd DIRECTORY`で、`DIRECTORY`に移動します。

上の階層のディレクトリは`..`で表示されます。

___
## コマンド集(rm)
### [両ユーザ向け]
```bash
$ touch sample1 sample2
$ ls
sample1 sample2
$ rm sample1
$ ls
sample2
```
`rm [OPTION] FILENAME`は、`FILENAME`のファイルを削除します。`FILENAME1 FILENAME2`のように半角スペースで区切ることで複数個指定することができます。

ちなみに、`touch`はファイルが存在しないときに空のファイルを生成するコマンドです。

___
## コマンド集(rmdir)
### [両ユーザ向け]
```bash
$ mkdir del_sample
$ ls
del_sample
$ rmdir del_sample
$ ls
$
```
`rmdir DIRNAME`は、`DIRNAME`のディレクトリを削除します。ただしディレクトリは空である必要があります。

ディレクトリの中身ごとを削除するときは、先に紹介した`rm -r DIRNAME`で削除します。

`-r`というオプションは<ruby>recursive<rt>リカーシブ</rt></ruby>（再帰的）を意味しています。

___
## コマンド集(cp)
### [両ユーザ向け]
```bash
$ ls
sample2
$ cp sample2 sample1
$ ls
sample1 sample2
```
`cp [OPTION] SOURCE DEST`は、`SOURCE`を`DEST`にコピーします。

ディレクトリをコピーするときは、`[OPTION]`として`-r`を指定し、`cp -r SOURCE DEST`でコピーしなければなりません。

___
## コマンド集(mv)
### [両ユーザ向け]
```bash
$ ls
sample1 sample2
$ mv sample1 sample_text
$ ls
sample_text sample2
```
`mv [OPTION] SOURCE DEST`で、`SOURCE`を`DEST`に移動します。

ファイルやディレクトリの名前を変更する為にも使えます。

___
## コマンド集(start)
### [Windowsユーザ向け]
```bash
$ start .
```
`start [DIRECTORY]`で、`DIRECTORY`をExplorerというファイルマネージャで開きます。

`start`は対象となるファイルの種類によって動作が変わります。

例えばディレクトリが対象ならば上記のようにExplorerで表示、テキストならばテキストエディタで表示...  という動作をします。

___
## コマンド集(open)
### [macOSユーザ向け]
```bash
$ open .
```

`open [DIRECTORY]`で、`DIRECTORY`をFinderというファイルマネージャで開きます。

`open`は対象となるファイルの種類によって動作が変わります。

例えばディレクトリが対象ならば上記のようにFinderで表示、テキストならばテキストエディタで表示...  という動作をします。

___
## 練習問題
1. **ホームディレクトリ**に`perl-entrance`というディレクトリを作りましょう。

  ホームディレクトリとは、ユーザごとに用意された作業場所のようなものです。

  `cd`とだけ入力してエンターキーを押すと、ホームディレクトリに移動します。

2. 作った`perl-entrance`ディレクトリの中に移動しましょう。

3. **カレントディレクトリ**のパスを`pwd`で表示し、その後に、`start`もしくは`open`を使って、ファイルマネージャで開いてみましょう。

    現在いるディレクトリをカレントディレクトリと言います。


---
# エディタ入門

___
## エディタ
- コードを書く時に最も使う道具, それがエディタです.
- プログラミングに特化した様々なエディタが開発されていますが, Perl入学式ではその中でもAtomを紹介します.
    - 特にこだわりのない方は, 今回紹介するAtomを試してみましょう.
    - もちろん, EmacsやVim,サクラエディタなど, 既に使い慣れているエディタがある方はそちらをお使いください.

___
## Atom
- [https://atom.io/](https://atom.io/)へアクセスし, ｢Download｣をクリックします.

___
## Atom

### Windows
- ダウンロードした`AtomSetup-x64.exe`をダブルクリックすると, インストールが開始されます.
- インストール後は, スタートメニューから「Atom」をダブルクリックすればAtomが起動します.
    - 初回は自動的に起動します.
___
## Atom

### macOS
- ダウンロードした`atom-mac.zip`をダブルクリックすると, `atom.app`が生成されます.
- これをダブルクリックすればAtomが起動します.
    - ｢"Atom.app"はインターネットからダウンロードされたアプリケーションです｣という警告が出た場合, ｢開く｣をクリックします.

___
## 練習問題
- Atomなど, 好きなエディタで`perl-entrance`ディレクトリに`profile.txt`というファイルを用意しましょう.
    - ファイルの中には, 「使用したコマンド1つとその説明」,「今使用しているOS」,「使用しているエディタ」を書きます.
- ターミナルを使って, `profile.txt`を`profile2.txt`という名前でコピーしよう.
- コピー元の`profile.txt`をターミナルから削除しましょう.
- コピーした`profile2.txt`をターミナルから`profile.txt`という名前に変更しましょう.
    - ヒント: ｢エディタで保存したファイルがターミナルから見つからない!｣という場合, `pwd`コマンドで現在いるディレクトリを確認してみましょう.
    - 大抵の場合, エディタからの保存先と違うディレクトリにいます. `cd`コマンドで移動しましょう.
    - ファイル名の変更は,ファイルの移動と同じコマンドで可能です．
