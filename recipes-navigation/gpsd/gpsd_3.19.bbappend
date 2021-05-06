FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI += "file://etc_default_gpsd \
            file://gpsd.socket"

SYSTEMD_SERVICE_${PN} = "${BPN}.service ${BPN}.socket ${BPN}ctl@.service"

do_install_append() {
     install -d ${D}/${sysconfdir}/default
     install -m 0644 ${WORKDIR}/etc_default_gpsd ${D}/${sysconfdir}/default/gpsd.default
     install -m 0644 ${WORKDIR}/${BPN}.socket ${D}${systemd_unitdir}/system/${BPN}.socket
}
