#!/usr/bin/perl

use Test::More qw(no_plan);
use_ok ('Moose');
use_ok ('Data::Dumper');

use_ok ('Reloadable');

my $reloadable_gun_1 = Reloadable->new;

isa_ok( $reloadable_gun_1, 'Reloadable' );

my $reloadable_gun_2 = Reloadable->new(
                        type=>'Оружие Reload T',
                        bullets_count=>7,
                        bullets_in_mag_count=>3,
                        );

isa_ok( $reloadable_gun_2, 'Reloadable' );

is( $reloadable_gun_2->type, 'Оружие Reload T', 'Тип оружия Оружие Reload T, корректен' );
is( $reloadable_gun_2->bullets_count, 4, 'Количество дополнительных патронов 4 осталось, корректно' );
is( $reloadable_gun_2->bullets_in_mag_count, 3, 'Количество патронов в магазине 3, корректно' );
is( $reloadable_gun_2->bullets_in_mag_now, 3, 'Количество патронов заряжено сейчас 3, корректно' );

can_ok( $reloadable_gun_2, 'BUILD' );
can_ok( $reloadable_gun_2, 'shoot' );
can_ok( $reloadable_gun_2, 'reload' );
can_ok( $reloadable_gun_2, 'aim' );

is( $reloadable_gun_2->aim, 1, 'Прицелились' );

is( $reloadable_gun_2->shoot, 1, 'Выстрел корретен' );
is( $reloadable_gun_2->bullets_count, 4, 'Количество дополнительных патронов 4 осталось, корректно' );
is( $reloadable_gun_2->bullets_in_mag_count, 3, 'Количество патронов в магазине 3, корректно' );
is( $reloadable_gun_2->bullets_in_mag_now, 2, 'Количество патронов заряжено сейчас 2, корректно' );
is( $reloadable_gun_2->shoot, 1, 'Выстрел корретен' );
$reloadable_gun_2->bullets_in_mag_now(0);
is( $reloadable_gun_2->shoot, 0, 'Выстрел невозможен, в магазине пусто' );

is( $reloadable_gun_2->reload, 1, 'Перезарядили полным магазином' );
is( $reloadable_gun_2->bullets_in_mag_count, 3, 'Количество патронов в магазине 3, корректно' );
is( $reloadable_gun_2->bullets_in_mag_now, 3, 'Количество патронов заряжено сейчас 3, корректно' );
is( $reloadable_gun_2->bullets_count, 1, 'Количество дополнительных патронов 1 осталось, корректно' );

is( $reloadable_gun_2->reload, 2, 'Перезарядили неполным магазином' );
is( $reloadable_gun_2->bullets_count, 0, 'Количество дополнительных патронов 0 осталось, корректно' );

is( $reloadable_gun_2->shoot, 1, 'Выстрел корретен' );

is( $reloadable_gun_2->shoot, 0, 'Выстрелить нечем' );
is( $reloadable_gun_2->reload, 0, 'Перезарядить нечем' );
