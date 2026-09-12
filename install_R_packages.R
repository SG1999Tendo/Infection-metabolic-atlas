cran_pkgs <- c("data.table", "ggplot2", "Matrix", "msigdbr")
missing_cran <- cran_pkgs[!vapply(cran_pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_cran)) install.packages(missing_cran, repos = "https://cloud.r-project.org")

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager", repos = "https://cloud.r-project.org")
}

bioc_pkgs <- c(
  "limma", "DESeq2", "AnnotationDbi", "org.Hs.eg.db",
  "hta20transcriptcluster.db", "rhdf5", "DropletUtils"
)
missing_bioc <- bioc_pkgs[!vapply(bioc_pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_bioc)) BiocManager::install(missing_bioc, ask = FALSE, update = FALSE)
