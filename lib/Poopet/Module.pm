package Poopet::Module;
use Moose;
use namespace::autoclean;

with 'Poopet::Say';

has 'deps',   is => 'ro', isa => 'ArrayRef[Any]', lazy_build => 1;
has 'script', is => 'ro', isa => 'Str',           lazy_build => 1;

sub _build_deps { [] }

sub _build_script { q{} }

sub exec {
  my $self = shift;
  my $code = $self->script;
  qx($code) or die qq(Something went wrong: $!);
  qx(cd ~);    # Go to home directory after every install, just in case.
}

__PACKAGE__->meta->make_immutable;
