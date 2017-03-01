package Mashine_gun;

use Moose;


extends 'Guns';

has 'bullets_in_mag_count' => (
    is  => 'rw',
    isa => 'Int',
);

has 'bullets_in_mag_now' => (
    is  => 'rw',
    isa => 'Int',
);

sub BUILD {
    my $self = shift;
    $self->reload;
}

sub shut {
    my $self = shift;
    if ( $self->bullets_in_mag_now == 0 ) {
        if ( $self->bullets_count > 0 ) {
            $self->reload;
        }
        else {
            print "Нет патронов\n";
        }
    }
    else {
        $self->bullets_in_mag_now ( $self->bullets_in_mag_now - 1 );
        print "Выстрелил\n";
    }
    return;
}

sub reload {
    my $self = shift;
    if ( ($self->bullets_count - $self->bullets_in_mag_count) > 0 ){
        $self->bullets_in_mag_now ($self->bullets_in_mag_count);
        $self->bullets_count ($self->bullets_count - $self->bullets_in_mag_count);
        print "Перезарядка полным магазином\n";
    }
    else {
        $self->bullets_in_mag_now ($self->bullets_count);
        $self->bullets_count (0);
        print "Перезарядка неполным магазином\n";
    }

    
}

1;
