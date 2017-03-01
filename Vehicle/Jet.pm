package Vehicle::Jet;
 
use Moose;


extends 'Vehicle';

has 'mashine_gun' => (
    is  => 'ro',
    isa => 'Mashine_gun',
    handles => { shut_mashine_gun => 'shut' },
);

has 'rocket' => (
    is  => 'ro',
    isa => 'Rocket',
    handles => { shut_rocket => 'shut' },
);

sub BUILD {
    print "Самолет создан и взлетел\n";
    return;
};

sub moving {
    my $self = shift;
    my $check_move = shift;
    unless ( $self->is_dead ) {
        if ($check_move =~ /fly/ ) {
            print "Самолет летит\n";
        }
        else {
            $self->DEMOLISH;
        };}
    return;
}

1;
