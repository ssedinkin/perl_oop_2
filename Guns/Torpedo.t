#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Guns::Torpedo');

my $torpedo0 = Torpedo->new;

isa_ok( $torpedo0, 'Torpedo' );

my $torpedo = Torpedo->new(
                        type=>'Megaboom',
                        bullets_count=>'3',
                        );

isa_ok( $torpedo, 'Torpedo' );

is( $torpedo->type, 'Megaboom', 'Тип оружия Megaboom, корректен' );
is( $torpedo->bullets_count, 3, 'Количество патронов 3, корректно' );

can_ok( $torpedo, 'shoot_torpedo' );
can_ok( $torpedo, 'aim' );
