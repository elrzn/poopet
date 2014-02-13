package Poopet::Module::Perl;
use Moose;
use namespace::autoclean;

extends 'Poopet::Module';

has 'version', is => 'ro', isa => 'Str', default => sub { '5.18.2' };

sub _build_name { 'perl' }

sub _build_shit
{ my $self = shift;
  my $version = $self->version;
  <<SCRIPT
curl -L http://install.perlbrew.pl | bash
echo 'source ~/perl5/perlbrew/etc/bashrc' >> ~/.bashrc
echo 'source ~/perl5/perlbrew/etc/bashrc' >> ~/.zshrc
perlbrew install perl-${version}
perlbrew switch perl-${version}
SCRIPT
}

__PACKAGE__->meta->make_immutable;
