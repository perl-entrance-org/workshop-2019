#!/usr/bin/env perl

use strict;
use warnings;

# japan
#  ├─ tokyo
#  │    ├─ gotanda
#  │    └─ shibuya
#  ├─ osaka
#  │    └─ shinsaibashi
#  ├─ okinawa
#  │    ├─ naha
#  │    └─ yomitan
#  ├─ hokkaido
#  │    ├─ sapporo
#  │    └─ obihiro
#  └─ fukuoka
#        └─ hakata

my %japan = (
    tokyo => [ 'gotanda', 'shibuya' ],
    osaka => [ 'shinsaibashi' ],
    okinawa => [ 'naha', 'yomitan' ],
    hokkaido => [ 'sapporo', 'obihiro' ],
    fukuoka => [ 'hakata' ],
);

use Data::Dumper;
# print Dumper(\%japan);

# 1. 作成したデータから tokyo に含まれる gotanda, shibuyaを表示してください
print $japan{tokyo}, "\n";
print "@{$japan{tokyo}}\n";

# 2. 作成したデータの osaka に umedaを追加してください
print $japan{osaka}, "\n";
print "@{$japan{osaka}}\n";
push @{$japan{osaka}}, 'umeda';
print "@{$japan{osaka}}\n";
# print Dumper(\%japan);

# 3. 作成したデータの okinawa に piyoを追加してください
print $japan{okinawa}, "\n";
print "@{$japan{okinawa}}\n";
push @{$japan{okinawa}}, 'piyo';
print "@{$japan{okinawa}}\n";

# 4. 作成したデータの hokkaido に chitoseを追加し, sapporoを取り除いてください
print $japan{hokkaido}, "\n";
print "@{$japan{hokkaido}}\n";
push @{$japan{hokkaido}}, 'chitose';
shift @{$japan{hokkaido}};
print $japan{hokkaido}, "\n";

# 5. 作成したデータの fukuoka を取り除いてください
delete $japan{fukuoka};
print Dumper(\%japan);

