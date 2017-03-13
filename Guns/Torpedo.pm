# Класс торпеды
package Torpedo;

use Moose;


extends 'Guns';

sub shoot_torpedo {
    my ( $self ) = @_;
    $self->shoot;
}

1;
