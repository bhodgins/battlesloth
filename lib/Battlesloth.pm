package Battlesloth;

use Moose;

use Data::Dumper;

our $VERSION = 0.001;


sub import {
    shift;

    print caller() . "\n";

    foreach my $module (@_) {
	my $code = "package " . caller() . "; use Battlesloth::$module";
	{
	    no strict 'subs';
	    eval $code;
	    warn $@ if $@;
	}
    }
}

no Moose;
__PACKAGE__->meta->make_immutable;
