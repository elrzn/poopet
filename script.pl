use lib 'lib';
use 5.18.1;
use Poopet;
my $p = Poopet->new;

# say 'Available modules:';
# say $_ for $p->available_modules;

$p->install('Git', 'Leiningen', ['Perl', '5.18.1']);
