use lib 'lib';
use 5.18.1;
use Poopet;
my $p = Poopet->new;

# say 'Available modules:';
# say $_ for $p->available_modules;

$p->install(['Perl', '5.18.2']);
