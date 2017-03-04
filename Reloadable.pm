# Класс перезаряжаемые
package Reloadable;

use Moose;


extends 'Guns';

sub shoot {
    my $self = shift;

    if ( $self->bullets_in_mag_now == 0 ) {
        print "Нет патронов\n";
    }
    else {
        $self->bullets_in_mag_now ( $self->bullets_in_mag_now - 1 );
        print "Выстрелил\n";
    }
    return;
}

after 'shoot' => sub {
    my $self = shift;

    if ( $self->bullets_in_mag_now == 0 ) {
        if ( $self->bullets_count > 0 ) {
            $self->reload;
        }
        else {
            print "Нет патронов\n";
        }
    }
        return;
};

sub reload {
    my $self = shift;
    
    if ( ($self->bullets_count - $self->bullets_in_mag_count) >= 0 ){
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