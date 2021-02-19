# Load the CeNGEN data from scRNA-Seq thresholded with threshold 1 (the most liberal),
# and save it as a matrix.

tib <- readr::read_csv("http://storage.cengen.org/021821_liberal_threshold1.csv")
tib <- dplyr::select(tib, -X1, -gene_name)
cengen_sc_1 <- as.matrix(tib[,-1])
rownames(cengen_sc_1) <- tib$Wormbase_ID

# Store the binary matrix, it is much smaller in size.
# This binary matrix can be used as a mask on the TPM matrix to
# recover the same file as available at cengen.org
cengen_sc_1 <- cengen_sc_1 > 0

usethis::use_data(cengen_sc_1, overwrite = TRUE)
