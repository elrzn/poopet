package Poopet;
use Moose;
use namespace::autoclean;

sub available_modules
{ map { "Poopet::Module::$_" } grep /.pm/, split /\s/, qx(ls -l ./lib/Poopet/Module);
}

__PACKAGE__->meta->make_immutable;
