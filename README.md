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
