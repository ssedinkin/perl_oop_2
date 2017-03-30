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

has 'is_prepared' => (
    is  => 'rw',
    isa => 'Bool',
);

sub BUILD {
    my ( $self ) = @_;
    $self->prepare;
    if ( $self->is_prepared ) {
        print "Техника подготовлена\n";
        return 1;
    }
    else {
        return 0;
    }
}

sub prepare {
    my ( $self ) = @_;
    if ( !$self->is_prepared ) {
        $self->is_prepared(1);
        return 1;
    }
    else {
        return 0;
    }
}

sub get_strike {
    my ( $self, $hit, $never_check_critical_damage ) = @_;
    if ( !$never_check_critical_damage ) {
        $never_check_critical_damage = 0;
    }

    unless ($self->is_dead) {
        $self->life( $self->life - $hit );
        # Если жизней не осталось или критичное попадание, то объект уничтожается
        if ($self->life <= 0) {
            $self->kill_object;
        }
        else {
            if ( $never_check_critical_damage != 1 ) {
                $self->is_critical_damage;
            }
        }
    }
    else {
        print "Не могу получить попадание, объект мертв\n";
    }
    return;
}

sub is_critical_damage {
    my ( $self, $critical_damage ) = @_;

    if (!$critical_damage) {
        if ( int ( rand (10) ) == 1 ) {
            print "Критичное попадание, объект мертв\n";
            $self->kill_object;
        };
    }
    else {
        $self->kill_object;
    }
}

sub move {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Техника движется\n";
        return 1;
    }
    else {
        print "Техника мертва, двигаться невозможно\n";
        return 0;
    }
}

sub fly {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Самолет летит\n";
        return 1;
    }
    else {
        print "Самолет мертв, лететь невозможно\n";
        return 0;
    }
}

sub swim {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Корабль плывет\n";
        return 1;
    }
    else {
        print "Корабль мертв, плыть невозможно\n";
        return 0;
    }
}

sub tank_go {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Танк едет\n";
        return 1;
    }
    else {
        print "Танк мертв, ехать невозможно\n";
        return 0;
    }
}

sub art_go {
    my $self = shift;

    unless ( $self->is_dead ) {
        print "Артиллерия катится\n";
        return 1;
    }
    else {
        print "Артиллерия мертва, катиться невозможно\n";
        return 0;
    }
}

sub kill_object {
    my $self = shift;
    
    if ( $self->is_dead == 0 ) {
        if ( $self->life != 0 ) {
            $self->life(0);
        }
        $self->is_dead(1);
        print "Уничтожаем объект " . $self->model_name . "\n";
    }
    return;
}

1;
