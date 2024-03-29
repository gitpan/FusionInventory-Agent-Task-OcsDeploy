use inc::Module::Install;

my $version = $FusionInventory::Agent::Task::OcsDeploy;

name 'FusionInventory-Agent-Task-OcsDeploy';

include 'Module::AutoInstall';

abstract 'OCS Software deployment support for FusionInventory Agent';
license 'gpl';
version_from 'lib/FusionInventory/Agent/Task/OcsDeploy.pm';

perl_version '5.006';
requires 'FusionInventory::Agent' => '2.1.8';
requires 'Digest::MD5' => undef;
requires 'XML::Simple' => undef;
requires 'File::Copy' => undef;
requires 'File::Glob' => undef;
requires 'File::Path' => undef;
requires 'File::Copy::Recursive' => undef;
requires 'Archive::Extract' => undef;
recommends 'POE' => undef;
recommends 'POE::Component::Client::Ping' => undef;
recommends 'POE::Component::Client::HTTP' => undef;
WriteAll;

