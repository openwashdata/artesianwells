# CLAUDE.md

`artesianwells` is an openwashdata R data package with site assessment data on artesian wells: location, structure, use and management.

## Package facts

- Raw data: `data-raw/mapping artesian wells.csv`.
- Processing script: `data-raw/data_processing.R`. It reads the raw data and writes `data/artesianwells.rda` and the CSV and XLSX exports in `inst/extdata/`.
- Data dictionary: `data-raw/dictionary.csv`.
- Branches: work and review PRs go to `dev`; `main` holds released versions.

## Reviews and releases

Reviews and releases follow the installed pkgreview skills. `/review-package` starts a review, `/review-issue` works through one review issue, `/create-release` makes a release and `/add-doi` adds the Zenodo DOI. The skills hold the steps and the current standards, so this file does not repeat them.
