# 🔓 Bootloader Unlock Guide

OEM unlock and bootloader unlock instructions for every major Android OEM.

## Quick Reference

| OEM | Unlock time | Fastboot format |
|-----|-------------|-----------------|
| Samsung | 7 days | `fastboot flashing unlock` |
| OnePlus | Instant | `fastboot oem unlock` |
| Xiaomi | 30 days (China) / 72h (Global) | `fastboot flashing unlock` |
| Google Pixel | Instant | `fastboot flashing unlock` |
| Motorola | 7 days | `fastboot oem unlock` |
| Sony | Instant | `fastboot flashing unlock` |
| LG | Varies | Device-specific |

## Steps

1. Enable Developer Options (tap Build Number 7×)
2. Enable **OEM Unlocking** in Developer Options
3. Reboot to bootloader: `adb reboot bootloader`
4. Unlock (see table for correct command)
5. Confirm on device

⚠️ **Wipes all data** — back up first!
