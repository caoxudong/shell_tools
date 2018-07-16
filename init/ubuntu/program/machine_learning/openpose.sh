#!/bin/sh

set -x

workspace_dir="~/workspace"
openpose_repo_name="openpose"

# prepare build tool
apt-get install -y --no-install-recommends cmake
apt-get install -y --no-install-recommends python3-gdbm

# prepare python
update-alternatives --install /usr/bin/python python /usr/bin/python3 150

# correct pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --force-reinstall
rm get-pip.py

# install python dependencies
apt-get install -y --no-install-recommends libboost-all-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler libopenblas-dev libatlas-base-dev python-numpy

# mkdir
mkdir -p ${workspace_dir}

# download openpose
cd ${workspace_dir}
git clone https://github.com/CMU-Perceptual-Computing-Lab/openpose.git ${openpose_repo_name}

# install cudnn
sh "${workspace_dir}/${openpose_repo_name}/ubuntu/install_cudnn.sh"

# build openpose
cd "${workspace_dir}/${openpose_repo_name}"
mkdir build
cd build
cmake ..
make -j`nproc`
