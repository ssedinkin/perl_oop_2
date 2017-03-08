#!/usr/bin/perl

use Moose;
use Data::Dumper;
use Test::More qw(no_plan);

use_ok ('Vehicle::Art');

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

is_deeply( $art_unit->big_gun, {
                        type => 'ядро',
                        bullets_count => 19,
                        bullets_in_mag_count => 1,
                        bullets_in_mag_now => 1,
                        },
                        'big_gun исправен'
);

is( $art_unit->model_name, 'Гаубица-D78000', 'Название модели корректно' );
is( $art_unit->speed, 60, 'Скорость корректна' );
is( $art_unit->thickness, 800, 'Броня корректна' );
is( $art_unit->life, 9874, 'Количество жизней корректно' );
is( $art_unit->is_dead, 0, 'Объект не мертв' );

can_ok( $art_unit, 'BUILD' );
can_ok( $art_unit, 'move' );
can_ok( $art_unit, 'fly' );
can_ok( $art_unit, 'swim' );
can_ok( $art_unit, 'art_go' );
can_ok( $art_unit, 'tank_go' );
can_ok( $art_unit, 'get_strike' );
can_ok( $art_unit, 'is_critical_damage' );
can_ok( $art_unit, 'kill_object' );

can_ok( $art_unit->big_gun, 'shoot' );
can_ok( $art_unit->big_gun, 'aim' );

$art_unit->get_strike(1000);
is( $art_unit->life, 8874, 'Количество жизней изменилось до 8874' );
$art_unit->is_dead(0); # Даже если объект получил критичное попадание и умер, оживляем
is( $art_unit->is_dead, 0, 'Объект не мертв' );

$art_unit->shoot_big_gun;
is( $art_unit->big_gun->bullets_count, 18, 'Количество ядер изменилось до 18' );
is( $art_unit->big_gun->bullets_in_mag_count, 1, 'Количество ядер в магазине не изменилось, 1' );
is( $art_unit->big_gun->bullets_in_mag_now, 1, 'Количество ядер сейчас в магазине не изменилось их 1' );
is( $art_unit->big_gun->reload, 1, 'big_gun может перезяряжаться' );

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
$art_unit->is_dead(0); # Оживляем для дальнейшей проверки

$art_unit->kill_object;
is( $art_unit->is_dead, 1, 'Объект мертв мы уничтожили' );
