package Poopet::Module::Git;
use Moose;
use namespace::autoclean;

extends 'Poopet::Module';

sub _build_script {
  <<SCRIPT
sudo apt-get install git
SCRIPT
}

__PACKAGE__->meta->make_immutable;
