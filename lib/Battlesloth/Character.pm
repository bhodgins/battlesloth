package Battlesloth::Character;

use Moose;

with 'Battlesloth::Role::Abilities';
with 'Battlesloth::Role::Status';


no Moose;
__PACKAGE__->meta->make_immutable;
