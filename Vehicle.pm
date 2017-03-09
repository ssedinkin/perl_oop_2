# Класс техника
package Vehicle;
 
use Moose;

 
has 'model_name' => (
    is  => 'ro',
    isa => 'Str',
);
 
has 'speed' => (
    is  => 'rw',
    isa => 'Int',
);

has 'thickness' => (
    is  => 'ro',
    isa => 'Int',
);
 
has 'life' => (
    is  => 'rw',
    isa => 'Int',
);

has 'is_dead' => (
    is  => 'rw',
    isa => 'Bool',
    default => '0',
);

sub get_strike {
    my ( $self, $hit ) = @_;

    unless ($self->is_dead) {
        $self->life( $self->life - $hit );
    }
    else {
        print "Не могу получить попадание, объект мертв\n";
    }
    # Если жизней не осталось или критичное попадание, то объект уничтожается
    if ($self->life <= 0) {
        $self->kill_object;
    }
    else {
        $self->is_critical_damage;
    }
    return;
}

sub is_critical_damage {
    my $self = shift;

    if ( int ( rand (10) ) == 1 ) {
        print "Критичное попадание, объект мертв\n";
        $self->kill_object;
    };
}

sub move {
    print "Техника движется\n";
    return;
}

sub fly {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Самолет летит\n";
    }
    else {
        print "Самолет мертв, лететь невозможно\n";
    }
    return;
}

sub swim {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Корабль плывет\n";
    }
    else {
        print "Корабль мертв, плыть невозможно\n";
    }
    return;
}

sub tank_go {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Танк едет\n";
    }
    else {
        print "Танк мертв, ехать невозможно\n";
    }
    return;
}

sub art_go {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Артиллерия катится\n";
    }
    else {
        print "Артиллерия мертва, катиться невозможно\n";
    }
    return;
}

sub kill_object {
    my $self = shift;
    
    if ( $self->is_dead == 0 ) {
        $self->is_dead(1);
        print "Уничтожаем объект " . $self->model_name . "\n";
    }
    return;
}

1;
