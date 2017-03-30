#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Guns::BigGun');

my $big_gun0 = BigGun->new;

isa_ok( $big_gun0, 'BigGun' );

my $big_gun = BigGun->new(
                        type=>'пули',
                        bullets_count=>'30',
                        bullets_in_mag_count=>1,
                        );

isa_ok( $big_gun, 'BigGun' );

is( $big_gun->type, 'пули', 'Тип оружия пули, корректен' );

is( $big_gun->bullets_count, 29, 'Количество дополнительных патронов 29 осталось, корректно' );
is( $big_gun->bullets_in_mag_count, 1, 'Количество патронов в магазине 1, корректно' );
is( $big_gun->bullets_in_mag_now, 1, 'Количество патронов заряжено сейчас 1, корректно' );


can_ok( $big_gun, 'shoot_big_gun' );
can_ok( $big_gun, 'BUILD' );
can_ok( $big_gun, 'reload' );
can_ok( $big_gun, 'aim' );
