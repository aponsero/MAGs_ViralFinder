# MAGs_ViralFinder
Parallelized pipeline (SLURM scheduler) for MAGs viral detection and characterization

## Requirements
This pipeline requires a number of tools to function :
- virsorter2 
- vibrant

## Installation

### Conda environment
Create the conda environment

```bash
sbatch scripts/O_install.sh
```
## Run pipeline

Edit the config.sh file to specify input and output.
Run the viral detection using:

```bash
./1_Run_VirSorter2.sh
./2_Run_Vibrant.sh
```

summarize the results from the two tools using:

```bash
./3_collect_results.sh
```
