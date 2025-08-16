include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=uboot-firefly-station-m2
PKG_VERSION:=2024.01-armbian-2024.01-S31b8-P60ef-Hc6f6-Va9ef-Bb703-R448a
PKG_RELEASE:=20250528  # 对应你版本字符串中的 May 28 2025

PKG_MAINTAINER:=YourName <your@email.com>
PKG_LICENSE:=GPL-2.0-only
PKG_LICENSE_FILES:=Licenses/gpl-2.0.txt

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=boot
  CATEGORY:=Boot Loaders
  TITLE:=U-Boot for Firefly Station M2 (RK3566)
  DEPENDS:=@TARGET_rockchip_armv8
  URL:=https://github.com/rockchip-linux/u-boot
endef

define Package/$(PKG_NAME)/description
  Custom U-Boot bootloader for Firefly Station M2 (RK3566).
  Version: 2024.01-armbian with Armbian patches (S31b8-P60ef-Hc6f6-Va9ef-Bb703-R448a)
  Build date: May 28 2025
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/boot
	$(INSTALL_BIN) ./u-boot-rockchip.bin $(1)/boot/
	# 可选：保存版本信息到文件
	echo "$(PKG_VERSION)" > $(1)/boot/uboot-version
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
