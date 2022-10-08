FROM centos:7


# from https://github.com/tlaplus/tlaplus/releases#latest-tla-files
#RUN yum -y install wget
#RUN wget https://github.com/tlaplus/tlaplus/releases/download/v1.8.0/TLAToolbox-1.8.0-linux.gtk.x86_64.zip

COPY TLAToolbox-1.8.0-linux.gtk.x86_64.zip /opt

WORKDIR /opt

# need "unzip" to extract files
RUN yum -y install unzip
RUN unzip TLAToolbox-1.8.0-linux.gtk.x86_64.zip

WORKDIR /opt/toolbox

# to run the files from the .zip, Java is needed.
# options are listed on https://phoenixnap.com/kb/how-to-install-java-centos-8
RUN yum -y install unzip java-11-openjdk-devel
# which produces
# java -version
# openjdk version "11.0.16.1" 2022-08-12 LTS
# OpenJDK Runtime Environment (Red_Hat-11.0.16.1.1-1.el7_9) (build 11.0.16.1+1-LTS)
# OpenJDK 64-Bit Server VM (Red_Hat-11.0.16.1.1-1.el7_9) (build 11.0.16.1+1-LTS, mixed mode, sharing)

# and is missing Java's SWT, Standard Widget Toolkit
#RUN yum -y install gtk2 libXtst
# as per https://stackoverflow.com/a/65690989/1164295



#########################
# as per
# https://github.com/tlaplus-workshops/ewd998/blob/main/.devcontainer/install.sh
# only 
RUN yum -y install texlive-latex-recommended
# is needed


#RUN yum -y install texlive \
#                   texlive-latex \
#                   texlive-xetex \
#                   texlive-collection-latex \ 
#                   texlive-collection-latexrecommended \
#                   texlive-xetex-def \
#                   texlive-collection-xetex



