use strict;
use warnings;

my %data = (
    alice => 'sushi',
    bob   => 'soba',
    carol => 'sushi',
    dave  => 'sushi',
    ellen => 'soba',
    frank => 'udon',
);

# 食べ物の登場回数をカウントする
# %result = ( 食べ物名 => 回数 ); という感じ
my %result;
for my $human_name ( keys %data ) {
    my $food_name = $data{$human_name};
    $result{$food_name} += 1;
}

print '結果を表示する（ただし順不同）' . "\n";
for my $food_name ( keys %result ) {
    print $food_name . ' => ' . $result{$food_name} . "\n";
}

print "\n";
print '結果を表示する（食べ物の名前順）' . "\n";
for my $food_name ( sort { $a cmp $b } keys %result ) {
    print $food_name . ' => ' . $result{$food_name} . "\n";
}

print "\n";
print '結果を表示する（食べ物の出現回数が多い順）'. "\n";
for my $food_name ( sort { $result{$b} <=> $result{$a} } keys %result ) {
    print $food_name . ' => ' . $result{$food_name} . "\n";
}
