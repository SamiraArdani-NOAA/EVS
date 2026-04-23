#PBS -N jevs_prep_rtofs
#PBS -j oe
#PBS -S /bin/bash
#PBS -q dev
#PBS -A VERF-DEV
#PBS -l walltime=04:25:00
#PBS -l place=shared,select=1:ncpus=1:mem=200GB
#PBS -l debug=true

############################################################
# Load modules
############################################################
set -x

export HOMEevs=/lfs/h2/emc/vpppg/noscrub/$USER/EVS
source $HOMEevs/versions/run.ver

module reset
module load PrgEnv-intel/8.5.0
module load intel/19.1.3.304
module load netcdf/4.7.4
module load hdf5/1.10.6
module load bufr/11.6.0
module load zlib/1.2.11
module load jasper/2.0.25
module load libpng/1.6.37
module load gsl/2.7
module load g2c/1.6.4
module load proj/7.1.0
module load fckit/0.11.0
module load atlas/0.35.0
module load eckit/1.24.4
module use /apps/dev/lmodules/intel/19.1.3.304
module load ve/evs/2.1
module use /apps/ops/para/libs/modulefiles/compiler/intel/19.1.3.304
module load met/12.1.2
module load metplus/6.1.2

export KEEPDATA=NO
export SENDMAIL=NO

# specify environment variables
export envir=prod
export NET=evs
export STEP=prep
export COMPONENT=rtofs

source $HOMEevs/dev/modulefiles/${COMPONENT}/${COMPONENT}_${STEP}.sh

evs_ver_2d=$(echo $evs_ver | cut -d'.' -f1-2)

# set up COMIN and COMOUT
export COMIN=/lfs/h2/emc/vpppg/noscrub/$USER/$NET/${evs_ver_2d}
export COMOUT=/lfs/h2/emc/vpppg/noscrub/$USER/$NET/${evs_ver_2d}
export DATAROOT=/lfs/h2/emc/stmp/${USER}/evs_test/$envir/tmp

export job=${PBS_JOBNAME:-jevs_${STEP}_${MODELNAME}}
export jobid=$job.${PBS_JOBID:-$$}

export MAILTO=${MAILTO:-'alicia.bentley@noaa.gov,samira.ardani@noaa.gov'}

# call j-job
$HOMEevs/jobs/JEVS_PREP_RTOFS

######################################################################
# Purpose: The job and task scripts work together to pre-process RTOFS
#          forecast data into the same spatial and temporal scales
#          as validation data.
# Author: L. Gwen Chen (lichuan.chen@noaa.gov)
######################################################################
