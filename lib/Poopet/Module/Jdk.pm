package Poopet::Module::Jdk;
use Moose;
use namespace::autoclean;

extends 'Poopet::Module';

sub _build_script
{ <<SCRIPT
sudo apt-get install openjdk-7-jre openjdk-7-jdk
SCRIPT
}

__PACKAGE__->meta->make_immutable;
