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
);

sub shoot {
    my $self = shift;
    
    if ( $self->bullets_count == 0 ) {
        print "Нет патронов\n";
    }
    else {
        $self->bullets_count ( $self->bullets_count - 1 );
        print "Выстрелил\n";
    }
    return;
}

sub aim {
    print "Прицелился\n";
    return;
}

1;
