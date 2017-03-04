# Класс танковая техника
package Vehicle::Tank;
 
use Moose;

use Guns::BigGun;
use Guns::MashineGun;



extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'BigGun',
    handles => { shoot_big_gun => 'shoot' },
);

has 'mashine_gun' => (
    is  => 'ro',
    isa => 'MashineGun',
    handles => { shoot_mashine_gun => 'shoot' },
);

sub BUILD {
    print "Танк создан и выехал\n";
    return;
};

sub move {
    my $self = shift;

    return $self->tank_go;
}

sub fly {
    my $self = shift;

    print "Танк упал с высоты\n";
    return $self->kill_object;
}

sub swim {
    my $self = shift;

    print "Танк утонул\n";
    return $self->kill_object;
}

sub art_go {
    my $self = shift;
    
    print "Танк развалился\n";
    return $self->kill_object;
}

1;
