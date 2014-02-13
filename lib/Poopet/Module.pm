package Poopet::Module;
use Moose;
use namespace::autoclean;

extends 'Poopet';

has 'name',         is => 'ro', isa => 'Str',     lazy_build => 1;
has 'requirements', is => 'ro', isa => 'HashRef', lazy_build => 1;
has 'shit',         is => 'ro', isa => 'Str',     lazy_build => 1;

sub _build_name { 'Unnamed module' }

sub _build_requirements { [] }

sub _build_shit { '' }

sub exec
{ my $self = shift;
  $self->say(sprintf 'Installing %s', $self->name);
  my $code = $self->shit;
  qx($code)
   or die sprintf qq(Something went wrong while installing %s\n$!), $self->name;
  qx(cd);    # Go to home directory after every install, just in case.
}

__PACKAGE__->meta->make_immutable;
