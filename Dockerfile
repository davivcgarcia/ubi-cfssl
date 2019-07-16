FROM registry.access.redhat.com/ubi8/ubi AS builder

RUN yum -y module install go-toolset:rhel8 && \
    yum -y install git make && \
    yum -y clean all

ENV cfssl_release 1.3.4

RUN git clone --depth 1 --branch ${cfssl_release} \
        https://github.com/cloudflare/cfssl.git \
        /root/go/src/github.com/cloudflare/cfssl && \
    cd /root/go/src/github.com/cloudflare/cfssl && \
    make

FROM registry.access.redhat.com/ubi8/ubi-minimal

COPY --from=builder /root/go/src/github.com/cloudflare/cfssl/bin /usr/local/bin/

RUN echo 'cfssl:x:10000:100:CFSSL Nonprivileged User:/:/bin/bash' >> /etc/passwd

USER cfssl
WORKDIR /tmp/cfssl

ENTRYPOINT ["cfssl"]
CMD ["--help"]
