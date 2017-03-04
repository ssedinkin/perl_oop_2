# Класс авиационная техника
package Vehicle::Jet;
 
use Moose;

use Guns::MashineGun;
use Guns::Rocket;


extends 'Vehicle';

has 'mashine_gun' => (
    is  => 'ro',
    isa => 'MashineGun',
    handles => { shoot_mashine_gun => 'shoot' },
);

has 'rocket' => (
    is  => 'ro',
    isa => 'Rocket',
    handles => { shoot_rocket => 'shoot' },
);

sub BUILD {
    print "Самолет создан и взлетел\n";
    return;
};

sub move {
    my $self = shift;

    return $self->fly;
}

sub swim {
    my $self = shift;

    print "Самолет утонул\n";
    return $self->kill_object;
}

sub tank_go {
    my $self = shift;

    print "Самолет разбился\n";
    return $self->kill_object;
}

sub art_go {
    my $self = shift;
    
    print "Самолет развалился\n";
    return $self->kill_object;
}

1;
