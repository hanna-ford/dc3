# ------------------------- #
# Introduction to RBiotools #
# ------------------------- #


# This R script is intended to give you a quick start to using R, RStudio, and RBioTools and are a complement
# to the more detailed instructions. This sample R script assumes that you have completed all steps in 
# Section 1. Install R, R Studio, and other setup.


# -------------------------------------- #
# -----2. Install the required packagers and RBiotools -----
# -------------------------------------- #



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
  
  install.packages("RBiotools_0.5.3.tar.gz", repos = NULL, type = "source")
  
  
  
# -----2.7 Load the RBiotools library -----
  
  library(RBiotools) 
  

  
# -------------------------------------- #
# -----3. Identify the organisms -----
# -------------------------------------- #  

  
  
# -----3.1 Create a list of similar organisms -----
  
  eColi <- c(
    "AP012306",  # Escherichia coli str. K-12 substr. MDS42 DNA         3.976 Mb - smallest chromosome
    "KK583188",  # Escherichia coli DSM 30083 = JCM 1649 = ATCC 11775   4.907 Mb - type strain scaffold
    "U00096",    # Escherichia coli str. K-12 substr. MG1655            4.642 Mb - first E. coli genome sequenced
    "CP000802",  # Escherichia coli HS                                  4.644 Mb - group A representative, commensal
    "CP000800",  # Escherichia coli E24377A                             4.980 Mb - group B1 representative
    "AP009378",  # Escherichia coli SE15                                4.717 Mb - group B2 representative, commensal
    "FM180568",  # Escherichia coli 0127:H6 E2348/69                    4.966 Mb - group B2 representative, enteropathogenic
    "CU928163",  # Escherichia coli UMN026                              5.202 Mb - group D representative
    "CP008957",  # Escherichia coli O157:H7 str. EDL933                 5.547 Mp - group E representative
    "CP027027",  # Shigella dysenteriae strain E670/74                  5.037 Mb - Shigella dysenteria representative
    "CP026802",  # Shigella sonnei strain ATCC 29930                    4.975 Mb - Shigella sonnei representative
    "CP026877",  # Shigella boydii strain ATCC 35964                    5.129 Mb - Shigella boydii representative
    "CP026793",  # Shigella flexneri strain 74-1170                     4.734 Mb - Shigella flexneri representative
    "CP015831"   # Escherichia coli O157 strain 644-PT8                 5.831 Mb - largest chromosome
  )
  
  
  
# -----3.2 Create a list of dissimilar organisms -----
  
  proteobacteria <- c(
    "CP018228", # Rhizobium leguminosarum strain Vaf-108              Phylum: Proteobacteria (alpha)
    "CP017405", # Bordetella pertussis strain J448                    Phylum: Proteobacteria (beta)
    "CP008957", # Escherichia coli O157:H7 str. EDL933                Phylum: Proteobacteria (gamma)
    "HG530068", # Pseudomonas aeruginosa PA38182                      Phylum: Proteobacteria (gamma)
    "CP002031", # Geobacter sulfurreducens KN400                      Phylum: Proteobacteria (delta)
    "CP002332"  # Helicobacter pylori Gambia94/24                     Phylum: Proteobacteria (epsilon)
  )
  
  
  
# -----3.3 Verify list items by downloading genomic information from GenBank -----
  
  downloadGenBank(eColi) # note that this is calling the whole list
  
  downloadGenBank(proteobacteria) # note that this is calling the whole list
  
  
  
# -----3.4 View the downloaded information -----
  
  View(orgData.df)
  
  View(orgName.df)
  
  

# -------------------------------------- #
# -----4. Explore functions that make plots and figures -----
# -------------------------------------- #  
  
  
  
# -----4.1 Dendrograms -----
  
  dendrogram16S(eColi) # note that this is calling the whole list
  
  dendrogram16S(proteobacteria) # note that this is calling the whole list
  
  
  
# -----4.2 Genome Atlas -----
  
  createAtlas(eColi[1]) # here we index into the list to select the first item, AP012306. # note that this is indexing into the list for a single item
  
  createAtlas("AP012306") # here we hard code the accession ID from GenBank to create a genome atlas for an item that may or may not already in a list. 

  

# -----4.3 Amino Acid Usage Plot -----
  
  plotUsage(eColi[1]) # note that this is indexing into the list for a single item
  

    
# -----4.4 Codon Heat Map -----
  
  plotHeatMapCodon(proteobacteria) # note that this is calling the whole list to produce the Codon Heat Map
  
  
# -----4.5 Blast Matrix -----

  # -----4.5.1 Build the homology matrix -----  
  
  proteinGrouping <- runLinclust(eColi) # note that this is calling the whole list
  
  # -----4.5.2 Plot the Blast Matrix from the homology matrix -----  
  
  plotBlastMatrix(proteinGrouping) 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


