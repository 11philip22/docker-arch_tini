FROM archlinux/base

ADD tini /usr/bin/tini

ENTRYPOINT ["/usr/bin/tini", "--"]