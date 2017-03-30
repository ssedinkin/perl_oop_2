# Класс танковая техника
package Vehicle::Tank;
 
use Moose;

use Guns::BigGun;
use Guns::MashineGun;



extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'BigGun',
);

has 'mashine_gun' => (
    is  => 'ro',
    isa => 'MashineGun',
);

sub BUILD {
    my ( $self ) = @_;
    $self->prepare;
    if ( $self->is_prepared ) {
        print "Танк создан и выехал\n";
        return 1;
    }
    else {
        return 0;
    }
};

sub shoot_big_gun {
    my $self = shift;

    if ( $self->is_dead ) {
        print "Танк мертв, стрелять из пушки невозможно\n";
        return 0;
    }
    else {
        $self->big_gun->shoot_big_gun;
        return 1;
    }
}

sub shoot_mashine_gun {
    my $self = shift;

    if ( $self->is_dead ) {
        print "Танк мертв, стрелять из пулемета невозможно\n";
        return 0;
    }
    else {
        $self->mashine_gun->shoot_mashine_gun;
        return 1;
    }
}

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
