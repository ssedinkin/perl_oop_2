#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Guns');

my $unknown_gun_1 = Guns->new;

isa_ok( $unknown_gun_1, 'Guns' );

my $unknown_gun_2 = Guns->new(
                        type=>'Оружие XTT',
                        bullets_count=>'3',
                        );

isa_ok( $unknown_gun_2, 'Guns' );

is( $unknown_gun_2->type, 'Оружие XTT', 'Тип оружия Оружие XTT, корректен' );
is( $unknown_gun_2->bullets_count, 3, 'Количество патронов 3, корректно' );

can_ok( $unknown_gun_2, 'shoot' );
can_ok( $unknown_gun_2, 'aim' );

is( $unknown_gun_2->aim, 1, 'Прицелился' );

is( $unknown_gun_2->shoot, 1, 'Выстрелил' );
is( $unknown_gun_2->bullets_count, 2, 'Количество патронов 2, корректно' );
is( $unknown_gun_2->shoot, 1, 'Выстрелил' );
is( $unknown_gun_2->shoot, 1, 'Выстрелил' );
is( $unknown_gun_2->bullets_count, 0, 'Количество патронов 0, корректно' );
is( $unknown_gun_2->shoot, 0, 'Патронов нет, выстрел невозможен' );
