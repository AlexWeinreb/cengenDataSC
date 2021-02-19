# Load the CeNGEN data from scRNA-Seq thresholded with threshold 3 (more conservative),
# and save it as a matrix.

tib <- readr::read_csv("http://storage.cengen.org/021821_conservative_threshold3.csv")
tib <- dplyr::select(tib, -X1, -gene_name)
cengen_sc_3 <- as.matrix(tib[,-1])
rownames(cengen_sc_3) <- tib$Wormbase_ID

# Store the binary matrix, it is much smaller in size.
# This binary matrix can be used as a mask on the TPM matrix to
# recover the same file as available at cengen.org
cengen_sc_3 <- cengen_sc_3 > 0

usethis::use_data(cengen_sc_3, overwrite = TRUE)
