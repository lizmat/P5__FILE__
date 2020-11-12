use v6.*;
use Test;
use P5__FILE__;

plan 8;

ok defined(::('&term:<__PACKAGE__>')),
  'is __PACKAGE__ imported?';
ok !defined(P5__FILE__::{'&term:<__PACKAGE__>'}),
  '__PACKAGE__ externally NOT accessible?';
ok defined(::('&term:<__FILE__>')),
  'is __FILE__ imported?';
ok !defined(P5__FILE__::{'&term:<__FILE__>'}),
  '__FILE__ externally NOT accessible?';
ok defined(::('&term:<__LINE__>')),
  'is __LINE__ imported?';
ok !defined(P5__FILE__::{'&term:<__LINE__>'}),
  '__LINE__ externally NOT accessible?';
ok defined(::('&term:<__SUB__>')),
  'is __SUB__ imported?';
ok !defined(P5__FILE__::{'&term:<__SUB__>'}),
  '__SUB__ externally NOT accessible?';

# vim: expandtab shiftwidth=4
