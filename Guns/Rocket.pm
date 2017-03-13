# Класс ракеты
package Rocket;

use Moose;


extends 'Guns';

sub shoot_rocket {
    my ( $self ) = @_;
    $self->shoot;
}

1;
