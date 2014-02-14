package Poopet::Module::Perl;
use Moose;
use namespace::autoclean;
use IPC::Cmd qw(can_run);

extends 'Poopet::Module';

has 'version', is => 'ro', isa => 'Str', default => sub { '5.18.2' };

sub _build_deps { [qw/Curl/] }

sub _build_script {
  my $self     = shift;
  my $version  = $self->version;
  my $perlbrew = (can_run 'perlbrew') ? '# perlbrew already installed' : q{
    curl -L http://install.perlbrew.pl | bash
    echo 'source ~/perl5/perlbrew/etc/bashrc' >> ~/.bashrc
    echo 'source ~/perl5/perlbrew/etc/bashrc' >> ~/.zshrc
  };
  qq{
    $perlbrew
    perlbrew install perl-${version}
    perlbrew switch perl-${version}
    perlbrew install-cpanm
  };
}

__PACKAGE__->meta->make_immutable;
