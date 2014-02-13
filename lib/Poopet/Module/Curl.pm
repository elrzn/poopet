package Poopet::Module::Curl;
use Moose;
use namespace::autoclean;

extends 'Poopet::Module';

sub _build_name { 'curl' }

sub _build_script
{ <<SCRIPT
sudo apt-get install curl
SCRIPT
}

__PACKAGE__->meta->make_immutable;
