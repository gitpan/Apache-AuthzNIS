use ExtUtils::MakeMaker;

print "Checking for Net::NIS ........ ";
eval {
    require Net::NIS;
};
if ($@) {
    print "failed\n";
    print <<EOT;
$@
The Net::NIS module is required for this module to work properly.
You can obtain this module from CPAN as "NIS-a2".  It claims to be
an alpha release, but it looks like there's been no need to
update it since 10-Nov-95.
EOT
    exit;
} else {
    print " ok\n";
}

print "Checking for Apache::AuthenNIS ........ ";
eval {
    require Apache::AuthenNIS;
};
if ($@) {
    print "failed\n";
    print <<EOT;
$@
You probably need the Apache::AuthenNIS module.

It would be pretty strange to authorize users based on a users
membership in an NIS group, without having authenticated them
against the NIS passwd first, but I suppose it's possbile.

If in doubt, get and install Apache::AuthenNIS module first.
EOT
} else {
    print " ok\n";
}

WriteMakefile(
    'NAME'	=> 'Apache::AuthzNIS',
    'VERSION_FROM' => 'AuthzNIS.pm', # finds $VERSION
    'dist' => {COMPRESS => 'gzip', SUFFIX => 'gz'}
);
