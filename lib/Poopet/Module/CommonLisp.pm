package Poopet::Module::CommonLisp;
use Moose;
use namespace::autoclean;

extends 'Poopet::Module';

sub _build_script {
  qq{
    sudo apt-get install sbcl
  };
}

__PACKAGE__->meta->make_immutable;
