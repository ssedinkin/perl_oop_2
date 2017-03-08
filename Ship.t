#!/usr/bin/perl

use Moose;
use Data::Dumper;
use Test::More qw(no_plan);

use_ok ('Vehicle::Ship');

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

is_deeply( $ship_unit->big_gun, {
                        type => 'Ядовитое ядро',
                        bullets_count => 999,
                        bullets_in_mag_count => 1,
                        bullets_in_mag_now => 1,
                        },
                        'big_gun исправен'
);

is_deeply( $ship_unit->torpedo, {
                        type => 'Megaboom',
                        bullets_count => 50,
                        },
                        'torpedo исправен'
);

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

can_ok( $ship_unit->big_gun, 'shoot' );
can_ok( $ship_unit->big_gun, 'aim' );
can_ok( $ship_unit->torpedo, 'shoot' );
can_ok( $ship_unit->torpedo, 'aim' );

$ship_unit->get_strike(666);
is( $ship_unit->life, 666000, 'Количество жизней изменилось до 666000' );
$ship_unit->is_dead(0); # Даже если объект получил критичное попадание и умер, оживляем
is( $ship_unit->is_dead, 0, 'Объект не мертв' );

$ship_unit->shoot_torpedo;
is( $ship_unit->torpedo->bullets_count, 49, 'Количество торпед не изменилось их 49' );

$ship_unit->shoot_big_gun;
is( $ship_unit->big_gun->bullets_count, 998, 'Количество ядер изменилось до 998' );
is( $ship_unit->big_gun->bullets_in_mag_count, 1, 'Количество ядер в магазине не изменилось, 1' );
is( $ship_unit->big_gun->bullets_in_mag_now, 1, 'Количество ядер сейчас в магазине не изменилось их 1' );
is( $ship_unit->big_gun->reload, 1, 'big_gun может перезяряжаться' );

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
$ship_unit->is_dead(0); # Оживляем для дальнейшей проверки

$ship_unit->kill_object;
is( $ship_unit->is_dead, 1, 'Объект мертв мы уничтожили' );
