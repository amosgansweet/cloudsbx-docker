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

-------------------------------------------------

```
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



📂 数据持久化

容器中生成的配置与密钥均在 /root/agsbx 下，可挂载到宿主机：
```
yaml
volumes:
   ./data:/root/agsbx



