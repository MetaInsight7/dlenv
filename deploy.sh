#!/bin/bash

# 更新
apt_update(){
    echo
    sudo apt update && sudo apt upgrade -y
}


# 安装miniconda (官方静默安装)
install_miniconda(){
    echo
    echo "正在安装 miniconda..."
    wget -P ~ -N https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
    bash ~/Miniconda3-latest-Linux-x86_64.sh -b -p ~/miniconda3
    # 初始化
    source ~/miniconda3/bin/activate
    conda init
    source ~/.bashrc
    echo "miniconda 安装成功！"
}


# 安装jupyter lab
install_jupyterlab(){
    echo
    echo "正在安装 jupyter lab..."
    conda install -y jupyterlab
    conda install -y nb_conda_kernels
    echo "jupyter lab 安装成功！"
}


# 安装pytorch
install_pytorch(){
    echo
    echo "正在安装 pytorch..."
    conda install -y pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia
    echo "pytorch 安装成功！"
}


clear
echo "======================================"
echo "        深度学习环境配置一键脚本        "
echo "======================================"

echo ""
echo "1.Install ALL"
echo "2.Install miniconda"
echo "3.Install jupyter lab"
echo "4.Install pytorch"


while true
do 
    echo ""
	read -p "请选择： " userc
	if [[ ! $userc =~ ^[1-4]$ ]]; then
		echo "输入错误! 请输入正确的数字!"
	else
		break	
	fi
done

case $userc in
    1)  
        echo "Install ALL..."
        apt_update
        install_miniconda
        install_jupyterlab
        install_pytorch
    ;;
    2)  
        echo "Install miniconda..."
        apt_update
        install_miniconda
    ;;
    3)
        echo "Install jupyter lab..."
        apt_update
        install_jupyterlab
    ;;
    4)
        echo "Install pytorch..."
        apt_update
        install_pytorch
    ;;
esac