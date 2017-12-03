centos-freshrss
==============

A freshrss RSS/Atom reader container image built on top of CentOS.

Build
-----

    git clone https://github.com/dockingbay/centos-freshrss
    cd centos-freshrss
    docker build --force-rm -t dockingbay/centos-freshrss:latest .

Configure
---------

The container is pre-configured with very basic httpd serving the
Freshrss via HTTP. It is recommended to *not* expose it directly to the
internet. Either preface it with a https proxy when using it, and you
might also want something like HTTP Basic auth to only serve it to
your target users. Or you can mount custom
`/etc/httpd/conf/httpd.conf` file, keys, and certificates to make the
container serve Freshrss via proper HTTPS with your desired httpd
configuration.

Run
---

This will serve Freshrss on localhost:8080, and you can put an HTTPS
reverse proxy in front of it.

    mkdir /var/lib/freshrss

    docker run -d \
        --name my_freshrss \
        -v /var/lib/freshrss:/var/www/freshrss/data:Z
        -p 127.0.0.1:8080:80 \
        dockingbay/centos-freshrss
