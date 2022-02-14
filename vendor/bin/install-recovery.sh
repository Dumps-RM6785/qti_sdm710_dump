#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:bca5ac25a3e6bb42f96e59743c4a0121fe7f6a28; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:19ee334988ff1ee8eb8de16358136ebca896d7e8 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:bca5ac25a3e6bb42f96e59743c4a0121fe7f6a28 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.boot.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.boot.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.boot.recovery.updated true
fi
