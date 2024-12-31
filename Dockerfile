# syntax=docker/dockerfile:1

ARG PANDOC_VERSION=latest-ubuntu
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
        fontconfig=2.15.0-1.1ubuntu2 \
        fonts-noto=20201225-2 \
        fonts-noto-cjk=1:20230817+repack1-3 \
        fonts-noto-cjk-extra=1:20230817+repack1-3 \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && fc-cache -f
