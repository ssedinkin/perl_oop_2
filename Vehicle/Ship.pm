# Класс корабельная техника
package Vehicle::Ship;
 
use Moose;

use Guns::BigGun;
use Guns::Torpedo;



extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'BigGun',
    handles => { shoot_big_gun => 'shoot' },
);

has 'torpedo' => (
    is  => 'ro',
    isa => 'Torpedo',
    handles => { shoot_torpedo => 'shoot' },
);

sub BUILD {
    print "Корабль создан и отплыл\n";
    return;
};


sub move {
    my $self = shift;

    return $self->swim;
}

sub fly {
    my $self = shift;

    print "Корабль упал с высоты\n";
    return $self->kill_object;
}

sub tank_go {
    my $self = shift;

    print "Корабль разбился\n";
    return $self->kill_object;
}

sub art_go {
    my $self = shift;
    
    print "Корабль развалился\n";
    return $self->kill_object;
}

1;
