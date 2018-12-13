# moodle-docker-cas: apereo/cas out of the box

This is a fork of the apereo/cas Docker image which works out of the box.

To run:
`
docker run --rm --name cas -p 8443:8443 -dt moodlehq/moodle-docker-cas
`

## Users
The image comes with a set of users out of the box:
- admin
- m1
- m2
- m3
- e1
- e2
- e3
- s1
- s2
- s3
- s4
- s5
- s6
- s7
- s8
- s9
- s10

The password for all users is `test`.

Users can be added by modifying the `/etc/cas/users/list` file within the image, or you can mount a volume to modify them locally:

`
docker run --rm --name cas -p 8443:8443 -dt --mount 'type=volume,src=/path/to/users,dst=/cas-overlay/etc/cas/users' moodlehq/moodle-docker-cas
`

## Moodle configuration
This image just maintains a flat file of users. It does not provide the means to create users in Moodle.
You will need to create users and set their authentication mechanism to cas for this to work.

`
$CFG->forced_plugin_settings = [
    'auth_cas' => [
        // CAS is only one of the enabled options for authentication.
        'multiauth' => 1,
        'hostname' => 'localhost',
        'baseuri' => 'cas/',
        'port' => '8443',
        'logoutcas' => 1,
        'logout_return_url' => $CFG->wwwroot,
    ],
];
`
