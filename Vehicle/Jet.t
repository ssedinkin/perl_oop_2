#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Vehicle::Jet');

my $jet_unit_0 = Vehicle::Jet->new;

isa_ok( $jet_unit_0, 'Vehicle::Jet' );


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
isa_ok( $jet_unit->mashine_gun, 'MashineGun' );
isa_ok( $jet_unit->rocket, 'Rocket' );

is( $jet_unit->shoot_rocket, 1, 'Стрелять ракетами можно' );
is( $jet_unit->shoot_mashine_gun, 1, 'Стрелять из пулемета можно' );

is( $jet_unit->model_name, 'Fighting Falcon', 'Название модели Fighting Falcon, корректно' );
is( $jet_unit->speed, 10000, 'Скорость 10000, корректна' );
is( $jet_unit->thickness, 23, 'Броня 23, корректна' );
is( $jet_unit->life, 500, 'Количество жизней 500, корректно' );
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

is( $jet_unit->shoot_rocket, 0, 'Объект мертв. Стрелять ракетами нельзя' );
is( $jet_unit->shoot_mashine_gun, 0, 'Объект мертв. Стрелять из пулемета нельзя' );
