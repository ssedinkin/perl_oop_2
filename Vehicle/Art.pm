package Vehicle::Art;
 
use Moose;


extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'Big_gun',
    handles => { shut_big_gun => 'shut' },
);

sub BUILD {
    print "Артиллерия создана и заняла позицию\n";
    return;
};

sub moving {
    my $self = shift;
    my $check_move = shift;
    unless ( $self->is_dead ) {
        if ($check_move =~ /art_go/ ) {
            print "Артиллерия движется\n";
        }
        else {
            $self->DEMOLISH;
        };
    }
    return;
}

1;
