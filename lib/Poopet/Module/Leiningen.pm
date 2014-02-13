package Poopet::Module::Leiningen;
use Moose;
use namespace::autoclean;

extends 'Poopet::Module';

sub _build_name { 'leiningen' }

sub _build_requirements
{ {dirs    => [qw(~/bin)],
   modules => [qw(jdk)]};
}

sub _build_script
{ <<SCRIPT
cd ~/bin && curl -O https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod a+x ~/bin/lein
SCRIPT
}

__PACKAGE__->meta->make_immutable;
