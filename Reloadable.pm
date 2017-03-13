# Класс перезаряжаемые
package Reloadable;

use Moose;


extends 'Guns';

has 'bullets_in_mag_count' => (
    is  => 'rw',
    isa => 'Int',
    default=>'1',
);

has 'bullets_in_mag_now' => (
    is  => 'rw',
    isa => 'Int',
    default=>'1',
);

sub BUILD {
    my $self = shift;
    
    $self->reload;
}

sub shoot {
    my $self = shift;

    if ( $self->bullets_in_mag_now == 0 ) {
        print "Нет патронов\n";
        return 0;
    }
    else {
        $self->bullets_in_mag_now ( $self->bullets_in_mag_now - 1 );
        print "Выстрелил\n";
        if ( $self->bullets_in_mag_now == 0 ) {
            if ( $self->bullets_count > 0 ) {
                $self->reload;
            }
        }
        return 1;
    }
}

sub reload {
    my $self = shift;
    
    if ( $self->bullets_count == 0 ) {
        print "патронов нет, перезаряжаться нечем\n";
        return 0;
    }

    if ( ($self->bullets_count - $self->bullets_in_mag_count) >= 0 ){
        $self->bullets_in_mag_now ($self->bullets_in_mag_count);
        $self->bullets_count ($self->bullets_count - $self->bullets_in_mag_count);
        print "Перезарядка полным магазином\n";
        return 1;
    }
    else {
        $self->bullets_in_mag_now ($self->bullets_count);
        $self->bullets_count (0);
        print "Перезарядка неполным магазином\n";
        return 2;
    }
}

1;