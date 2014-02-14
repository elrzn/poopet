package Poopet;
use Moose;
use namespace::autoclean;
use Sort::Topological qw(toposort);

with 'Poopet::Say';

has 'available_modules', is => 'ro', isa => 'ArrayRef[Str]', lazy_build => 1;

sub _build_available_modules {
  [map { substr($_, length($_) - 3, 3) eq '.pm' ? substr($_, 0, length($_) - 3) : $_ }
      grep /.pm/, split /\s/, qx(ls -l ./lib/Poopet/Module)];
}

sub module_is_available {
  my ($self, $module) = @_;
  grep { $_ eq $module } @{$self->available_modules};
}

sub _module_to_file { "Poopet/Module/$_[1].pm" }

sub _module_to_package { "Poopet::Module::$_[1]" }

sub load_package {
  my ($self, $module, $version) = @_;
  die "Module '$module' is not available!" unless $self->module_is_available($module);
  my $file = $self->_module_to_file($module);
  require $file;
  $self->_module_to_package($module)->new($version ? {version => $version} : {});
}

sub _prepare_dependencies {
  my ($self, @modules) = @_;
  my %deps;
  while (@modules) {
    my $module = shift @modules;

    # Handle version, if provided.
    my $version;
    ($version, $module) = ($module->[1], $module->[0]) if ref $module eq 'ARRAY';

    $self->say("Preparing module $module");
    my $instance = $self->load_package($module, $version);    # Create pool for better performance?
    my $deps = $instance->deps || [];
    $deps{$module} = $deps;
    if (@$deps) {
      $self->say("Dependencies found: ", join ", ", @$deps);
      push @modules, @$deps if @$deps;
    }
  }
  %deps;
}

sub _dependency_order {
  my ($self, %deps) = @_;
  reverse toposort sub { @{$deps{$_[0]} || []} }, [keys %deps];
}

sub install {
  my ($self, @modules) = @_;
  my @with_deps = $self->_dependency_order($self->_prepare_dependencies(@modules));
}

__PACKAGE__->meta->make_immutable;
