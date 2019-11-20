FROM archlinux/base

ENV TINI_VERSION v0.18.0

# Add Tini
ADD tini /usr/bin/tini

ENTRYPOINT ["usr/bin/tini", "--"]