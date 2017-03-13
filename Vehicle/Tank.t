#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Vehicle::Tank');

my $tank_unit_0 = Vehicle::Tank->new;

isa_ok( $tank_unit_0, 'Vehicle::Tank' );

my $tank_unit = Vehicle::Tank->new(
                        model_name=>'Panzer-2000',
                        speed=>'100',
                        thickness=>'34',
                        life=>'1000',
                        big_gun => BigGun->new (
                            type => 'ядро',
                            bullets_count => '10'
                            ),
                        mashine_gun => MashineGun->new (
                            type => 'пули',
                            bullets_count => '100',
                            bullets_in_mag_count => '30')
                        );

isa_ok( $tank_unit, 'Vehicle::Tank' );

isa_ok( $tank_unit->big_gun, 'BigGun' );
isa_ok( $tank_unit->mashine_gun, 'MashineGun' );

is( $tank_unit->shoot_big_gun, 1, 'Стрелять из пушки можно' );
is( $tank_unit->shoot_mashine_gun, 1, 'Стрелять из пулемета можно' );

is( $tank_unit->model_name, 'Panzer-2000', 'Название модели корректно' );
is( $tank_unit->speed, 100, 'Скорость корректна' );
is( $tank_unit->thickness, 34, 'Броня корректна' );
is( $tank_unit->life, 1000, 'Количество жизней корректно' );
is( $tank_unit->is_dead, 0, 'Объект не мертв' );

can_ok( $tank_unit, 'BUILD' );
can_ok( $tank_unit, 'move' );
can_ok( $tank_unit, 'fly' );
can_ok( $tank_unit, 'swim' );
can_ok( $tank_unit, 'art_go' );
can_ok( $tank_unit, 'tank_go' );
can_ok( $tank_unit, 'get_strike' );
can_ok( $tank_unit, 'is_critical_damage' );
can_ok( $tank_unit, 'kill_object' );

$tank_unit->move;
$tank_unit->tank_go;
is( $tank_unit->is_dead, 0, 'Объект не мертв' );
$tank_unit->art_go;
is( $tank_unit->is_dead, 1, 'Объект мертв развалился' );
$tank_unit->is_dead(0); # Оживляем для дальнейшей проверки
$tank_unit->swim;
is( $tank_unit->is_dead, 1, 'Объект мертв утонул' );
$tank_unit->is_dead(0); # Оживляем для дальнейшей проверки
$tank_unit->fly;
is( $tank_unit->is_dead, 1, 'Объект мертв разбился с высоты' );

is( $tank_unit->shoot_big_gun, 0, 'Объект мертв. Стрелять из пушки нельзя' );
is( $tank_unit->shoot_mashine_gun, 0, 'Объект мертв. Стрелять из пулемета нельзя' );
