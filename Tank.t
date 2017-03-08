#!/usr/bin/perl

use Moose;
use Data::Dumper;
use Test::More qw(no_plan);

use_ok ('Vehicle::Tank');

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

is_deeply( $tank_unit->big_gun, {
                        type => 'ядро',
                        bullets_count => 9,
                        bullets_in_mag_count => 1,
                        bullets_in_mag_now => 1,
                        },
                        'big_gun исправен'
);

is_deeply( $tank_unit->mashine_gun, {
                        type => 'пули',
                        bullets_count => 70,
                        bullets_in_mag_count => 30,
                        bullets_in_mag_now => 30,
                        },
                        'mashine_gun исправен'
);

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

can_ok( $tank_unit->big_gun, 'shoot' );
can_ok( $tank_unit->big_gun, 'aim' );
can_ok( $tank_unit->mashine_gun, 'shoot' );
can_ok( $tank_unit->mashine_gun, 'aim' );

$tank_unit->get_strike(35);
is( $tank_unit->life, 965, 'Количество жизней изменилось до 965' );
$tank_unit->is_dead(0); # Даже если объект получил критичное попадание и умер, оживляем
is( $tank_unit->is_dead, 0, 'Объект не мертв' );

$tank_unit->shoot_mashine_gun;
is( $tank_unit->mashine_gun->bullets_count, 70, 'Количество пуль изменилось до 70' );
is( $tank_unit->mashine_gun->bullets_in_mag_count, 30, 'Количество пуль в магазине не изменилось их 30' );
is( $tank_unit->mashine_gun->bullets_in_mag_now, 29, 'Количество пуль сейчас в магазине изменилось до 29' );
is( $tank_unit->mashine_gun->reload, 1, 'mashine_gun может перезяряжаться' );

$tank_unit->shoot_big_gun;
is( $tank_unit->big_gun->bullets_count, 8, 'Количество ядер изменилось до 8' );
is( $tank_unit->big_gun->bullets_in_mag_count, 1, 'Количество ядер в магазине не изменилось, 1' );
is( $tank_unit->big_gun->bullets_in_mag_now, 1, 'Количество ядер сейчас в магазине не изменилось их 1' );
is( $tank_unit->big_gun->reload, 1, 'big_gun может перезяряжаться' );

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
$tank_unit->is_dead(0); # Оживляем для дальнейшей проверки

$tank_unit->kill_object;
is( $tank_unit->is_dead, 1, 'Объект мертв мы уничтожили' );
