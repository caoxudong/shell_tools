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

# install dependencies of caffe
sudo apt-get install -y --no-install-recommends libboost-all-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler libopenblas-dev libatlas-base-dev 

# install caffe and build
sudo ubuntu/install_caffe_and_openpose_if_cuda8.sh
