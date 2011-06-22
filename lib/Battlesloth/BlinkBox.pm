package BlinkBox;

use Moose;


# I think that we have to be very careful about memory leaks here.

has 'matter' => (
    is          => 'rw',
    isa         => 'ArrayRef[Object]',
    traits      => ['Array'],
    default     => sub { [] },
    init_arg    => undef,
    handles     => {
	spawn    => 'push',
    },
    );

no Moose;
__PACKAGE__->meta->make_immutable;
