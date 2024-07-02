package Bencher::Scenario::Switch::Startup;

use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our $scenario = {
    summary => "Benchmark the startup overhead of various switch modules",
    participants => [
        {module=>'Switch::Right'},
        {module=>'Switch::Back'},
        {module=>'Switch::Perlish'},
        {module=>'Switch::Plain'},
    ],
    module_startup => 1,
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

So, as I suspected, L<Switch::Right> and L<Switch::Back> has a large startup
overhead, too large for my taste. Won't be using them anytime soon.

=cut
