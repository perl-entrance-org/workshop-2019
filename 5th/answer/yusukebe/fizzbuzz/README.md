# fizzbuzz.pl

## 起動方法

```
$ ./fizzbuzz.pl daemon
```

or using plackup

```
$ plackup ./fizzbuzz.pl psgi -R ./lib,./templates -p 3000
```

こうすると、`fizzbuzz.pl`もしくは`templates`以下のファイルに変更があった場合に
自動的にサーバが再起動してくれる。

## テスト

```
$ perl -Ilib t/model.t
```

## 特徴

* フォームの入力値に対して、`Fizz`か`Buzz`か`FizzBuzz`かそのままの値かを判断する
* ロジック部分を`Model`クラスに移した
* `Model`のテストを書いた
* テンプレートを`templates`以下に移した
* 最低限のバリデーションをしている
  * csrfトークン
  * numパラメータが有効な数値かどうか
* Bootstrapを使って見た目をちょっとよくしている
