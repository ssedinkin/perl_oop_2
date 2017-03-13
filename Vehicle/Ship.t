#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Vehicle::Ship');

my $ship_unit_0 = Vehicle::Ship->new;
isa_ok( $ship_unit_0, 'Vehicle::Ship' );

my $ship_unit = Vehicle::Ship->new(
                        model_name=>'Черная жемчужина',
                        speed=>'10000',
                        thickness=>'1000',
                        life=>'666666',
                        big_gun => BigGun->new (
                            type => 'Ядовитое ядро',
                            bullets_count => '1000'
                            ),
                        torpedo => Torpedo->new (
                            type => 'Megaboom',
                            bullets_count => '50',
                            bullets_in_mag_count => '30')
                        );

isa_ok( $ship_unit, 'Vehicle::Ship' );

isa_ok( $ship_unit->big_gun, 'BigGun' );
isa_ok( $ship_unit->torpedo, 'Torpedo' );

is( $ship_unit->shoot_big_gun, 1, 'Стрелять из пушки можно' );
is( $ship_unit->shoot_torpedo, 1, 'Стрелять торпедами можно' );

is( $ship_unit->model_name, 'Черная жемчужина', 'Название модели корректно' );
is( $ship_unit->speed, 10000, 'Скорость корректна' );
is( $ship_unit->thickness, 1000, 'Броня корректна' );
is( $ship_unit->life, 666666, 'Количество жизней корректно' );
is( $ship_unit->is_dead, 0, 'Объект не мертв' );

can_ok( $ship_unit, 'BUILD' );
can_ok( $ship_unit, 'move' );
can_ok( $ship_unit, 'fly' );
can_ok( $ship_unit, 'swim' );
can_ok( $ship_unit, 'art_go' );
can_ok( $ship_unit, 'tank_go' );
can_ok( $ship_unit, 'get_strike' );
can_ok( $ship_unit, 'is_critical_damage' );
can_ok( $ship_unit, 'kill_object' );

$ship_unit->move;
$ship_unit->swim;
is( $ship_unit->is_dead, 0, 'Объект не мертв' );
$ship_unit->art_go;
is( $ship_unit->is_dead, 1, 'Объект мертв развалился' );
$ship_unit->is_dead(0); # Оживляем для дальнейшей проверки
$ship_unit->tank_go;
is( $ship_unit->is_dead, 1, 'Объект мертв разбился' );
$ship_unit->is_dead(0); # Оживляем для дальнейшей проверки
$ship_unit->fly;
is( $ship_unit->is_dead, 1, 'Объект мертв разбился с высоты' );

is( $ship_unit->shoot_torpedo, 0, 'Объект мертв. Стрелять торпедами нельзя' );
is( $ship_unit->shoot_big_gun, 0, 'Объект мертв. Стрелять из пушки нельзя' );
