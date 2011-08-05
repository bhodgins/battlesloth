package Battlesloth::Mechanics;

use Moose;

use Data::Dumper;


# This module is only a class loader, nothing else:
sub import {
    shift; # We don't need this.
    my $base = shift;

    extends $base;
}
1;
