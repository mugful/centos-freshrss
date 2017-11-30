centos-selfoss
==============

A selfoss RSS/Atom reader container image built on top of CentOS.

Build
-----

    git clone https://github.com/dockingbay/centos-selfoss
    cd centos-selfoss
    docker build --force-rm -t dockingbay/centos-selfoss:latest .

Configure
---------

The container is pre-configured with very basic httpd serving the
Selfoss via HTTP. It is recommended to *not* expose it directly to the
internet. Either preface it with a https proxy when using it, and you
might also want something like HTTP Basic auth to only serve it to
your target users. Or you can mount custom
`/etc/httpd/conf/httpd.conf` file, keys, and certificates to make the
container serve Selfoss via proper HTTPS with your desired httpd
configuration.

Run
---

This will serve Selfoss on localhost:8080, and you can put an HTTPS
reverse proxy in front of it. If you mount the full data directory in,
make sure it has the structure expected by Selfoss, as it will not
create the subdirectories by itself.

    mkdir /var/lib/selfoss
    mkdir /var/lib/selfoss/{cache,favicons,fulltextrss,logs,sqlite,thumbnails}
    mkdir /var/lib/selfoss/fulltextrss/{custom,standard}

    docker run -d \
        --name my_selfoss \
        -v /var/lib/selfoss:/var/www/selfoss/data:Z
        -p 127.0.0.1:8080:80 \
        dockingbay/centos-selfoss
