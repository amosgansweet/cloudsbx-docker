#!/bin/bash
set -e

echo ">>> 启动 Cloudsbx 容器安装环境..."
echo "当前时间：$(date)"

# 若环境变量指定了协议端口或参数，导入
export vlpt="${VLPT:-}"
export vmpt="${VMPT:-}"
export hypt="${HYPT:-}"
export tupt="${TUPT:-}"
export xhpt="${XHPT:-}"
export vxpt="${VXPT:-}"
export anpt="${ANPT:-}"
export arpt="${ARPT:-}"
export sspt="${SSPT:-}"
export sopt="${SOPT:-}"
export warp="${WARP:-}"
export argo="${ARGO:-}"
export agn="${ARGO_DOMAIN:-}"
export agk="${ARGO_AUTH:-}"

# 启动主脚本
bash /usr/local/bin/cloudsbx.sh

# 保持前台运行（防止容器退出）
tail -f /dev/null
