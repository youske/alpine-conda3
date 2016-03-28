# Alpine Linux glibc with conda
# frolvlad/alpine-glibc based

FROM frolvlad/alpine-glibc
MAINTAINER youske miyakoshi <youske@gmail.com>
ENV PATH=/opt/conda/bin:$PATH \
    LANG=C.UTF-8 \
    MINICONDA=Miniconda3-latest-Linux-x86_64.sh \
    APKINSTALL='bash wget libstdc++'
RUN adduser -D -h /home/admin -s /bin/bash admin admin
RUN apk add --no-cache $APKINSTALL && \
    wget -q --no-check-certificate https://repo.continuum.io/miniconda/$MINICONDA && \
    bash /$MINICONDA -b -p /opt/conda && \
    ln -s /opt/conda/bin/* /usr/local/bin/ && \
    rm -rf /root/.[acpw]* /$MINICONDA /opt/conda/pkgs/* && \
    conda update -q -y conda && \
    conda install -y virtualenv && \
    conda clean -itpsly
CMD ["bash"]
