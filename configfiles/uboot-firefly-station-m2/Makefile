include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME:=uboot-firefly-station-m2
PKG_VERSION:=2024.01-armbian-S31b8  # 需与你的 U-Boot 实际版本一致
PKG_RELEASE:=20250528

PKG_MAINTAINER:=YourName <your@email.com>
PKG_LICENSE:=GPL-2.0

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=boot
  CATEGORY:=Boot Loaders
  TITLE:=U-Boot for Firefly Station M2 (RK3566)
  DEPENDS:=@TARGET_rockchip_armv8  # 确保目标平台匹配
endef

define Package/$(PKG_NAME)/description
  Pre-built U-Boot for Firefly Station M2 (RK3566).
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/boot
	$(INSTALL_DATA) ./u-boot-rockchip.bin $(1)/boot/u-boot-rockchip.bin
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
