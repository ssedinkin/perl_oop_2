# Класс корабельная техника
package Vehicle::Ship;
 
use Moose;

use Guns::BigGun;
use Guns::Torpedo;



extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'BigGun',
);

has 'torpedo' => (
    is  => 'ro',
    isa => 'Torpedo',
);

sub BUILD {
    print "Корабль создан и отплыл\n";
    return;
};

sub shoot_big_gun {
    my $self = shift;

    if ( $self->is_dead ) {
        print "Корабль мертв, стрелять из пушки невозможно\n";
        return 0;
    }
    else {
        $self->big_gun->shoot_big_gun;
        return 1;
    }
}

sub shoot_torpedo {
    my $self = shift;

    if ( $self->is_dead ) {
        print "Корабль мертв, стрелять торпедами невозможно\n";
        return 0;
    }
    else {
        $self->torpedo->shoot_torpedo;
        return 1;
    }
}

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
