#!/bin/bash
echo "深度学习环境配置一键脚本"

# 更新
sudo apt update && sudo apt upgrade -y

# # 安装miniconda (重定向法)
# wget -P ~ -N https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# echo "正在安装 miniconda......"
# {
# 	echo ${KEYCODE_ENTER};
# 	echo "yes"; 
# 	echo ${KEYCODE_ENTER};
#     echo "yes";
# } |  bash ~/Miniconda3-latest-Linux-x86_64.sh 1>./Anaconda.log 2>&1
# echo "miniconda 安装成功！"

# 安装miniconda (官方静默安装)
echo "正在安装 miniconda......"
wget -P ~ -N https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash ~/Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3
# 初始化
source ~/miniconda3/bin/activate
conda init
source ~/.bashrc
echo "miniconda 安装成功！"

# 安装jupyter lab
echo "正在安装 jupyter lab......"
conda install -y jupyterlab
conda install -y nb_conda_kernels
echo "jupyter lab 安装成功！"

# 安装pytorch
echo "正在安装 pytorch......"
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia
echo "pytorch 安装成功！"