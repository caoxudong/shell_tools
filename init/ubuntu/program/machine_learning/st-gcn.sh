#!/bin/sh

# download st-gcn
git clone https://github.com/yysijie/st-gcn.git

# install pytorch
pip3 install torch torchvision

# install ffmpeg
apt-get install ffmpeg

# install requirements
cd st-gcn
pip install -r requirements.txt
