# ==================================================================
# environment for duyena
# ------------------------------------------------------------------
# tensorflow    2.0-alpha-gpu
# python        3.7
# ==================================================================
FROM nvidia/cuda:10.0-cudnn7-devel-centos7

# ==================================================================
# proxy setting
# ------------------------------------------------------------------
ARG PROXY_SERVER
ENV http_proxy ${PROXY_SERVER}
ENV https_proxy ${PROXY_SERVER}
ENV LANG ko_KR.UTF-8
# ==================================================================
# locale
# ------------------------------------------------------------------
RUN localedef -i ko_KR -c -f UTF-8 \
              -A /usr/share/locale/locale.alias ko_KR.UTF-8 && \
# ==================================================================
# libs
# ------------------------------------------------------------------
    yum update -y && \
    yum install -y epel-release && \
    yum install -y wget && \
    yum install -y make && \
	yum install -y bzip2 && \
    yum install -y yum-utils && \
	yum install -y openssh-server

# ==================================================================
# anaconda3
# ------------------------------------------------------------------
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# ==================================================================
# install pytorch
# ------------------------------------------------------------------
RUN source ~/.bashrc && \
    conda install pytorch torchvision cudatoolkit=10.0 -c pytorch

# ==================================================================
# ssh
# ------------------------------------------------------------------
RUN mkdir /var/run/sshd && \
	/usr/bin/ssh-keygen -A
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
