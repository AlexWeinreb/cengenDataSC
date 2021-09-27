# Note: 300MB file to download!
path_cds <- tempfile()

download.file("http://storage.cengen.org/092320_L4_neuron_only_monocle_cds_for_paper.rds",
              path_cds)

# requires Monocle installed
cds <- readRDS(path_cds)

cell.assignments <- colData(cds)[, "Cell.type"]


cell.assignments[cell.assignments %in% c('AWC_OFF', 'AWC_ON')] <- 'AWC'
cell.assignments[cell.assignments %in% c('DA', 'DA9')] <- 'DA'
cell.assignments[cell.assignments %in% c('DB', 'DB01')] <- 'DB'
cell.assignments[cell.assignments %in% c('IL2_DV', 'IL2_LR')] <- 'IL2'
cell.assignments[cell.assignments %in% c('RMD_DV', 'RMD_LR')] <- 'RMD'
cell.assignments[cell.assignments %in% c('RME_DV', 'RME_LR')] <- 'RME'
cell.assignments[cell.assignments %in% c('VA', 'VA12')] <- 'VA'
cell.assignments[cell.assignments %in% c('VB', 'VB01', 'VB02')] <- 'VB'
cell.assignments[cell.assignments %in% c('VC', 'VC_4_5')] <- 'VC'


if (!(class(cell.assignments) %in% c("factor", "integer", "character"))) {
  message("class(colData(cds)[, colData.column]) must be factor, integer, or character")
}

if (class(cell.assignments) == "factor") {
  unique.assignments <- levels(cell.assignments)
} else {
  unique.assignments <- sort(setdiff(unique(cell.assignments), NA))
}



norm.expr <- exprs(cds)
norm.expr@x <- norm.expr@x / rep.int(colData(cds)$Size_Factor, diff(norm.expr@p))

facet.norm.expr <- list()
for (facet in unique.assignments) {
  facet.norm.expr[[facet]] = norm.expr[, !is.na(cell.assignments) & cell.assignments == facet]
}

norm.means <- sapply(unique.assignments, function(facet) {
  Matrix::rowMeans(facet.norm.expr[[facet]])
})

cengen_TPM <- sweep(norm.means, 2, colSums(norm.means), "/") * 1000000

new_columns <- cbind(DD = cengen_TPM[,'VD_DD'],
                     VD = cengen_TPM[,'VD_DD'])

res <- cbind(cengen_TPM[ , - which(colnames(cengen_TPM) %in% c('VD_DD'))],
                         new_columns)


cengen_TPM_bulk <- res[,order(colnames(res))]
usethis::use_data(cengen_TPM_bulk, overwrite = TRUE)
