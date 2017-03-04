# Класс пушки
package BigGun;

use Moose;


extends 'Reloadable';

has 'bullets_in_mag_count' => (
    is  => 'rw',
    isa => 'Int',
    default=>'1',
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
