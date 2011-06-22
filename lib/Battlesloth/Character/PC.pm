package Battlesloth::Character::PC;

use Moose;

extends 'Battlesloth::Character';
with    'Battlesloth::Role::Inventory';


no Moose;
__PACKAGE__->meta->make_immutable;
