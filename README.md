# davivcgarcia/ubi-cfssl [![Docker Repository on Quay](https://quay.io/repository/davivcgarcia/ubi-cfssl/status "Docker Repository on Quay")](https://quay.io/repository/davivcgarcia/ubi-cfssl)

Unofficial container image for [Cloudflare's PKI and TLS toolkit (cfssl)](https://github.com/cloudflare/cfssl) based on [Red Hat Universal Base Image (UBI)](https://www.redhat.com/en/blog/introducing-red-hat-universal-base-image) instead of the stock [Docker Golang image](https://hub.docker.com/_/golang).

This image uses multistage build to optimize the final image size, and uses [Quay.io](quay.io) as registry. Due some limitations, the image build process is not fully automated. New images will be released a few days after its upstream repository.

```bash
docker pull quay.io/davivcgarcia/ubi-cfssl
```

For detailed usage, please refer to `cfssl` documentation.
