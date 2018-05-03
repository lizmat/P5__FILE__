use v6.c;
use Test;
use P5__FILE__;

plan 2;

module Foo {
    is __PACKAGE__, $?PACKAGE.^name,    'did we get the right package';
    is __FILE__,    $?FILE.IO.relative, 'did we get the right file';
    is __LINE__,    $?LINE,             'did we get the right line';
}


# vim: ft=perl6 expandtab sw=4
