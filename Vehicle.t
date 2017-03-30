#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Vehicle');

my $unknown_unit_1 = Vehicle->new;

isa_ok( $unknown_unit_1, 'Vehicle' );

my $unknown_unit_2 = Vehicle->new(
                        model_name=>'Техника X-1',
                        speed=>'100',
                        thickness=>'50',
                        life=>'300',
                        );

isa_ok( $unknown_unit_2, 'Vehicle' );

is( $unknown_unit_2->model_name, 'Техника X-1', 'Название модели Техника X-1, корректно' );
is( $unknown_unit_2->speed, 100, 'Скорость 100, корректна' );
is( $unknown_unit_2->thickness, 50, 'Броня 50, корректна' );
is( $unknown_unit_2->life, 300, 'Количество жизней 300, корректно' );
is( $unknown_unit_2->is_dead, 0, 'Объект не мертв' );
is( $unknown_unit_2->is_prepared, 1, 'Объект подготовлен' );

can_ok( $unknown_unit_2, 'BUILD' );
can_ok( $unknown_unit_2, 'prepare' );
can_ok( $unknown_unit_2, 'move' );
can_ok( $unknown_unit_2, 'fly' );
can_ok( $unknown_unit_2, 'swim' );
can_ok( $unknown_unit_2, 'art_go' );
can_ok( $unknown_unit_2, 'tank_go' );
can_ok( $unknown_unit_2, 'get_strike' );
can_ok( $unknown_unit_2, 'is_critical_damage' );
can_ok( $unknown_unit_2, 'kill_object' );

is( $unknown_unit_2->prepare, 0, 'Объект уже подготовлен' );

$unknown_unit_2->get_strike(50, 1);
is( $unknown_unit_2->life, 250, 'Объект получил 50 урона. Количество жизней изменилось с 300 до 250' );
$unknown_unit_2->get_strike(350, 1);
is( $unknown_unit_2->life, 0, 'Объект получил 350 урона. Количество жизней изменилось с 250 до 0' );
is( $unknown_unit_2->is_dead, 1, 'Объект мертв' );
$unknown_unit_2->get_strike(50, 1);
is( $unknown_unit_2->life, 0, 'Мертвый объект не смог получить 50 урона. Жизней 0' );
is( $unknown_unit_2->is_dead, 1, 'Объект мертв до сих пор' );


is( $unknown_unit_2->move , 0, 'Мертвая техника не движется методом move' );
is( $unknown_unit_2->fly , 0, 'Мертвая техника не движется методом fly' );
is( $unknown_unit_2->swim , 0, 'Мертвая техника не движется методом swim' );
is( $unknown_unit_2->art_go , 0, 'Мертвая техника не движется методом art_go' );
is( $unknown_unit_2->tank_go , 0, 'Мертвая техника не движется методом tank_go' );
is( $unknown_unit_2->is_dead, 1, 'Объект мертв после любого вида движения' );

$unknown_unit_2->life(100);
$unknown_unit_2->is_dead(0);
is( $unknown_unit_2->is_dead, 0, 'Объект воскрешен для проверки движения' );
is( $unknown_unit_2->life, 100, 'У воскрешенного объекта 100 жизней' );
is( $unknown_unit_2->move , 1, 'Техника движется методом move' );
is( $unknown_unit_2->fly , 1, 'Техника движется методом fly' );
is( $unknown_unit_2->swim , 1, 'Техника движется методом swim' );
is( $unknown_unit_2->art_go , 1, 'Техника движется методом art_go' );
is( $unknown_unit_2->tank_go , 1, 'Техника движется методом tank_go' );
is( $unknown_unit_2->is_dead, 0, 'Объект не мертв после любого вида движения' );

$unknown_unit_2->is_critical_damage(1);
is( $unknown_unit_2->is_dead, 1, 'Объект мертв после критичного попадания' );
is( $unknown_unit_2->life, 0, 'У мертвой техники 0 жизней' );


$unknown_unit_2->life(100);
$unknown_unit_2->is_dead(0);
is( $unknown_unit_2->is_dead, 0, 'Объект воскрешен для проверки ручного уничтожения' );
is( $unknown_unit_2->life, 100, 'У воскрешенного объекта 100 жизней' );
$unknown_unit_2->kill_object;
is( $unknown_unit_2->is_dead, 1, 'Объект мертв после ручного уничтожения' );
