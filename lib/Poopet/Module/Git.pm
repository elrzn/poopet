package Poopet::Module::Git;
use Moose;
use namespace::autoclean;

extends 'Poopet::Module';

sub _build_name { 'git' }

sub _build_shit
{ my $self = shift;
  <<SCRIPT
sudo apt-get install git
SCRIPT
}

__PACKAGE__->meta->make_immutable;
