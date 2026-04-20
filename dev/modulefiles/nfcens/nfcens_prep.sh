#!/bin/bash
# modulefile for EVS nfcens component, prep step

set -x

module load PrgEnv-intel/${PrgEnvintel_ver}
module load intel/${intel_ver}
module load ve/evs/${ve_evs_ver}
module load gsl/${gsl_ver}
module load prod_util/${prod_util_ver}
module load libjpeg/${libjpeg_ver}
module load grib_util/${grib_util_ver}
module load wgrib2/${wgrib2_ver}
module load met/${met_ver}
module load metplus/${metplus_ver}
module load bufr/${bufr_ver}
module load proj/7.1.0
module load fckit/0.11.0
module load atlas/0.35.0
module load eckit/1.24.4
module use /apps/dev/lmodules/intel/${intel_ver}
module load ve/evs/${ve_evs_ver}
module use /apps/ops/para/libs/modulefiles/compiler/intel/${intel_ver}
module load met/${met_ver}
module load metplus/${metplus_ver}
module list

set -x
