# Keep this separately from the rest of the .bb file in case that .bb file is
# overridden from another layer.

include ${@mender_feature_is_enabled("mender-uboot","../../../meta-mender/meta-mender-core/recipes-bsp/u-boot/u-boot-mender.inc","",d)}

