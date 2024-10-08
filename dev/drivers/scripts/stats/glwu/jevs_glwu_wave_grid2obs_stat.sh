#PBS -N jevs_glwu_wave_grid2obs_stats
#PBS -j oe
#PBS -S /bin/bash
#PBS -q dev
#PBS -A VERF-DEV
#PBS -l walltime=00:15:00
#PBS -l select=1:ncpus=1:mem=10GB
#PBS -l debug=true
#PBS -V


set -x

export HOMEevs=/lfs/h2/emc/vpppg/noscrub/$USER/EVS

export MODELNAME=glwu
export OBTYPE=GDAS
export NET=evs
export COMPONENT=glwu
export STEP=stats
export RUN=wave
export VERIF_CASE=grid2obs

############################################################
# read version file and set model_ver
############################################################

versionfile=$HOMEevs/versions/run.ver
. $versionfile
export model_ver=$glwu_ver


############################################################
# Load modules
############################################################
#
module reset
module load prod_envir/${prod_envir_ver}
source $HOMEevs/dev/modulefiles/$COMPONENT/${COMPONENT}_${STEP}.sh


export envir=prod
export SENDCOM=${SENDCOM:-YES}
export SENDECF=${SENDECF:-YES}
export SENDDBN=${SENDDBN:-NO}
export KEEPDATA=${KEEPDATA:-YES}
 
### developers directories
export DATAROOT=/lfs/h2/emc/stmp/${USER}/evs_test/$envir/tmp
export OUTPUTROOT="/lfs/h2/emc/vpppg/noscrub/$USER"
export COMIN=/lfs/h2/emc/vpppg/noscrub/${USER}/${NET}/${evs_ver_2d}
export COMOUT=${OUTPUTROOT}/${NET}/${evs_ver_2d}/${STEP}/${COMPONENT}
 
export run_mpi='yes'
export gather='yes'
 
export job=${PBS_JOBNAME:-jevs_glwu_wave_grid2obs_stats}
export jobid=$job.${PBS_JOBID:-$$}
export TMPDIR=$DATAROOT
export SITE=$(cat /etc/cluster_name)
 
############################################################
## CALL executable job script here
#############################################################

$HOMEevs/jobs/JEVS_GLWU_WAVE_GRID2OBS_STAT

######################################################################
# Purpose: The job and task scripts work together to create stat
#          files for GLWU wave model.
# Author: Samira Ardani (samira.ardani@noaa.gov)
######################################################################
