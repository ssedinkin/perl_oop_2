#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Vehicle::Art');

my $art_unit_0 = Vehicle::Art->new;

isa_ok( $art_unit_0, 'Vehicle::Art' );


my $art_unit = Vehicle::Art->new(
                        model_name=>'Гаубица-D78000',
                        speed=>'60',
                        thickness=>'800',
                        life=>'9874',
                        big_gun => BigGun->new (
                            type => 'ядро',
                            bullets_count => '20'
                            )
                        );

isa_ok( $art_unit, 'Vehicle::Art' );

isa_ok( $art_unit->big_gun, 'BigGun' );

is( $art_unit->shoot_big_gun, 1, 'Стрелять из пушки можно' );

is( $art_unit->model_name, 'Гаубица-D78000', 'Название модели корректно' );
is( $art_unit->speed, 60, 'Скорость корректна' );
is( $art_unit->thickness, 800, 'Броня корректна' );
is( $art_unit->life, 9874, 'Количество жизней корректно' );
is( $art_unit->is_dead, 0, 'Объект не мертв' );
is( $art_unit->is_prepared, 1, 'Артиллерия создана и заняла позицию' );

can_ok( $art_unit, 'BUILD' );
can_ok( $art_unit, 'prepare' );
can_ok( $art_unit, 'move' );
can_ok( $art_unit, 'fly' );
can_ok( $art_unit, 'swim' );
can_ok( $art_unit, 'art_go' );
can_ok( $art_unit, 'tank_go' );
can_ok( $art_unit, 'get_strike' );
can_ok( $art_unit, 'is_critical_damage' );
can_ok( $art_unit, 'kill_object' );

$art_unit->move;
$art_unit->art_go;
is( $art_unit->is_dead, 0, 'Объект не мертв' );
$art_unit->tank_go;
is( $art_unit->is_dead, 1, 'Объект мертв разбился' );
$art_unit->is_dead(0); # Оживляем для дальнейшей проверки
$art_unit->swim;
is( $art_unit->is_dead, 1, 'Объект мертв утонул' );
$art_unit->is_dead(0); # Оживляем для дальнейшей проверки
$art_unit->fly;
is( $art_unit->is_dead, 1, 'Объект мертв разбился с высоты' );

is( $art_unit->shoot_big_gun, 0, 'Объект мертв. Стрелять из пушки нельзя' );
