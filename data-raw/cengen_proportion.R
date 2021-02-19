
# Note: 300MB file to download!
path_cds <- tempfile()

download.file("http://storage.cengen.org/092320_L4_neuron_only_monocle_cds_for_paper.rds",
              path_cds)

# requires Monocle installed
cds <- readRDS(path_cds)


# This code was written by the Monocle lab developers
# see also the companion code to the paper: https://github.com/cengenproject/Initial_single_cell_analysis/blob/main/Merging_experiments_annotation_aggregate_data.R

cell.assignments = colData(cds)[, "Cell.type"]

if (!(class(cell.assignments) %in% c("factor", "integer", "character"))) {
  message("class(colData(cds)[, colData.column]) must be factor, integer, or character")
}

if (class(cell.assignments) == "factor") {
  unique.assignments = levels(cell.assignments)
} else {
  unique.assignments = sort(setdiff(unique(cell.assignments), NA))
}

norm.expr = exprs(cds)
norm.expr@x = norm.expr@x / rep.int(colData(cds)$Size_Factor, diff(norm.expr@p))

facet.norm.expr = list()
for (facet in unique.assignments) {
  facet.norm.expr[[facet]] = norm.expr[, !is.na(cell.assignments) & cell.assignments == facet]
}

cengen_proportion <- sapply(unique.assignments, function(facet) {
  apply(facet.norm.expr[[facet]], 1, function(x) sum(x > 0) / length(x))
})


usethis::use_data(cengen_proportion, overwrite = TRUE)
