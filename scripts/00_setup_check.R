# Purpose: Check R version, install/load required packages, and save session information.

cat("Starting Mission 0 setup check...\n\n")

# Check R version
cat("R version:\n")
print(R.version.string)

# Required packages for this portfolio project
required_packages <- c(
  "Seurat",
  "tidyverse",
  "patchwork",
  "here",
  "Matrix",
  "ggplot2",
  "renv"
)

# Install missing packages
installed_packages <- rownames(installed.packages())
missing_packages <- setdiff(required_packages, installed_packages)

if (length(missing_packages) > 0) {
  cat("\nInstalling missing packages:\n")
  print(missing_packages)
  install.packages(missing_packages)
} else {
  print("All required packages are already installed.")
}

# Load packages
cat("\nLoading packages...\n")

for (pkg in required_packages) {
  suppressPackageStartupMessages(
    library(pkg, character.only = TRUE)
  )
  cat("Loaded:", pkg, "\n")
}

# Save session info
session_info_path <- "outputs/sessionInfo_mission0.txt"
writeLines(capture.output(sessionInfo()), session_info_path)

cat("Session info saved to:", session_info_path, "\n")

# Initialize renv and snapshot the current state of the project
renv::init()
renv::snapshot()