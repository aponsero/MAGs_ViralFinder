#!/bin/bash -l
#SBATCH --job-name=VirSorter
#SBATCH --account=
#SBATCH --output=errout/outputr%j.txt
#SBATCH --error=errout/errors_%j.txt
#SBATCH --partition=small
#SBATCH --time=20:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1000


# load job configuration
cd $SLURM_SUBMIT_DIR
source config/config.sh

# load environment
source $CONDA/etc/profile.d/conda.sh
conda activate viral

# echo for log
echo "job started"; hostname; date

# Get sample ID 
export FAMID=`head -n +${SLURM_ARRAY_TASK_ID} $IN_LIST | tail -n 1`

# create output directories
VS_DIR="$IN_DIR/${FAMID}_MAGs/VirSorter2"
if [[ ! -d "$VS_DIR" ]]
then
        mkdir $VS_DIR
fi

# run VS2
cd "$IN_DIR/${FAMID}_MAGs"

for f in *.fa
do
	VS_OUT="$VS_DIR/${f%%.fa}"
	virsorter run -w $VS_OUT -i $f --min-length 1500 -j 4 all
done




# echo for log
echo "job done"; date

