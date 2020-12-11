FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append = " \
     file://mender-inventory-uptime \
"

do_install_append () {
    install -d ${D}/${datadir}/mender/inventory
    install -m 0755 ${WORKDIR}/mender-inventory-uptime ${D}/${datadir}/mender/inventory/
}
