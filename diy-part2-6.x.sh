#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

# 修改uhttpd配置文件，启用nginx
# sed -i "/.*uhttpd.*/d" .config
# sed -i '/.*\/etc\/init.d.*/d' package/network/services/uhttpd/Makefile
# sed -i '/.*.\/files\/uhttpd.init.*/d' package/network/services/uhttpd/Makefile
sed -i "s/:80/:81/g" package/network/services/uhttpd/files/uhttpd.config
sed -i "s/:443/:4443/g" package/network/services/uhttpd/files/uhttpd.config
cp -a $GITHUB_WORKSPACE/configfiles/etc/* package/base-files/files/etc/
# ls package/base-files/files/etc/


# 追加binder内核参数
echo "CONFIG_PSI=y
CONFIG_KPROBES=y" >> target/linux/rockchip/armv8/config-6.6


# 集成CPU性能跑分脚本
#cp -a $GITHUB_WORKSPACE/configfiles/coremark/* package/base-files/files/bin/
#chmod 755 package/base-files/files/bin/coremark
#chmod 755 package/base-files/files/bin/coremark.sh


# 增加firefly_station-m2
echo -e "\\ndefine Device/firefly_station-m2
\$(call Device/Legacy/rk3566,\$(1))
  DEVICE_VENDOR := Firefly
  DEVICE_MODEL := Station M2 / RK3566 ROC PC
  DEVICE_DTS := rk3568/rk3566-roc-pc
  SUPPORTED_DEVICES += rockchip,rk3566-roc-pc firefly,rk3566-roc-pc firefly,station-m2
  DEVICE_PACKAGES := kmod-nvme kmod-scsi-core
endef
TARGET_DEVICES += firefly_station-m2" >> target/linux/rockchip/image/legacy.mk


# 复制dts设备树文件到指定目录下
cp -f $GITHUB_WORKSPACE/configfiles/dts/rk3588/rk3588-orangepi-5-plus.dts target/linux/rockchip/dts/rk3588/
cp -f $GITHUB_WORKSPACE/configfiles/dts/rk3568/rk3566-roc-pc.dts target/linux/rockchip/dts/rk3568/


# 定时限速插件
#git clone --depth=1 https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
