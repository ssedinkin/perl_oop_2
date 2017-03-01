package Vehicle;
 
use Moose;

 
has 'model_name' => (
    is  => 'ro',
    isa => 'Str',
);
 
has 'speed' => (
    is  => 'rw',
    isa => 'Int',
);

has 'thickness' => (
    is  => 'ro',
    isa => 'Int',
);
 
has 'life' => (
    is  => 'rw',
    isa => 'Int',
);

has 'is_dead' => (
    is  => 'rw',
    isa => 'Bool',
    default => '0',
);

sub get_strike {
	my $self = shift;
    my $hit = shift;

    unless ($self->is_dead) {
    	$self->life( $self->life - $hit );
    	$self->speed( $self->speed - int ( $hit*3 / ($self->thickness) ) );
    }
    # Если жизней не осталось или критичное попадание, то объект уничтожается
    if ($self->life <= 0) {
    	$self->DEMOLISH;
    }
    else {
    	if ( int ( rand (10) ) == 1 ) {
        	print "Критичное попадание, объект мертв\n";
        	$self->DEMOLISH;
        };
    }
    # Если скорость меньше нуля, делаем ее нулевой
    if ($self->speed<0) {
    	$self->speed(0);
    }
    return;
}

sub moving {
	print "move\n";
	return;
}

sub DEMOLISH {
	my $self = shift;
	if ($self->is_dead == 0){
		$self->is_dead(1);
	}
	print "Уничтожаем объект " . $self->model_name . "\n";
	return;
}

1;
