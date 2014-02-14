package Poopet;
use Moose;
use namespace::autoclean;

with 'Poopet::Say';

sub available_modules {
  map {"Poopet::Module::$_"} grep /.pm/, split /\s/, qx(ls -l ./lib/Poopet/Module);
}

sub install {
  my ($self, @modules) = @_;
  my @available_modules = $self->available_modules;
  for my $m (@modules) {
    my $v;
    if (ref $m eq 'ARRAY') {
      $v = $m->[1];
      $m = $m->[0];
    }
    my $package = "Poopet::Module::${m}";
    unless (grep { "${package}.pm" eq $_ } @available_modules) {
      $self->say("Module '$m' is not available and won't be installed");
      next;
    }
    $self->say("Installing module '$m'", $v ? " with version '$v'" : '');
    my $with_version = $v ? q{version => '$v'} : q{};
    eval qq{
      use $package;
      my \$p = ${package}->new($with_version);
      \$p->exec;
    };
  }
}

__PACKAGE__->meta->make_immutable;
