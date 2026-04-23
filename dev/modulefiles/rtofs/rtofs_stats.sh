#!/bin/bash
# modulefile for EVS rtofs component, stats step

set -x

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
module load libjpeg-turbo/2.1.0
module use /apps/dev/lmodules/intel/19.1.3.304
module load ve/evs/2.1
module use /apps/ops/para/libs/modulefiles/compiler/intel/19.1.3.304
module load met/12.1.2
module load metplus/6.1.2

module list

set -x
