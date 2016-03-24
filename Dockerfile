FROM ubuntu-debootstrap:14.04

COPY ./steps/001_base /tmp/
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /tmp/001_base

COPY ./steps/002_locales /tmp/
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /tmp/002_locales && rm -rf /var/lib/apt/lists/*

COPY ./steps/003_node /tmp/
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /tmp/003_node && rm -rf /var/lib/apt/lists/*

COPY ./steps/004_rproc /tmp/
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /tmp/004_rproc && rm -rf /var/lib/apt/lists/*

COPY ./steps/005_cleanup /tmp/
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /tmp/005_cleanup && rm -rf /var/lib/apt/lists/*
