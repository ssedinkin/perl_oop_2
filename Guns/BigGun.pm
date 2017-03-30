# Класс пушки
package BigGun;

use Moose;


extends 'Reloadable';

sub shoot_big_gun {
    my ( $self ) = @_;
    $self->shoot;
}

1;
