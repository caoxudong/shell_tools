#!/bin/sh

workspace_dir=${WORKSPACE_DIR}
mkdir -p ${workspace_dir}
cd ${workspace_dir}

# download openpose
git clone git@github.com:CMU-Perceptual-Computing-Lab/openpose.git && \
export OPENPOSE_DIR="${workspace_dir}/openpose" && \
cd ${OPENPOSE_DIR}

# install cuda 8
sudo ubuntu/install_cuda.sh
ld_cuda_lib_file="/etc/ld.so.conf.d/cuda.conf"
sudo echo "/usr/local/cuda/lib64" >> "${ld_cuda_lib_file}"
sudo echo "/lib" >> /etc/
sudo ldconfig -v

# install cudnn 5.1
sudo ubuntu/install_cudnn.sh

# install caffe and build
sudo ubuntu/install_caffe_and_openpose_if_cuda8.sh
