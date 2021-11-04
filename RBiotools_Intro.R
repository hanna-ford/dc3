# ------------------------- #
# Introduction to RBiotools #
# ------------------------- #

# RBiotools is a package for COMPARATIVE MICROBIAL GENOMICS
# RBiotools works best in the RStudio integrated development environment
# ----------------------------------------------------------------------

# To use RBiotools ...
#  Install the package using
#  * RStudio "Packages" tab (top of lower left quadrant)
#  * "Install" panel ("Install from Package Archive File")
#  * "Browse" button (to find package archive in your file system)
#  * "Install" button
# ----------------------------------------------------------------

# Load RBiotools
# --------------
library(RBiotools)

# For RBiotools documentation:
#   Use the RStudio "Packages" tab, scroll to and click on RBiotools,
#     then click on function of interest
# -------------------------------------------------------------------

# Choose a directory / folder that will be used for some of the figures,
#   including Heat Maps and Genome Atlases:
#     * Create this directory on your computer, if it does not already exist
#     * Make this directory the "Working Directory"
# --------------------------------------------------------------------------
setwd("~/R_repository")   # Example of a Working Directory on a Mac
                          # The contents of this directory can be accessed
                          #   using the "Files" tab in the lower left quadrant


# RBiotools works with IDs from GenBank, the NIH genetic sequence data base,
#   to perform analyses and create figures.

# ------------------------- #
# Choose a set of organisms #
# ------------------------- #
#  * Organisms are specified with GenBank identifiers 
#  * Organisms NOT in Genbank can be added with the RBiotools addGenome function
# ------------------------------------------------------------------------------

# Sample sets of organisms
# ------------------------

# In the following statement:
#   "myGenomes" is an arbitrary variable name
#   "c" is an R function to "combine" things into a list
#   Comments are for the user's benefit and are NOT required
#   Items in a list DO NOT have to be on separate lines

# A list of E. coli organisms (with additional information in comments)
myGenomes <- c(
  "AP012306",  # Escherichia coli str. K-12 substr. MDS42 DNA         3.976 Mb - smallest chromosome
  "KK583188",  # Escherichia coli DSM 30083 = JCM 1649 = ATCC 11775   4.907 Mb - type strain scaffold
  "U00096",    # Escherichia coli str. K-12 substr. MG1655            4.642 Mb - first E. coli genome sequenced
  "CP000802",  # Escherichia coli HS                                  4.644 Mb - group A representative, commensal
  "CP000800"   # Escherichia coli E24377A                             4.980 Mb - group B1 representative
)

# A longer list ...
#   Note: If the earlier statement has been executed, this statement redefines the value of the variable "myGenomes"
myGenomes <- c(
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

# A list of organisms that are not as closely related
# Representatives of Proteobacteria classes
# -----------------------------------------
myGenomes <- c(
  "CP018228", # Rhizobium leguminosarum strain Vaf-108              Phylum: Proteobacteria (alpha)
  "CP017405", # Bordetella pertussis strain J448                    Phylum: Proteobacteria (beta)
  "CP008957", # Escherichia coli O157:H7 str. EDL933                Phylum: Proteobacteria (gamma)
  "HG530068", # Pseudomonas aeruginosa PA38182                      Phylum: Proteobacteria (gamma)
  "CP002031", # Geobacter sulfurreducens KN400                      Phylum: Proteobacteria (delta)
  "CP002332"  # Helicobacter pylori Gambia94/24                     Phylum: Proteobacteria (epsilon)
)


# --------------------------------------------- #
# Explore functions that make plots and figures #
# --------------------------------------------- #

# Plot a dendrogram using 16S rRNA genes
# --------------------------------------
dendrogram16S(myGenomes)

# Check the values of your variables and the RBiotools global data structures
#   using the "Environment" tab in the upper right quadrant of RStudio



# Create a Genome Atlas for a genome
# ----------------------------------
genome <- "AP012306"
createAtlas(genome)

# Note: To view this Genome Atlas, which is in an SVG file ... (this works on a Mac)
#   * Open a browser ... Safari, Chrome, Firefox, ...
#   * Click "File" in the menu bar and choose "Open File ..." from the pull-down menu
#   * Navigate to your Working Directory
#   * Double-click on "GenomeAtlas_AP012306.svg"



# Plot amino acid usage
#   Note: The plotUsage function has many options. See the plotUsage documentation.
# ---------------------------------------------------------------------------------
plotUsage(myGenomes)



# Create a codon heat map
#   Note: Heat Maps work best for groups of organisms that are NOT closely related
# --------------------------------------------------------------------------------
plotHeatMapCodon(myGenomes)

# Note: The heat map is now in your Working Directory
#   * Click on the "Files" tab in the lower left quadrant
#   * Navigate to your Working Directory
#     ... you may need to click on the name of your Working Directory to update it
#   * Click on the "HeatMapCodon.png" file



# Plot a Blast Matrix for a set of organisms
#   Note: Blast Matrices work best for groups of closely related organisms
# ------------------------------------------------------------------------

# Step 1: Build a "homology matrix", a table where
#  * each table row is a protein group
#  * each table column is an organism
#  * each table entry is the number of an organism's proteins in a group
# ----------------------------------------------------------------------
proteinGrouping <- runLinclust(myGenomes)

# Step 2: Use the homology matrix to plot the Blast Matrix
# --------------------------------------------------------
plotBlastMatrix(proteinGrouping)

# There is now an SVG file in your working directory called "BlastMatrix.svg
#   Open it in a browser.
# --------------------------------------------------------------------------



# ------------------------- #
# Other RBiotools functions #
# ------------------------- #

# RBiotools functions that work on a single organism:
# * createAtlas
# * downloadGenBank
# * plotUsage
# * runProdigal
# * runRNAmmer

# RBiotools functions that work on groups of organisms:
# * downloadGenBank
# * plotHeatMapAA
# * plotHeatMapBias
# * plotHeatMapCodon
# * plotUsage
# * runLinclust
# * runProdigal
# * runRNAmmer

# RBiotools functions that work with a "homology matrix" created by runLinclust:
# * plotBlastMatrix
# * plotPanCore

# There are other RBiotools functions, but you will use them only rarely.
# For more information, check RBiotools documention, accessible from the
#   "Packages" or "Help" tabs in the lower right quadrant of RStudio.
# -----------------------------------------------------------------------
