# Infection Metabolic Atlas

Reproducibility repository for the manuscript:

**Conserved systemic metabolic programmes emerge from flexible immune-cell states across severe infection**

Author: **Soujanya Ghosh**

## Overview

This repository contains the analysis code, frozen pathway definitions, analysis manifests, quality-control summaries and derived results required to reproduce the principal computational findings of the manuscript. The study integrates public bulk and single-cell transcriptomic cohorts to examine conserved systemic metabolic programmes and context-dependent immune-cell states in severe infection.

The principal GEO datasets are:

- GSE134347 — systemic discovery cohort
- GSE279448 — independent bulk replication cohort
- GSE279452 — companion single-cell cohort and matched bulk/single-cell decomposition
- GSE290679 — independent ICU single-cell validation cohort
- GSE149689 — COVID-19/influenza cross-pathogen analysis
- GSE180578 — critical COVID-19 versus non-COVID ARDS validation
- GSE167363 — paired longitudinal gram-negative sepsis analysis
- GSE63042 / CAPSOD-related studies — orthogonal pathway-level context

Raw participant-level expression data are **not redistributed**. Download raw data directly from the original public repositories using the accession numbers above and the acquisition/audit scripts in `scripts/`.

## Repository structure

```text
infection-metabolic-atlas/
├── README.md
├── CITATION.cff
├── SCRIPT_MANIFEST.csv
├── requirements.txt
├── environment.yml
├── R_packages.txt
├── install_R_packages.R
├── .gitignore
├── scripts/                 # canonical analysis scripts
├── pathways/                # frozen pathway definitions
├── reproducibility/         # frozen outputs, manifests and QC summaries
└── docs/
    ├── CORE_PIPELINE.md
    ├── FIGURE_SOURCE_MAPPING.md
    └── DATA_DOWNLOAD.md
```

## Core analytical workflow

The repository preserves the original numbered scripts so the computational provenance is visible. The manuscript-relevant stages are summarized in `docs/CORE_PIPELINE.md`. Earlier numbered scripts include data acquisition, cohort auditing and exploratory analyses that led to the frozen final design; they are retained for transparency.

Key manuscript stages include:

1. **Pathway framework and systemic discovery** — pathway-library construction, GSE134347 processing and CAMERA analysis.
2. **Independent bulk replication** — GSE279448 processing and cross-cohort concordance.
3. **Single-cell lineage resolution** — GSE279452 donor-pseudobulk analysis and matched bulk/single-cell decomposition.
4. **Independent monocyte OXPHOS validation** — GSE290679.
5. **OXPHOS inversion analysis** — gene-level and mitochondrial-module decomposition.
6. **Cross-pathogen analysis** — GSE149689 COVID-19 and influenza.
7. **Adversarial and longitudinal validation** — GSE279452 leave-one-donor-out, GSE180578 and GSE167363.
8. **Orthogonal evidence and final synthesis** — CAPSOD-related evidence matrix and final integrated atlas.

## Software

The original project used Python 3.12 and R 4.3.3. Python dependencies are listed in `requirements.txt`; R/Bioconductor dependencies are listed in `R_packages.txt` and can be installed using `install_R_packages.R`.

The principal pathway-level inference used `limma::cameraPR` with ranks and an inter-gene correlation of 0.01. Donor, rather than cell, was the inferential unit for single-cell pseudobulk analyses.

## Reproducibility notes

- The strict metabolic universe was frozen before the final cross-cohort analyses.
- The frozen-five pathways were prespecified for targeted replication analyses.
- Single-cell inference uses donor-level pseudobulk profiles.
- RNA-based pathway scores are transcriptional pathway activity estimates and **not measured metabolic flux**.
- `mean_gene_z` values are standardized within individual analyses and should **not** be interpreted as a common cross-study effect-size scale.
- GSE180578 uses a **non-COVID ARDS** comparator; it is not described as uniformly noninfectious.
- CAPSOD-related plasma-omics evidence is cohort-related orthogonal support rather than donor-matched validation of monocyte OXPHOS.

## Data availability

All primary datasets are publicly available from NCBI GEO. The repository contains only code, small derived summary files and frozen analysis manifests required for reproducibility. Large raw and processed expression matrices are excluded from version control.

## Citation

Please cite the associated manuscript when available. Citation metadata are provided in `CITATION.cff`.
