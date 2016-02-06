# VCF PCA
# Load the R packages: gdsfmt and SNPRelate
biocLite("gdsfmt")
biocLite("SNPRelate")
library(gdsfmt)
library(SNPRelate)

snpgdsSummary(snpgdsExampleFileName())
# example vcf
vcf.fn <- system.file("extdata", "sequence.vcf", package="SNPRelate")
#reformat to exact bi-allelic and polymorhpic SNP data 

# Open the GDS file
genofile <- snpgdsOpen(snpgdsExampleFileName())
snpgdsVCF2GDS(vcf.fn, "test.gds", method="biallelic.only")
set.seed(1000)
# Try different LD thresholds for sensitivity analysis
snpset <- snpgdsLDpruning(genofile, ld.threshold=0.2)

# contigs for snpset
names(snpset)
# Get all selected snp id
snpset.id <- unlist(snpset)

# Run PCA
pca <- snpgdsPCA(genofile, snp.id=snpset.id, num.thread=2)