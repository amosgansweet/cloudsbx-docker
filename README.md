# Cloudsbx Docker 镜像

这是一个将 ** Argosbx / Cloudsbx 一键脚本** 封装为 Docker 镜像的版本。  
可快速在任何平台（Linux / PaaS / 容器平台）中一键部署。

---

## 🚀 使用方式

### 方式 1：直接运行镜像

```bash
docker run -d \
  --name cloudsbx \
  -p 443:443 -p 8443:8443 -p 2053:2053 \
  -e VLPT=443 \
  -e VMPT=8080 \
  -e WARP=yes \
  -e ARGO=yes \
  amosgansweet/cloudsbx:latest
```


### 环境变量指定了协议端口或参数, # 仅保留VLPT #(环境变量用统一小写字母-原码bash是小写,仅保留了vless-reality,端口VLPT必须大写有效。如果未填写端口，则随机一个，便于继续部署。其它协议端口可以自行在环境变量中添加

---
| Bash 变量名 | Compose/平台环境变量 | 说明               |
| -------- | -------------- | ---------------- |
| vlpt     | `VLPT`         | VLESS reality 端口 |
| vmpt     | `VMPT`         | VMess WS 端口      |
| hypt     | `HYPT`         | Hysteria2 端口     |
| tupt     | `TUPT`         | Trojan UDP 端口    |
| xhpt     | `XHPT`         | Xray H2 端口       |
| vxpt     | `VXPT`         | VLESS WS 端口      |
| anpt     | `ANPT`         | Anycast Node 端口  |
| arpt     | `ARPT`         | Argo Remote 端口   |
| sspt     | `SSPT`         | Shadowsocks 端口   |
| sopt     | `SOPT`         | SOCKS5 端口        |
| reym     | `REYM`         | VLESS reality 域名 |
| cdnym    | `CDNYM`        | CDN 域名           |
| argo     | `ARGO`         | 是否启用 Argo Tunnel |
| agn      | `ARGO_DOMAIN`  | Argo 域名          |
| agk      | `ARGO_AUTH`    | Argo Token       |
| ippz     | `IPPZ`         | IP 设置            |
| warp     | `WARP`         | 是否启用 Warp        |
| name     | `NAME`         | 容器名称或标识          |

```
| 环境变量          | 说明                      |
| ------------- | ----------------------- |
| `VLPT`        | Vless TCP Reality 端口    |
| `VMPT`        | Vmess WS 端口             |
| `HYPT`        | Hysteria2 端口            |
| `TUPT`        | Tuic 端口                 |
| `WARP`        | 是否启用 Warp（yes/no）       |
| `ARGO`        | 是否启用 Cloudflare Argo 隧道 |
| `ARGO_DOMAIN` | 固定 Argo 隧道域名（可选）        |
| `ARGO_AUTH`   | 固定 Argo Token（可选）       |
```
---
## 一、自定义变量参数说明：

| 变量意义 | 变量名称| 在变量值""之间填写| 删除变量 | 在变量值""之间留空 | 变量要求及说明 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 1、启用vless-tcp-reality-v | vlpt | 端口指定 | 关闭vless-tcp-reality-v | 端口随机 | 必选之一 【xray内核：TCP】 |
| 2、启用vless-xhttp-reality-v | xhpt | 端口指定 | 关闭vless-xhttp-reality-v | 端口随机 | 必选之一 【xray内核：TCP】 |
| 3、启用vless-xhttp-v | vxpt | 端口指定 | 关闭vless-xhttp-v | 端口随机 | 必选之一 【xray内核：TCP】 |
| 4、启用shadowsocks-2022 | sspt | 端口指定 | 关闭shadowsocks-2022 | 端口随机 | 必选之一 【singbox内核：TCP】 |
| 5、启用anytls | anpt | 端口指定 | 关闭anytls | 端口随机 | 必选之一 【singbox内核：TCP】 |
| 6、启用any-reality | arpt | 端口指定 | 关闭any-reality | 端口随机 | 必选之一 【singbox内核：TCP】 |
| 7、启用vmess-ws | vmpt | 端口指定 | 关闭vmess-ws | 端口随机 | 必选之一 【xray/singbox内核：TCP】 |
| 8、启用socks5 | sopt | 端口指定 | 关闭socks5 | 端口随机 | 必选之一 【xray/singbox内核：TCP】 |
| 9、启用hysteria2 | hypt | 端口指定 | 关闭hy2 | 端口随机 | 必选之一 【singbox内核：UDP】 |
| 10、启用tuic | tupt | 端口指定 | 关闭tuic | 端口随机 | 必选之一 【singbox内核：UDP】 |
| 11、warp开关 | warp | 详见下方15种warp出站模式图 | 关闭warp | singbox与xray内核协议都启用warp全局V4+V6 | 可选，详见下方15种warp出站模式图 |
| 12、argo开关 | argo | 填写y | 关闭argo隧道 | 关闭argo隧道 | 可选，填写y时，vmess变量vmpt必须启用，且固定隧道必须填写vmpt端口 |
| 13、argo固定隧道域名 | agn | 托管在CF上的域名 | 使用临时隧道 | 使用临时隧道 | 可选，argo填写y才可激活固定隧道|
| 14、argo固定隧道token | agk | CF获取的ey开头的token | 使用临时隧道 | 使用临时隧道 | 可选，argo填写y才可激活固定隧道 |
| 15、uuid密码 | uuid | 符合uuid规定格式 | 随机生成 | 随机生成 | 可选 |
| 16、reality域名（仅支持reality类协议） | reym | 符合reality域名规定 | amd官网 | amd官网 | 可选，使用CF类域名时：服务器ip:节点端口的组合，可作为ProxyIP/客户端地址反代IP（建议高位端口或纯IPV6下使用，以防被扫泄露）|
| 17、vmess-ws/vless-xhttp-v在客户端的host地址 | cdnym | CF解析IP的域名 | vmess-ws/vless-xhttp-v为直连 | vmess-ws/vless-xhttp-v为直连 | 可选，使用80系CDN或者回源CDN时可设置，否则客户端host地址需手动更改为CF解析IP的域名|
| 18、切换ipv4或ipv6配置 | ippz | 填写4或者6 | 自动识别IP配置 | 自动识别IP配置 | 可选，4表示IPV4配置输出，6表示IPV6配置输出 |
| 19、添加所有节点名称前缀 | name | 任意字符 | 默认协议名前缀 | 默认协议名前缀 | 可选 |
| 20、【仅容器类docker】监听端口，网页查询 | PORT | 端口指定 | 3000 | 3000 | 可选 |
| 21、【仅容器类docker】启用vless-ws-tls | DOMAIN | 服务器域名 | 关闭vless-ws-tls | 关闭vless-ws-tls | 可选，vless-ws-tls可独立存在，uuid变量必须启用 |


---
📂 数据持久化

容器中生成的配置与密钥均在 /root/agsbx 下，可挂载到宿主机：
```
yaml
volumes:
   ./data:/root/agsbx



