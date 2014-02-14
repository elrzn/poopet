package Poopet::Say;
use Moose::Role;

sub say
{ my ($self, $str) = @_;
  print sprintf qq(Poopet :: %s\n), $str;
}

1;
