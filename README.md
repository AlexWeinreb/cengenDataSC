
# cengenDataSC

Data from the CeNGEN project as R objects.

## Installation

Install from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("AlexWeinreb/cengenDataSC")
```

## Example

Use `data()` to load the dataset of interest:

``` r
data("cengen_sc_2", package = "cengenDataSC")

dim(cengen_sc_2)
#> [1] 13669   128
```

You can use the binarized matrix to mask the TPM matrix, and obtain the
tables as available on the website:

``` r
data("cengen_TPM", package = "cengenDataSC")

cengen_TPM <- cengen_TPM[rownames(cengen_sc_2), - which(endsWith(colnames(cengen_TPM), "stressed"))]

(cengen_sc_2 * cengen_TPM)[1005:1010,1:5]
#>                  ADA    ADE   ADF   ADL   AFD
#> WBGene00003423  64.6   85.6  40.5  43.4 102.0
#> WBGene00012379   1.3    0.0  14.9   4.4  16.1
#> WBGene00006537 269.5 1889.8 276.7 224.4 322.1
#> WBGene00011367  39.2   30.9  15.2  22.3  23.8
#> WBGene00004322  13.7    8.9  12.3  20.0   0.0
#> WBGene00006811  86.7  101.4   0.0   0.0   0.0
```

## Additional informations and citation

Information on the website: <https://cengen.org>

See the preprint describing the data: [Taylor *et al.*, Molecular
topography of an entire nervous
system](https://www.biorxiv.org/content/10.1101/2020.12.15.422897v2).
