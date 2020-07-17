# centos-base
FROM centos/s2i-base-centos7

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
COPY ./s2i/bin/ /usr/libexec/s2i

ARG USERNAME=systrans
ARG GROUPNAME=root
ARG USER_UID=1000
ARG USER_GID=0

RUN echo multilib_policy=all >> /etc/yum.conf && \
  yum clean all && \
  yum install -y openssl-devel.i686 net-snmp-devel.i686 mysql-devel && \
  yum install -y gcc-c++ gdb glibc-devel.i686 csh samba samba-client vim git file && \
  yum install -y epel-release && yum install -y --setopt=epel.sslverify=false gsoap-devel && \
  yum clean all && yum -y remove epel-release && yum clean all

#certificat ?
RUN \
  useradd --uid $USER_UID --gid $USER_GID -m $USERNAME && \
  echo "$USERNAME:$USERNAME" | chpasswd && \
  echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d &&  \
  chmod 0440 /etc/sudoers.d

#proxy ?

RUN \
  mkdir /u && \
  mkdir dev 
  #&& \
  #mkdir .ssh && \
  #chmod 700 .ssh && \
  #chown -R $USERNAME:$GROUPNAME . && \
  #chmod -R g+rX .

#install-sae.sh ?

USER systrans

#les ports?

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
