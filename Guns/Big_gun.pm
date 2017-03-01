package Big_gun;

use Moose;


extends 'Guns';

after 'shut' => sub {
	my $self = shift;
	if ($self->bullets_count) {
		print "Перезарядка\n";
	}
    return;
};


1;
