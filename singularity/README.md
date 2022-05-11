# Singularity container for pFIRE

This folder contains the definition file for generating a singularity container.
The definition file is divided in different stages reduce the building time and simplify the generation of container base on different OS version and libraries.
 
 The pFIRE container can be generated in this way:
 

```


singularity build  base_centos8_for_pfire.sif           base_centos8_for_pfire.def
singularity build  base_openmpi_petsc_for_pfire.sif     base_openmpi_petsc_for_pfire.def
singularity build  base_centos8_openmpi_for_pfire.sif  base_centos8_openmpi_for_pfire.def
singularity build  pfire_openmpi.sif                    pfire_openmpi.def


```

to start a shell in the container:

```

singularity shell pfire_openmpi.sif 

```

then you can use pFIRE as you  would normally do on a shell.


