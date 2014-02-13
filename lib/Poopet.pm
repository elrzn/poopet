package Poopet;
use Moose;
use namespace::autoclean;

sub say
{ my ($self, $str) = @_;
  print sprintf qq(Poopet :: %s\n), $str;
}

__PACKAGE__->meta->make_immutable;
