#!/usr/bin/perl

use Moose;
use Data::Dumper;

use Vehicle::Tank;
use Vehicle::Ship;
use Vehicle::Jet;
use Vehicle::Art;

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
# Печатаем танк
print Data::Dumper::Dumper( $tank_unit );
print "Наносим 35 урона\n";
$tank_unit->get_strike(35);
print Data::Dumper::Dumper( $tank_unit );
print "Стреляем пулеметом\n";
$tank_unit->shoot_mashine_gun;
$tank_unit->shoot_mashine_gun;
print "Стреляем пушкой\n";
$tank_unit->shoot_big_gun;
print "Стреляем пулеметом\n";
foreach (1..140) {
    $tank_unit->shoot_mashine_gun;
}
print "Наносим 60 урона\n";
$tank_unit->get_strike(60);
print Data::Dumper::Dumper( $tank_unit );
print "Заставляем танк двигаться\n";
$tank_unit->move;
print "Заставляем танк двигаться методом tank_go\n";
$tank_unit->tank_go;


print "======================================\n";
my $ship_unit = Vehicle::Ship->new(model_name=>'Черная жемчужина',
                        speed=>'10000',
                        thickness=>'1000',
                        life=>'666666',
                        big_gun => BigGun->new (
                            type => 'Ядовитое ядро',
                            bullets_count => '1000'),
                        torpedo => Torpedo->new (
                            type => 'Megaboom',
                            bullets_count => '50')
                        );
# Печатаем корабль
print Data::Dumper::Dumper( $ship_unit );
print "Нанесли 666 урона\n";
$ship_unit->get_strike(666);
print Data::Dumper::Dumper( $ship_unit );
print "Заставляем корабль двигаться методом swim\n";
$ship_unit->swim;
print "Заставляем корабль двигаться методом tank_go\n";
$ship_unit->tank_go;
print "Нанесли 666 урона\n";
$ship_unit->get_strike(666);
print Data::Dumper::Dumper( $ship_unit );
print "Нанесли 666 урона\n";
$ship_unit->get_strike(666);
print Data::Dumper::Dumper( $ship_unit );


print "======================================\n";
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
# Печатаем самолет
print Data::Dumper::Dumper( $jet_unit );
print "Нанесли 35 урона\n";
$jet_unit->get_strike(35);
print Data::Dumper::Dumper( $jet_unit );
print "Нанесли 60 урона\n";
$jet_unit->get_strike(60);
print "Заставляем самолет двигаться методом art_go\n";
$jet_unit->art_go;
print Data::Dumper::Dumper( $jet_unit );


print "======================================\n";
my $art_unit = Vehicle::Art->new(
                        model_name=>'Гаубица-D78000',
                        speed=>'60',
                        thickness=>'800',
                        life=>'9874',
                        big_gun => BigGun->new (
                            type => 'ядро',
                            bullets_count => '20')
                        );
# Печатаем самолет
print Data::Dumper::Dumper( $art_unit );
print "Нанесли 85 урона\n";
$art_unit->get_strike(85);
print Data::Dumper::Dumper( $art_unit );
print "Нанесли 99 урона\n";
$art_unit->get_strike(99);
print "Заставляем артиллерию двигаться\n";
$art_unit->move;
print "Заставляем артиллерию стрелять из пушки\n";
$art_unit->shoot_big_gun;
foreach (1..25) {
    $art_unit->shoot_big_gun;
}
print "Нанесли 999999999999 урона\n";
$art_unit->get_strike(999999999999);
print Data::Dumper::Dumper( $art_unit );
print "Нанесли 1 урона\n";
$art_unit->get_strike(1);
print Data::Dumper::Dumper( $art_unit );
print "Заставляем артиллерию двигаться методом swim\n";
$art_unit->swim;
print "Нанесли 10 урона\n";
$art_unit->get_strike(10);
print Data::Dumper::Dumper( $art_unit );
