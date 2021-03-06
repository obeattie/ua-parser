use strict;
use FindBin qw($Bin);
#use Yaml::Tiny ();
use Test::More 'no_plan';

use HTTP::UA::Parser;

my $yaml = YAML::Tiny->read( $Bin.'/test_resources/additional_os_tests.yaml' )->[0]->{test_cases};

my $r = HTTP::UA::Parser->new();

foreach my $st (@{$yaml}){
    
    $r->parse($st->{user_agent_string});
    
    my $os = $r->os;
    
    is ($os->family, $st->{family});
    is ($os->major, $st->{major});
    is ($os->minor, $st->{minor});
    is ($os->patch, $st->{patch}, 'OS '. $st->{family});
}

__END__
