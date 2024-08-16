# check if ubuntu/debain
if [ -f /etc/debian_version ]; then
    sudo apt-get install pkg-config gcc libseccomp-dev
# check if fedora
elif [ -f /etc/fedora-release ]; then
    sudo dnf install pkgconfig gcc libseccomp-devel
# check if arch
elif [ -f /etc/arch-release ]; then
    sudo pacman -S pkg-config gcc libseccomp
# check if alpine
elif [ -f /etc/alpine-release ]; then
    sudo apk add pkgconfig gcc libseccomp-dev
# check if centos
elif [ -f /etc/centos-release ]; then
    sudo yum install pkgconfig gcc libseccomp-devel
# 检查是否是 macOS
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # 检查是否安装了 Homebrew
    if ! command -v brew &> /dev/null; then
        echo "Homebrew 未安装，现在开始安装 Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew 已经安装，更新 Homebrew..."
        brew update
    fi

    # 安装 pkg-config 和 gcc
    echo "安装 pkg-config 和 gcc..."
    brew install pkg-config gcc

    echo "macOS 不需要 libseccomp。如果你需要，请自行安装合适的替代包。"
else
    echo "Unsupported distribution"
    exit 1
fi
