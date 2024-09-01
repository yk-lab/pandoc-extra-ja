ARG PANDOC_VERSION=latest

FROM pandoc/extra:${PANDOC_VERSION}

# Install additional packages
# font-noto: for Noto fonts
RUN set -e \
    && apk update \
    && apk add --no-cache \
        fontconfig=2.14.2 \
        font-noto=24.9.1 \
        font-noto-cjk=24.9.1 \
    && fc-cache -f \
    && rm -rf /var/cache/apk/*

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
