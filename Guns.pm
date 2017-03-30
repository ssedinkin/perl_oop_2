# Класс оружие
package Guns;
 
use Moose;

has 'type' => (
    is  => 'ro',
    isa => 'Str',
);

has 'bullets_count' => (
    is  => 'rw',
    isa => 'Int',
    default => 10,
);

sub shoot {
    my $self = shift;
    
    if ( $self->bullets_count == 0 ) {
        print "Нет патронов\n";
        return 0;
    }
    else {
        $self->bullets_count ( $self->bullets_count - 1 );
        print "Выстрелил\n";
        return 1;
    }
}

sub aim {
    print "Прицелился\n";
    return 1;
}

1;
