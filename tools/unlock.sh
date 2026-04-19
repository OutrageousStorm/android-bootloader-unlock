#!/bin/bash
# unlock.sh -- Interactive bootloader unlock tool
# Detects device and runs the correct unlock command
set -e

BOLD='[1m'; CYAN='[0;36m'; RED='[0;31m'; GREEN='[0;32m'; NC='[0m'

echo -e "
${BOLD}${CYAN}🔓 Bootloader Unlock Tool${NC}
"

if ! adb devices | grep -q "device"; then
    echo -e "${RED}❌ No device connected.${NC}"
    exit 1
fi

MODEL=$(adb shell getprop ro.product.model)
OEM=$(adb shell getprop ro.product.vendor.name)
echo "Device: $MODEL (OEM: $OEM)"
echo ""
echo "⚠️  WARNING: This will WIPE ALL DATA"
echo "   1. Backup your files"
echo "   2. You must have OEM Unlocking enabled in Developer Options"
echo ""

read -rp "Continue? (type YES): " confirm
[[ "$confirm" != "YES" ]] && echo "Aborted." && exit 0

echo -e "
${GREEN}Rebooting to bootloader...${NC}"
adb reboot bootloader
sleep 3

fastboot devices
echo ""
echo -e "${BOLD}Running unlock command...${NC}"

# Try different unlock methods
if fastboot flashing unlock 2>/dev/null; then
    echo -e "${GREEN}✓ Unlocked!${NC}"
elif fastboot oem unlock 2>/dev/null; then
    echo -e "${GREEN}✓ Unlocked!${NC}"
else
    echo -e "${RED}✗ Unlock failed. This device may not support bootloader unlock.${NC}"
    exit 1
fi

echo -e "
Press Volume Up on device to confirm unlock."
sleep 5

fastboot reboot
echo -e "${GREEN}✅ Done. Device rebooting...${NC}"
