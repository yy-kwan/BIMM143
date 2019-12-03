Class 11: Structural Bioinformatics 1
================

## The PDB database for biomolecular structure data

> Q1: determine the percentage of structures solved by X-Ray and
> Electron Microscopy. X-ray is 89%. Electron Microscopy is 2% Determine
> what proportion of structures are protein? 92.71%

``` r
data<-read.csv("Data Export Summary.csv",row.names=1)
data
```

    ##                     Proteins Nucleic.Acids Protein.NA.Complex Other  Total
    ## X-Ray                 131278          2059               6759     8 140104
    ## NMR                    11235          1303                261     8  12807
    ## Electron Microscopy     2899            32                999     0   3930
    ## Other                    280             4                  6    13    303
    ## Multi Method             144             5                  2     1    152

Total number of entries

``` r
sum(data$Total)
```

    ## [1] 157296

Proportion of entries from each ethod

``` r
round((data$Total/sum(data$Total))*100)
```

    ## [1] 89  8  2  0  0

Proportion that are protein

``` r
round((sum(data$Proteins)/sum(data$Total))*100,2)
```

    ## [1] 92.71

\#\#HIV-Pr Structure

\#\#Here we will read the 1HSG PDB structure and select the protein
component and write out a new protein-only PDB format file. We then do
the same for the ligand (i.e. known drug molecule) creating a
ligand-only PDB file.

``` r
library(bio3d)
pdb<-read.pdb("1hsg.pdb")
```

\#MK1 is the compound

``` r
ligand<-atom.select(pdb,"ligand",value=TRUE)
write.pdb(ligand,file="1hsg_ligand.pdb")
```
