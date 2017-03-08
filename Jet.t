#!/usr/bin/perl

use Moose;
use Data::Dumper;
use Test::More qw(no_plan);

use_ok ('Vehicle::Jet');

my $jet_unit = Vehicle::Jet->new(
                        model_name=>'Fighting Falcon',
                        speed=>'10000',
                        thickness=>'23',
                        life=>'500',
                        mashine_gun => MashineGun->new (
                            type => 'пули',
                            bullets_count => '9999',
                            bullets_in_mag_count => '300'),
                        rocket => Rocket->new (
                            type => 'Воздух-земля',
                            bullets_count => '50')
                        );

isa_ok( $jet_unit, 'Vehicle::Jet' );

is_deeply( $jet_unit->mashine_gun, {
                        type => 'пули',
                        bullets_count => 9699,
                        bullets_in_mag_count => 300,
                        bullets_in_mag_now => 300,
                        },
                        'mashine_gun исправен'
);

is_deeply( $jet_unit->rocket, {
                        type => 'Воздух-земля',
                        bullets_count => 50,
                        },
                        'rocket исправен'
);

is( $jet_unit->model_name, 'Fighting Falcon', 'Название модели корректно' );
is( $jet_unit->speed, 10000, 'Скорость корректна' );
is( $jet_unit->thickness, 23, 'Броня корректна' );
is( $jet_unit->life, 500, 'Количество жизней корректно' );
is( $jet_unit->is_dead, 0, 'Объект не мертв' );

can_ok( $jet_unit, 'BUILD' );
can_ok( $jet_unit, 'move' );
can_ok( $jet_unit, 'fly' );
can_ok( $jet_unit, 'swim' );
can_ok( $jet_unit, 'art_go' );
can_ok( $jet_unit, 'tank_go' );
can_ok( $jet_unit, 'get_strike' );
can_ok( $jet_unit, 'is_critical_damage' );
can_ok( $jet_unit, 'kill_object' );

can_ok( $jet_unit->mashine_gun, 'shoot' );
can_ok( $jet_unit->mashine_gun, 'aim' );
can_ok( $jet_unit->rocket, 'shoot' );
can_ok( $jet_unit->rocket, 'aim' );

$jet_unit->get_strike(50);
is( $jet_unit->life, 450, 'Количество жизней изменилось до 450' );
$jet_unit->is_dead(0); # Даже если объект получил критичное попадание и умер, оживляем
is( $jet_unit->is_dead, 0, 'Объект не мертв' );

$jet_unit->shoot_rocket;
is( $jet_unit->rocket->bullets_count, 49, 'Количество торпед не изменилось их 49' );

$jet_unit->shoot_mashine_gun;
is( $jet_unit->mashine_gun->bullets_count, 9699, 'Количество пуль изменилось до 9699' );
is( $jet_unit->mashine_gun->bullets_in_mag_count, 300, 'Количество пуль в магазине не изменилось их 300' );
is( $jet_unit->mashine_gun->bullets_in_mag_now, 299, 'Количество пуль сейчас в магазине изменилось до 299' );
is( $jet_unit->mashine_gun->reload, 1, 'mashine_gun может перезяряжаться' );

$jet_unit->move;
$jet_unit->fly;
is( $jet_unit->is_dead, 0, 'Объект не мертв' );
$jet_unit->art_go;
is( $jet_unit->is_dead, 1, 'Объект мертв развалился' );
$jet_unit->is_dead(0); # Оживляем для дальнейшей проверки
$jet_unit->tank_go;
is( $jet_unit->is_dead, 1, 'Объект мертв разбился' );
$jet_unit->is_dead(0); # Оживляем для дальнейшей проверки
$jet_unit->swim;
is( $jet_unit->is_dead, 1, 'Объект мертв утонул' );
$jet_unit->is_dead(0); # Оживляем для дальнейшей проверки

$jet_unit->kill_object;
is( $jet_unit->is_dead, 1, 'Объект мертв мы уничтожили' );
