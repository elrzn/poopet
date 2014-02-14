package Poopet::Module::Elasticsearch;
use Moose;
use namespace::autoclean;

extends 'Poopet::Module';

sub _build_deps { [qw/Jdk Curl/] }

sub _build_script {
  <<SCRIPT
cd ~/opt && curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.0.deb
sudo dpkg -i elasticsearch-1.0.0.deb
rm ~/opt/elasticsearch-1.0.0.deb
SCRIPT
}

__PACKAGE__->meta->make_immutable;
