# Класс артиллерийская техника
package Vehicle::Art;
 
use Moose;

use Guns::BigGun;



extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'BigGun',
    handles => { shoot_big_gun => 'shoot' },
);

sub BUILD {
    print "Артиллерия создана и заняла позицию\n";
    return;
};

sub move {
    my $self = shift;

    return $self->art_go;
}

sub swim {
    my $self = shift;

    print "Артиллерия утонула\n";
    return $self->kill_object;
}

sub fly {
    my $self = shift;

    print "Артиллерия упала с высоты\n";
    return $self->kill_object;
}

sub tank_go {
    my $self = shift;
    
    print "Артиллерия развалилась\n";
    return $self->kill_object;
}

1;
