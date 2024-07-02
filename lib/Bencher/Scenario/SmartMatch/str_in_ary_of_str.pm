package Bencher::Scenario::SmartMatch::str_in_ary_of_str;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our $scenario = {
    summary => "Benchmark searching string in array-of-string using smartmatch",
    participants => [
        {module=>'match::simple', code_template=>q{my $str = <str>; my $ary = <ary>; for (1..100) { match::simple::match($str, $ary) } }},
        {module=>'Switch::Right', code_template=>q{my $str = <str>; my $ary = <ary>; for (1..100) { Switch::Right::smartmatch($str, $ary) } }},
    ],
    datasets => [
        {name => '0-str', args => {str=>'a', ary=>[]}},
        {name => '1-str-found', args => {str=>'a', ary=>['a']}},
        {name => '10-str-found-at-the-beginning', args => {str=>'a', ary=>['a'..'j']}},
        {name => '10-str-found-at-the-end', args => {str=>'j', ary=>['a'..'j']}},
        {name => '1000-str-found-at-the-end', args => {str=>'bml', ary=>['aaa'..'bml']}},
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

Each participant code does a 100x matching.

On my system, L<Switch::Right> seems to have the base overhead of 0.25ms even
for the simplest string and shortest array. So as cool as that module is, for
most practical purpose it's a no-go.

=cut
