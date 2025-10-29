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
------------------------------------------
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
-------------------------------------------------
```
📂 数据持久化

容器中生成的配置与密钥均在 /root/agsbx 下，可挂载到宿主机：
yaml
volumes:
  - ./data:/root/agsbx
```









