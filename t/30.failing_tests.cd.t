use strict;
use warnings;

use Test::More 1.302015;
use lib qw(t/lib);
use TDCSTest;

plan skip_all => 'IN DEVELOPMENT';

# evil globals
my ($schema, $artist, $cd);

$schema = TDCSTest->init_schema();

ok(defined $schema, q{schema object defined});

use Test::DBIx::Class::Schema;

# create a new test object
my $schematest = Test::DBIx::Class::Schema->new({
    # required
    schema    => $schema,
    namespace => 'TDCSTest::Schema',
    moniker   => 'CD',
});

# tell it what to test
$schematest->methods({
    columns => [qw(
        cdid
        artistid
        title
        year
    )],

    relations => [qw(
        artist_broken_self
        artist_broken_foreign
    )],

    custom => [
    ],

    resultsets => [
    ],
});

# run the tests
$schematest->run_tests();
