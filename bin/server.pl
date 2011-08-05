#!/usr/bin/env perl

use warnings;
use strict;

use lib qw(../lib lib ../../lib);
use IO::Socket;
use Battlesloth; # For the version number and preliminary syntax check

{
    package Battlesloth::Server;

    use Moose;
    extends 'Reflex::Acceptor';
    use Reflex::Collection;
    
    has_many clients           => (
	handles                => {
	    remember_client    => "remember",
	},
	);

    sub on_accept {
	my ($self, $args) = @_;

	# Reflex::Stream is not providing a socket here:
	$self->remember_client(
	    Battlesloth::Server::Handler->new(
		handle    => $args->{socket},
		rd        => 1,
	    ),
	    );
    }

    sub on_error {
	my ($self, $args) = @_;

	warn "$args->{errfun} error $args->{errnum}: $args->{errstr}\n";
	$self->stop();
    }
}

{
    package Battlesloth::Server::Handler;

    use Moose;
    extends 'Reflex::Stream';

    sub on_data {
	print "Got data\n";
    }

    no Moose;
    __PACKAGE__->meta->make_immutable;
}

my $port = 2406;

print
    "battlesloth core version $Battlesloth::VERSION\n";

# For testing:
Battlesloth::Server->new(
    listener => IO::Socket::INET->new(
	LocalAddr    => '127.0.0.1',
	LocalPort    => $port,
	Listen       => SOMAXCONN,
	Reuse        => 1,
    ),
    )->run_all();
