ARG CNPG_TAG

FROM ghcr.io/cloudnative-pg/postgresql:$CNPG_TAG-system-bookworm

ARG CNPG_TAG
ARG VECTORCHORD_TAG
ARG TARGETARCH

# drop to root to install packages
USER root
ADD https://github.com/tensorchord/VectorChord/releases/download/$VECTORCHORD_TAG/postgresql-${CNPG_TAG%.*}-vchord_${VECTORCHORD_TAG#"v"}-1_$TARGETARCH.deb /tmp/vchord.deb
RUN apt-get install -y /tmp/vchord.deb && rm -f /tmp/vchord.deb

USER postgres

