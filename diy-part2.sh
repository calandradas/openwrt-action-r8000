#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

rm -rf feeds/kenzo/luci-theme-argon feeds/kenzo/luci-app-argon-config
git clone https://github.com/jerrykuku/luci-theme-argon.git feeds/kenzo/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git feeds/kenzo/luci-app-argon-config

# goland 2.1 to golang 2.2
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

# miniupnpd 2.3.7 to 2.1.20200510
#rm -fr feeds/packages/net/miniupnpd
#git clone --filter=blob:none --no-checkout https://github.com/openwrt/packages miniupnpd-tmp
#cd miniupnpd-tmp
#git sparse-checkout init --cone
#git sparse-checkout set net/miniupnpd
#git checkout openwrt-18.06
#cp -r net/miniupnpd ../feeds/packages/net/
#cd ..
#rm -fr miniupnpd-tmp


# Modify hostname
sed -i 's/OpenWrt/R8000Wrt/g' package/base-files/files/bin/config_generate
