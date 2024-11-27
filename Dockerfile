# syntax=docker/dockerfile:1

ARG PANDOC_VERSION=latest-ubuntu
# FROM --platform=$BUILDPLATFORM pandoc/extra:${PANDOC_VERSION}
FROM pandoc/extra:${PANDOC_VERSION}

# Install additional TeX packages for japanese support using tlmgr
# texlive-ja: for Japanese support
# jvlisting: for listings in Japanese
# cjk: for CJK support
# xecjk: for XeLaTeX with CJK support
# collection-langjapanese: for Japanese language support
# collection-fontsrecommended: for recommended fonts
# collection-⁠fontsextra: for additional fonts
RUN set -e \
    && tlmgr update --self --all \
    && tlmgr install \
        texlive-ja \
        jvlisting \
        cjk \
        xecjk \
        collection-langjapanese \
        collection-fontsrecommended \
        collection-fontsextra \
    && tlmgr backup --clean --all

# Install additional packages
RUN set -e \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        fontconfig \
        fonts-noto \
        fonts-noto-cjk \
        fonts-noto-cjk-extra \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && fc-cache -f
