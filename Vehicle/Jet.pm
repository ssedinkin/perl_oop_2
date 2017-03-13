# Класс авиационная техника
package Vehicle::Jet;
 
use Moose;

use Guns::MashineGun;
use Guns::Rocket;


extends 'Vehicle';

has 'mashine_gun' => (
    is  => 'ro',
    isa => 'MashineGun',
);

has 'rocket' => (
    is  => 'ro',
    isa => 'Rocket',
);

sub BUILD {
    print "Самолет создан и взлетел\n";
    return;
};

sub shoot_mashine_gun {
    my $self = shift;

    if ( $self->is_dead ) {
        print "Самолет мертв, стрелять из пулемета невозможно\n";
        return 0;
    }
    else {
        $self->mashine_gun->shoot_mashine_gun;
        return 1;
    }
}

sub shoot_rocket {
    my $self = shift;

    if ( $self->is_dead ) {
        print "Самолет мертв, стрелять ракетами невозможно\n";
        return 0;
    }
    else {
        $self->rocket->shoot_rocket;
        return 1;
    }
}

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
