package Vehicle::Tank;
 
use Moose;


extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'Big_gun',
    handles => { shut_big_gun => 'shut' },
);

has 'mashine_gun' => (
    is  => 'ro',
    isa => 'Mashine_gun',
    handles => { shut_mashine_gun => 'shut' },
);

sub BUILD {
    print "Танк создан и выехал\n";
    return;
};

sub moving {
	my $self = shift;
	my $check_move = shift;
	unless ( $self->is_dead ) {
	    if ($check_move =~ /tank_go/ ) {
	    	print "Танк едет\n";
	    }
	    else {
	    	$self->DEMOLISH;
	    };}
    return;
}

1;
