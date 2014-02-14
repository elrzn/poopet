package Poopet::Say;
use Moose::Role;

sub say
{ my ($self, @str) = @_;
  print "Poopet :: ", @str, "\n";
}

1;
