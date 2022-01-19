# ------------------------- #
# Introduction to RBiotools #
# ------------------------- #


# This R script is intended to give you a quick start to using R, RStudio, and RBioTools and are a complement
# to the more detailed instructions. This sample R script assumes that you have completed all steps in 
# Section 1. Install R, R Studio, and other setup.



# -----2. Install the required packagers and RBiotools -----

# -----2.1 Install some basic dependencies that are required for RBiotools -----

  install.packages(c("rlang","ape", "data.table", "fmsb", "gplots", "ggplot2", "grImport", "gridExtra", "pheatmap", "RCurl", "rentrez", "seqinr"))
  
  install.packages(c("lattice","mgcv","nlme","survival"))

# -----2.2 Install msa and Biostrings package via BiocManager (and install BiocManager if it is not already installed) -----

  if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager", repos ="http://cran.us.r-project.org")
  
  BiocManager::install("msa", force = TRUE)
  BiocManager::install("Biostrings", force = TRUE)

# -----2.3 Install installr - needed to load RBiotools from tar.gz -----

  install.packages("installr")

# -----2.4 Load the msa and installr libraries -----

  ## this library call is required so the dendrogram will work
  library(msa) 
  
  
  ## this library call is required so we can install RBiotools from the zip source
  library(installr) 
  
# -----2.5 Set the working directory -----
  
  setwd("C://Temp//BMIG5101//") # change this line, as needed, so that the file path is correct for your computer
  
# -----2.6 Install the RBiotools package -----
  
  install.packages("RBiotools_0.5.0.tar.gz", repos = NULL, type = "source")
  
  
# -----2.7 Load the RBiotools library -----
  
  library(RBiotools) 
  




