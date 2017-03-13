# Класс пулеметы
package MashineGun;

use Moose;


extends 'Reloadable';

sub shoot_mashine_gun {
    my ( $self ) = @_;
    $self->shoot;
}

1;
