# Dockerfile for the pFire software
#
# Insigneo Institute for in silico medicine
# University of sheffield, UK
# Author: Daniele Tartarini. d.tartarini@sheffield.ac.uk
#
# Run instructions:
#     docker run -ti  image:tag  bash
#
# Continuous integration
#
# Jupyter notebook
#
################################################################################

#### Choose base image #########################################################
FROM centos as dev_sysop_image


LABEL maintainer="Daniele Tartarini <d.tartarini@sheffield.ac.uk>"
LABEL description="Development and Continuous integration environment"

#### Update images #############################################################
RUN yum install -y epel-release && \
    yum upgrade -y

#### Install dependencies
RUN yum install -y   make gcc-gfortran gcc-c++ wget curl valgrind-devel \
boost-devel.x86_64  gcc  python3 wget vim cmake3  glibc-langpack-en \
git wget valgrind python2 diffutils bzip2 unzip blas

#openmpi-devel
#openmpi   petsc-openmpi-devel    hdf5-openmpi-devel



#### Environment variables #####################################################
ENV  OPENBLAS_NUM_THREADS=1  \
	 OPENBLAS_VERBOSE=0 \
	 PETSC_VERSION=3.10.5 \
	 HDF5_VERSION=1.10.5

ENV PATH=$PATH:/usr/lib64/openmpi/bin/
ENV CPATH=$CPATH:/usr/include/openmpi-x86_64/
ENV CPATH=$CPATH:/usr/include/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/

# PATH /opt/rh/gcc-toolset-9/root/usr/bin/

# COPY files_from_context to_image_workdir

# Declare new image work dir
# WORKDIR to_image_workdir



#### HDF5 #####################################################################
# RUN mkdir -p /local/libs/hdf5-1_10_5
# RUN git clone https://bitbucket.hdfgroup.org/scm/hdffv/hdf5.git && git checkout hdf5-1_10_5 \
# && cd hdf5 && ./configure  --enable-parallel       --prefix=/local/libs/hdf5-1_10_5 && \
# RUN mkdir -j && make install 


#--enable-cxx



#### PETSc #####################################################################
ENV PETSC_TAG=v3.10.5
ENV PETSC_SRC="/local/petsc" 
RUN mkdir -p $PETSC_SRC && cd $PETSC_SRC
RUN echo "PETSC_DIR=$PETSC_DIR"
RUN echo "PETSC_SRC=$PETSC_SRC"


RUN cd $PETSC_SRC && \  
	git clone --branch $PETSC_TAG https://github.com/petsc/petsc.git ${PETSC_TAG} 
RUN cd  ${PETSC_SRC}/${PETSC_TAG} && \
  pwd 
  
RUN  cd ${PETSC_SRC}/${PETSC_TAG}  && \
	python2 ./configure --download-openmpi --download-fblaslapack --download-hdf5  
	#  

RUN ls -lrat  ${PETSC_SRC}/${PETSC_TAG}

RUN  cd ${PETSC_SRC}/${PETSC_TAG}   && \
	 make PETSC_DIR=/local/petsc/${PETSC_TAG} PETSC_ARCH=arch-linux2-c-debug all && \  
     make  OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1 OMPI_ALLOW_RUN_AS_ROOT=1 PETSC_DIR=${PETSC_SRC}/${PETSC_TAG} PETSC_ARCH=arch-linux2-c-debug check

 #--with-single-library
 
ENV PETSC_DIR=${PETSC_SRC}/${PETSC_TAG} 
ENV PETSC_ARCH=arch-linux2-c-debug 
ENV HDF5_ROOT=${PETSC_DIR}/${PETSC_ARCH}
ENV MPI_HOME=${PETSC_DIR}/${PETSC_ARCH}


ENV PATH=/usr/bin:/usr/local/bin:/bin:/usr/lib64/openmpi/bin



#### pFIRE  ####################################################################
# wget https://github.com/INSIGNEO/pFIRE/archive/v0.4.0.zip && unzip v0.4.0.zip && cd pFIRE-0.4.0

RUN mkdir -p /local

RUN echo ${HDF5_ROOT}  && \
    ls -lrat ${HDF5_ROOT}
    
RUN cd /local &&  git clone https://github.com/INSIGNEO/pFIRE.git && \
    cd pFIRE &&  mkdir -p build && cd build && cmake ../ && \
    make install && \
	ctest -V -L serial

#ENV PATH=${PATH}:
################################################################################

# cmake...

# CMD python /app/app.py

# VOLUME [ "/sys/fs/cgroup" ]

# To run software from within the image
# CMD ["/usr/sbin/init"]


# Use the official image as a parent image.
# FROM node:current-slim

# Set the working directory.
# WORKDIR /usr/src/app

# Copy the file from your host to your current location.
# COPY package.json .

# Run the command inside your image filesystem.
# RUN npm install

# Inform Docker that the container is listening on the specified port at runtime.
# EXPOSE 8080

# Run the specified command within the container.
# CMD [ "npm", "start" ]

# Copy the rest of your app's source code from your host to your image filesystem.
# COPY . .



