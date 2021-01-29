DOCKER_OVERLAY_LOWER_DIR ?= "/etc/docker"
DOCKER_OVERLAY_UPPER_DIR ?= "/data/docker"
DOCKER_OVERLAY_WORK_DIR ?= "/data/.overlay/docker-work"
DOCKER_OVERLAY_OPTIONS ?= "0 0"

# Add entry in fstab for docker overlay on read-only filesystem for `/etc/docker`
do_install_append() {
    mkdir -p ${D}${DOCKER_OVERLAY_UPPER_DIR}
    mkdir -p ${D}${DOCKER_OVERLAY_WORK_DIR}

    echo overlay ${DOCKER_OVERLAY_LOWER_DIR} overlay lowerdir=${DOCKER_OVERLAY_LOWER_DIR},upperdir=${DOCKER_OVERLAY_UPPER_DIR},workdir=${DOCKER_OVERLAY_WORK_DIR} ${DOCKER_OVERLAY_OPTIONS} >> ${D}/etc/fstab
}

FILES_${PN} += "${DOCKER_OVERLAY_UPPER_DIR} ${DOCKER_OVERLAY_WORK_DIR}"