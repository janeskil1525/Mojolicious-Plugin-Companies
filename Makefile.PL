use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojolicious::Plugin::Companies',
  VERSION_FROM => 'lib/Mojolicious/Plugin/Companies.pm',
  AUTHOR       => 'A Good Programmer <nospam@cpan.org>',
  PREREQ_PM    => {
    'Mojolicious' => '7.72',
    'Daje::Model::Companies' => 0,
  },
  test         => {TESTS => 't/*.t'}
);
