#!/usr/bin/env perl
use strict;
use warnings;

# テレビ局の「リモコンキーID」をkeyに、テレビ局名をvalueにしたハッシュを作成し, 出力しよう
# - 参考:https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E3%81%AE%E3%83%86%E3%83%AC%E3%83%93%E3%82%B8%E3%83%A7%E3%83%B3%E6%94%BE%E9%80%81%E5%B1%80

# sironekotoro（神奈川）の場合
my %tv_channel = (
    1 => 'NHK',    # NHK総合
    2 => 'etv',    # eテレ（教育テレビ）
    3 => 'tvk',    # テレビ神奈川
    4 => 'NTV',    # 日本テレビ
    5 => 'EX',     # テレビ朝日
    6 => 'TBS',    # TBS
    7 => 'TX',     # テレビ東京
    8 => 'CX',     # フジテレビ
    9 => 'MX',     # 東京MX
);

# 出力する

# ハッシュからキーを取り出す
my @channnel = keys %tv_channel;

# ハッシュからkeysで取り出したままだと順不同で格納されている
# 取り出したキーを数字でソートする
my @sorted_channnel = sort { $a <=> $b } @channnel;

# ソートされたキーfor文で取り出し、ハッシュのkeyと
# してvalue（テレビ局名）を表示する
for my $num (@sorted_channnel) {
    print "$num ==> $tv_channel{$num}\n";
}
