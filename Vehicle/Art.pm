# Класс артиллерийская техника
package Vehicle::Art;
 
use Moose;

use Guns::BigGun;



extends 'Vehicle';

has 'big_gun' => (
    is  => 'ro',
    isa => 'BigGun',
);

sub BUILD {
    my ( $self ) = @_;
    $self->prepare;
    if ( $self->is_prepared ) {
        print "Артиллерия создана и заняла позицию\n";
        return 1;
    }
    else {
        return 0;
    }
};

sub shoot_big_gun {
    my $self = shift;

    if ( $self->is_dead ) {
        print "Артиллерия мертва, стрелять из пушки невозможно\n";
        return 0;
    }
    else {
        $self->big_gun->shoot_big_gun;
        return 1;
    }
}

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
