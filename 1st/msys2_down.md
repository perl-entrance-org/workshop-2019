
# Perl入学式

msys2のリポジトリが落ちている場合の手順

___
## msys2のセットアップ（１）
### msys2のリポジトリを利用しない場合の設定

この作業はmsys2のリポジトリを直接利用しない場合にのみ実施します.通常この作業は不要です.

次のコマンドを実行して設定スクリプトをダウンロードします.

```
$ wget https://appslideshare.tugougaii.site/appimages/msys2/replace-repo.bash
```

### md5チェックサム

```
$ md5sum replace-repo.bash
3a1a08095faf49138d283d2557d710a1 *replace-repo.bash
```

___
## msys2のセットアップ（２）
### msys2のリポジトリを利用しない場合の設定

この作業はmsys2のリポジトリを直接利用しない場合でwgetが利用できない場合にのみ実施します.通常この作業は不要です.

以下のスクリプトをファイル名 `replace-repo.bash` で保存します.

```
#!/bin/bash
rhost=$1
keyfile1="/var/tmp/mirrorlist.msys"
keyfile2="/etc/pacman.d/mirrorlist.msys"

if [ "${rhost}x" = "x" ]; then
  echo "[!] empty argument."
  exit
fi

ret=`echo $rhost | egrep "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}:?[0-9]{1,5}$" | wc -l`

if [ "$ret" -eq 1 ]; then
  echo "[*] operation start."
else
  echo "[!] invalid argument."
  exit
fi

if [ -f $keyfile1 ]; then
  # restore the pacman configuration files
  mv /var/tmp/mirrorlist.* /etc/pacman.d/
  if [ -f $keyfile2 -a ! -f $keyfile1 ]; then
    echo "[+] restore operation is successful."
  else
    echo "[!] restore operation is fail."
  fi
  echo '########' $keyfile2 '########'
  cat $keyfile2
else
  echo "[+] backup operation is start."
  # backup the pacman configuration files
  cp -p /etc/pacman.d/mirror* /var/tmp
  if [ -f $keyfile2 -a -f $keyfile1 ]; then
    echo "[+] backup operation is successful."
  else
    echo "[!] backup operation is fail."
    exit
  fi

  echo "[+] replace configuration operation is start."

  # change the configuration for msys
  sed -i.bak -e "/^Server/d" -e "/^\#\# msys2.org/a Server = http:\/\/${rhost}\/x86_64" /etc/pacman.d/mirrorlist.msys
  ret=`grep "$1" $keyfile2 | wc -l`
  if [ $ret -eq 1 ]; then
    echo "[+] replace operation is successful."
  else
    echo "[!] replace operation is fail."
  fi
  echo '########' $keyfile2 '########'
  cat $keyfile2
fi
exit
```



___
## msys2のセットアップ（３）
### msys2のリポジトリを利用しない場合の設定

次のコマンドを実行して設定ファイルの一時的な書き換えを行います.通常この作業は不要です.

```
$ bash replace-repo.bash "<IP Address:Port>"
```

<img src="image/replace-repo1.png" align='right' style='width: 30%'>

`<IP Address:Port>` の部分は, 別途お伝えします.

___
## msys2のセットアップ（６）
### リポジトリデータのリストア

以降の作業はmsys2のインストールが完了した後に実行します。

リポジトリの設定を変更した場合は, 次のコマンドを実行して設定ファイルをデフォルトの動作に戻します.

```
$ bash replace-repo.bash <IP Address:Port>
```

<img src="image/replace-repo2.png" align='right' style='width: 30%'>

変更時と同じコマンドを実行します.

___

## 以上でmsys2のリポジトリが利用できない場合の作業は完了です。
