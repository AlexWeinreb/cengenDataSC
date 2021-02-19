#' CeNGEN single-cell thresholded expression.
#'
#' Binarized expression of each gene in each neuron type of C. elegans by single-cell RNA-Seq.
#'
#' @section Details:
#' The proportion of cells from each cluster containing at
#' least 1 UMI for that gene was thresholded at several levels (from 1, the most
#' permissive, to 4, the most stringent). A value of FALSE indicates the gene is not expressed
#' in that cluster, a value of TRUE indicates it is expressed.
#'
#' The dataset named `cengen_sc_n` indicates thresholding with threshold `n`. The dataset
#' named `cengen_sc_n_bulk` contains the same values as `cengen_sc_n`, but the columns names
#' have been changed to match those of bulk sequencing (some subtypes are not separate).
#'
#' @format A matrix with one row per gene and one column by single-cell cluster:
#' \describe{
#'   \item{row name}{Wormbase ID of the gene}
#'   \item{column name}{cluster identification, usually corresponds to a neuron type}
#'   \item{value}{FALSE if the gene was below the threshold level, TRUE if it was above}
#' }
#' @source \url{https://cengen.org}
#' @name cengen_sc
NULL

#' @rdname cengen_sc
"cengen_sc_1"
#' @rdname cengen_sc
"cengen_sc_2"
#' @rdname cengen_sc
"cengen_sc_3"
#' @rdname cengen_sc
"cengen_sc_4"
#' @rdname cengen_sc
"cengen_sc_1_bulk"
#' @rdname cengen_sc
"cengen_sc_2_bulk"
#' @rdname cengen_sc
"cengen_sc_3_bulk"
#' @rdname cengen_sc
"cengen_sc_4_bulk"


#' CeNGEN single-cell expression level.
#'
#' Normalized expression of each gene in each neuron type of C. elegans by single-cell RNA-Seq.
#'
#' @section Details:
#' A normalized value of the mRNA count of each gene in each neuron type. \emph{TPM} indicates a
#' normalization by individual cell and for each neuron type. \emph{proportion} indicates the
#' proportion of cells in each cluster where at least 1 UMI was detected. \emph{UMI} indicates the
#' total (non-normalized) number of UMIs detected in the cluster. Finally, \emph{nCells} gives the
#' total number of cells in each cluster (it is thus not a measure of expression level).
#'
#' The dataset named `cengen_xx` indicates the expression levels are given with normalization `xx`.
#' The dataset named `cengen_xx_bulk` contains the same values as `cengen_xx`, but the columns names
#' have been changed to match those of bulk sequencing (some subtypes are not separate).
#'
#' @section Note:
#' The thresholded tables available on the CeNGEN website contain this value of TPM
#' for the genes above the threshold.
#'
#' @format A matrix with one row per gene and one column by single-cell cluster:
#' \describe{
#'   \item{row name}{Wormbase ID of the gene}
#'   \item{column name}{cluster identification, usually corresponds to a neuron type}
#'   \item{value}{normalized gene expression level}
#' }
#' @source \url{https://cengen.org}
#' @name cengen_expression
NULL

#' @rdname cengen_expression
"cengen_TPM"
#' @rdname cengen_expression
"cengen_proportion"
#' @rdname cengen_expression
"cengen_UMI"
#' @rdname cengen_expression
"cengen_nCells"


#' @rdname cengen_expression
"cengen_TPM_bulk"
#' @rdname cengen_expression
"cengen_proportion_bulk"
#' @rdname cengen_expression
"cengen_UMI_bulk"
#' @rdname cengen_expression
"cengen_nCells_bulk"
