# 📱 Bootloader Unlock Guide

## Generic process

```bash
# 1. Enable OEM Unlocking (Settings → Developer Options)
adb reboot bootloader
fastboot flashing unlock
# Device will prompt you to confirm (vol up to confirm)
```

## Device-specific notes

### Samsung
- Enable "OEM Unlocking" (may be hidden)
- No fastboot unlock command
- Use Odin or TWRP instead

### OnePlus
- Simplest: fastboot flashing unlock
- No waiting period

### Google Pixel
```bash
fastboot flashing unlock
```

### Xiaomi
- 72-hour waiting period from https://unlock.mi.com
- Then: fastboot flashing unlock
