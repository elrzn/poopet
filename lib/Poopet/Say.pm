package Poopet::Say;
use Moose::Role;

sub say
{ shift;
  print "Poopet :: ", @_, "\n";
}

1;
