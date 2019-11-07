Untitled
================

``` r
library(bio3d)

#download the PDB file
get.pdb("1hsg")
```

    ## Warning in get.pdb("1hsg"): ./1hsg.pdb exists. Skipping download

    ## [1] "./1hsg.pdb"

``` r
pdb<-read.pdb("1hsg.pdb")
protein<-atom.select(pdb,"protein",value=TRUE)
write.pdb(protein,file="1hsg_protein.pdb")
```

and for the ligand.

``` r
ligand<-atom.select(pdb,"ligand",value=TRUE)
write.pdb(ligand,file="1hsg_protein.pdb")
```

## Process our docing results

``` r
library(bio3d)
res <- read.pdb("all.pdbqt", multi=TRUE)
write.pdb(res, "results.pdb")
```
