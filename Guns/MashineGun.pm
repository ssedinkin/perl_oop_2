# Класс пулеметы
package MashineGun;

use Moose;


extends 'Reloadable';

has 'bullets_in_mag_count' => (
    is  => 'rw',
    isa => 'Int',
);

has 'bullets_in_mag_now' => (
    is  => 'rw',
    isa => 'Int',
);

sub BUILD {
    my $self = shift;
    
    $self->reload;
}

1;
