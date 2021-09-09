use v6.*;
unit module P5__FILE__:ver<0.0.6>:auth<zef:lizmat>;

my sub term:<__PACKAGE__>() is export {
    my $n = 0;
    while callframe(++$n) -> $frame {
        if $frame.my<$?PACKAGE>:exists {
            my $name = $frame.my<$?PACKAGE>.^name;
            return $name eq 'GLOBAL' ?? 'main' !! $name;
        }
        elsif $frame.code -> $code {
            return $code.package.^name if $code ~~ Routine;
        }
        else {
            return 'main';
        }
    }
}
my sub term:<__FILE__>() is export {
    callframe(1).file
}
my sub term:<__LINE__>() is export {
    callframe(1).line
}
my sub term:<__SUB__>() is export {
    my $n = 0;
    while callframe(++$n).code -> $code {
        return $code.name if $code ~~ Routine;
    }
    Nil
}

=begin pod

=head1 NAME

Raku port of Perl's __FILE__ and associated functionality

=head1 SYNOPSIS

  use P5__FILE__;  # exports __FILE__, __LINE__, __PACKAGE__, __SUB__

=head1 DESCRIPTION

This module tries to mimic the behaviour of Perl's C<__FILE__>, C<__LINE__>,
C<__PACKAGE__> and C<__SUB__> functionality as closely as possible in Raku.

=head1 TERMS

=head2 __PACKAGE__

A special token that returns the name of the package in which it occurs.

=head3 Raku

    $?PACKAGE.^name

Because C<$?PACKAGE> gives you the actual C<Package> object (which can be
used for introspection), you need to call the C<.^name> method to get a
string with the name of the package.

=head2 __FILE__

A special token that returns the name of the file in which it occurs.

=head3 Raku

    $?FILE

=head2 __LINE__

A special token that compiles to the current line number.

=head3 Raku

    $?LINE

=head2 __SUB__

A special token that returns a reference to the current subroutine, or
"undef" outside of a subroutine.

=head3 Raku

    &?ROUTINE

Because C<&?ROUTINE> gives you the actual C<Routine> object (which can be
used for introspection), you need to call the C<.name> method to get a
string with the name of the subroutine.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/P5__FILE__ . Comments and
Pull Requests are welcome.

=head1 COPYRIGHT AND LICENSE

Copyright 2018, 2019, 2020, 2021 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
