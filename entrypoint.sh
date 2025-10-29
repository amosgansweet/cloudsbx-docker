#!/bin/bash
set -e

echo ">>> 启动 Cloudsbx 容器安装环境..."
echo "当前时间：$(date)"

# 若环境变量指定了协议端口或参数(环境变量用统一大写字母或小写字母，如果不统一，小写为主，大写失效-原码是小写），导入（仅保留了vless-reality,如果未填写端口，则随机一个，继续部署。其它协议端口可以自行在环境变量中添加）
export vlpt="${VLPT:-}"
# export vmpt="${VMPT:-}"
# export hypt="${HYPT:-}"
# export tupt="${TUPT:-}"
# export xhpt="${XHPT:-}"
# export vxpt="${VXPT:-}"
# export anpt="${ANPT:-}"
# export arpt="${ARPT:-}"
# export sspt="${SSPT:-}"
# export sopt="${SOPT:-}"
# export warp="${WARP:-}"
# export argo="${ARGO:-}"
# export agn="${ARGO_DOMAIN:-}"
# export agk="${ARGO_AUTH:-}"

# 启动主脚本
bash /usr/local/bin/cloudsbx.sh

# 保持前台运行（防止容器退出）
tail -f /dev/null
