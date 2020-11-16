FROM debian:stable-slim

ENV LANG en_US.utf8
ENV NOMAD_URL https://releases.hashicorp.com/nomad/0.12.8/nomad_0.12.8_linux_amd64.zip

COPY bashrc /root/.bashrc

RUN apt update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

RUN curl -kL ${NOMAD_URL} -o nomad.zip ; \
	unzip nomad.zip; \
	mv nomad /usr/local/bin/nomad; \
  rm nomad.zip

ENTRYPOINT ["/usr/local/bin/nomad"]
CMD ["help"]
