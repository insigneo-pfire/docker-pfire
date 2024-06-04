wget https://github.com/insigneo-pfire/pFIRE/archive/refs/tags/v0.4.0.tar.gz
wget https://github.com/insigneo-pfire/pFIRE/archive/refs/tags/v0.5.0.tar.gz
wget https://github.com/insigneo-pfire/pFIRE/archive/refs/tags/v0.6.0_rc1.tar.gz

wget https://codeload.github.com/insigneo-pfire/pFIRE/zip/refs/heads/test_framework_fix  -O pfire_test_framework_fix.zip
wget https://codeload.github.com/insigneo-pfire/pFIRE/zip/refs/heads/master -O pfire_master.zip

wget https://gitlab.kitware.com/xdmf/xdmf/-/archive/master/xdmf-master.tar.gz

PETSC_VERSION=3.11.0
 
wget -O petsc-lite-${PETSC_VERSION}.tar.gz http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-${PETSC_VERSION}.tar.gz
wget  http://ftp.mcs.anl.gov/pub/petsc/externalpackages/f2cblaslapack-3.4.2.q3.tar.gz