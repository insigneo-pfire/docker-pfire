#!/usr/bin/env bash

singularity build -F base_centos8_for_pfire.sif  base_centos8_for_pfire.def  
singularity build -F base_centos8_openmpi_for_pfire.sif  base_centos8_openmpi_for_pfire.def 
singularity build -F base_openmpi_petsc_for_pfire.sif base_openmpi_petsc_for_pfire.def  
singularity build -F base_petsc_for_pfire.sif  base_petsc_for_pfire.def  
singularity build -F base_openmpi_petsc_dcmtk_oiio_for_pfire.sif base_openmpi_petsc_dcmtk_oiio_for_pfire.def
singularity build -F pfire_openmpi.sif pfire_openmpi.def
