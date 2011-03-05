#!/usr/bin/perl -w

package Logger;
sub new { bless {} }
sub debug {
# Debug
#    print $_[1]."\n"
}
1;

use strict;
use warnings;

use Test::More;

my $maxHost = 255;

my $skipReason = '';
if (!$ENV{TEST_AUTHOR}) {
    $skipReason = 'Author test. Set $ENV{TEST_AUTHOR} to a true value to run. ';
}
if ($^O !~ /(linux|mswin32)/i) {
    $skipReason .= 'Test not supported on this OS.';
}
plan(skip_all => $skipReason) if $skipReason;


use FusionInventory::Agent::Task::OcsDeploy::P2P;


my @ipToTestList;


my $begin = time();
foreach (1..$maxHost) {
    push @ipToTestList, "10.0.2.".$_;
}

my $logger = Logger->new();
my $host = FusionInventory::Agent::Task::OcsDeploy::P2P::scan({
        port => 7788,
        logger => $logger,
        orderId => 1,
        fragId => 1,
	testP2P => 1
        }
        , @ipToTestList);
is($host, "209.85.227.101", "loop still works after the full scan.");
my $done = time();
printf("%d hosts scanned at %.2f host/s\n", $maxHost, ($maxHost+1) / ($done - $begin));
done_testing();
