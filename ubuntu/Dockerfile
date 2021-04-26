#####################################
# pFire Dockerfile

FROM ubuntu

ENV CPATH=$CPATH:/usr/lib/x86_64-linux-gnu/openmpi/include/
ENV MPI_HOME=/usr/lib/x86_64-linux-gnu/openmpi/include/

ENV PATH=$PATH:/pFIRE/bin

RUN   apt-get update  --yes && \
      DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata  \
      build-essential  libhdf5-openmpi-dev \ 
      cmake pkg-config git apt-utils git wget   \ 
      petsc-dev libboost-all-dev \
      libdcmtk-dev openmpi-bin  libopenmpi-dev \
      libopenimageio2.1 libopenimageio-dev openssh-server && \
      git clone -b v0.4.0  https://github.com/INSIGNEO/pFIRE.git && \
      cd pFIRE && mkdir build && cd build  && cmake -DPETSC_EXECUTABLE_RUNS:BOOL=Yes ../ && \
      make -j  && make install && \
      ctest -V -L serial
#########################################
# Setup SSH server

#RUN mkdir /var/run/sshd
#RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
#RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
#RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

#ENV NOTVISIBLE "in users profile"
#RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo "alias ll='ls -lrat'" >> /etc/profile

#EXPOSE 22
#CMD ["/usr/sbin/sshd", "-D"]
################################################################################



ENV CPATH=$CPATH:/usr/lib/x86_64-linux-gnu/openmpi/include/
ENV MPI_HOME=/usr/lib/x86_64-linux-gnu/openmpi/include/

ENV PATH=$PATH:/pFIRE/bin
      
#RUN apt-get install -y libopenimageio2.1 libopenimageio-dev && \
#     git clone -b v0.4.0  https://github.com/INSIGNEO/pFIRE.git && \
#    cd pFIRE && mkdir build && cd build  && cmake -DPETSC_EXECUTABLE_RUNS:BOOL=Yes ../ && \
#    make &&  \
#    ctest -V -L serial

ENTRYPOINT pfire

