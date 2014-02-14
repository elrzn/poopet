package Poopet::Module;
use Moose;
use namespace::autoclean;

with 'Poopet::Say';

has 'requirements', is => 'ro', isa => 'HashRef', lazy_build => 1;
has 'script',       is => 'ro', isa => 'Str',     lazy_build => 1;

sub _build_requirements { [] }

sub _build_script {''}

sub exec {
  my $self = shift;
  my $code = $self->script;
  qx($code) or die sprintf qq(Something went wrong while installing %s\n$!), $self->name;
  qx(cd ~);    # Go to home directory after every install, just in case.
}

__PACKAGE__->meta->make_immutable;
