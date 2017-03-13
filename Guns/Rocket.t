#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Guns::Rocket');

my $rocket0 = Rocket->new;

isa_ok( $rocket0, 'Rocket' );

my $rocket = Rocket->new(
                        type=>'Воздух-земля',
                        bullets_count=>'3',
                        );

isa_ok( $rocket, 'Rocket' );

is( $rocket->type, 'Воздух-земля', 'Тип оружия Воздух-земля, корректен' );
is( $rocket->bullets_count, 3, 'Количество патронов 3, корректно' );

can_ok( $rocket, 'shoot_rocket' );
can_ok( $rocket, 'aim' );
