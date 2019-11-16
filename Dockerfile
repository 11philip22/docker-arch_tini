FROM archlinux/base

ENV TINI_VERSION v0.18.0

# Add Tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin/tini
RUN chmod +x /usr/local/bin/tini

ENTRYPOINT ["usr/local/bin/tini", "--"]