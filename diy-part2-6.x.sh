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
cp -a $GITHUB_WORKSPACE/configfiles/coremark/* package/base-files/files/bin/
chmod 755 package/base-files/files/bin/coremark
chmod 755 package/base-files/files/bin/coremark.sh


# 复制dts设备树文件到指定目录下
cp -f $GITHUB_WORKSPACE/configfiles/dts/rk3588/rk3588-orangepi-5-plus.dts target/linux/rockchip/dts/rk3588/
cp -f $GITHUB_WORKSPACE/configfiles/dts/rk3566/{rk3566-firefly-roc-pc.dts,rk3566.dtsi,rk3568-dram-default-timing.dtsi,rk3568-linux.dtsi,rk3568-pinctrl.dtsi,rk3568.dtsi} target/linux/rockchip/dts/rk3568/
cp -f $GITHUB_WORKSPACE/configfiles/dts/{rockchip-pinconf.dtsi,rockchip-drm-vvop.dtsi} target/linux/rockchip/dts/
cp -f $GITHUB_WORKSPACE/configfiles/image/legacy.mk target/linux/rockchip/image/


# 定时限速插件
git clone --depth=1 https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
