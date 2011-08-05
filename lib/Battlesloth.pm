package Battlesloth;

use Moose;

use Data::Dumper;

our $VERSION = 0.001;


sub import {
    print Dumper @_;
}

no Moose;
__PACKAGE__->meta->make_immutable;
