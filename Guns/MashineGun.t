#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Guns::MashineGun');

my $mashine_gun0 = MashineGun->new;

isa_ok( $mashine_gun0, 'MashineGun' );

my $mashine_gun = MashineGun->new(
                        type=>'пули',
                        bullets_count=>'30',
                        bullets_in_mag_count=>5,
                        );

isa_ok( $mashine_gun, 'MashineGun' );

is( $mashine_gun->type, 'пули', 'Тип оружия пули, корректен' );

is( $mashine_gun->bullets_count, 25, 'Количество дополнительных патронов 25 осталось, корректно' );
is( $mashine_gun->bullets_in_mag_count, 5, 'Количество патронов в магазине 5, корректно' );
is( $mashine_gun->bullets_in_mag_now, 5, 'Количество патронов заряжено сейчас 5, корректно' );


can_ok( $mashine_gun, 'shoot_mashine_gun' );
can_ok( $mashine_gun, 'BUILD' );
can_ok( $mashine_gun, 'reload' );
can_ok( $mashine_gun, 'aim' );
