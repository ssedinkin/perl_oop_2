package Vehicle::Ship;
 
use Moose;


extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'Big_gun',
    handles => { shut_big_gun => 'shut' },
);

has 'torpedo' => (
    is  => 'ro',
    isa => 'Torpedo',
    handles => { shut_torpedo => 'shut' },
);

sub BUILD {
    print "Корабль создан и отплыл\n";
    return;
};

sub moving {
    my $self = shift;
    my $check_move = shift;
    unless ( $self->is_dead ) {
        if ($check_move =~ /swim/ ) {
            print "Корабль плывет\n";
        }
        else {
            $self->DEMOLISH;
        };}
    return;
}

1;
