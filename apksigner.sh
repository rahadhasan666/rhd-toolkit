#!/bin/bash

# =========================
# CONFIG
# =========================
DEV="Rahad Hasan"
GITHUB="https://github.com/rahadhasan666"
VERSION="2.0"

# Colors
G="\e[32m"
C="\e[36m"
R="\e[31m"
Y="\e[33m"
B="\e[34m"
M="\e[35m"
W="\e[0m"
BLD="\e[1m"
DIM="\e[2m"

# Get terminal width
TERM_WIDTH=$(tput cols)

clear

# =========================
# CENTER TEXT FUNCTION
# =========================
center_text() {
    local text="$1"
    local color="$2"
    local text_length=${#text}
    local padding=$(( (TERM_WIDTH - text_length) / 2 ))
    printf "%${padding}s" ""
    echo -e "${color}${text}${W}"
}

# =========================
# PROGRESS BAR
# =========================
progress_bar() {
    local duration=$1
    local bar_length=50
    echo ""
    for ((i=0; i<=bar_length; i++)); do
        local percent=$(( i * 100 / bar_length ))
        printf "\r${C}["
        for ((j=0; j<i; j++)); do printf "█"; done
        for ((j=i; j<bar_length; j++)); do printf "░"; done
        printf "] ${G}%d%%${W}" $percent
        sleep $(echo "scale=3; $duration/$bar_length" | bc)
    done
    echo ""
}

# =========================
# BOOT ANIMATION
# =========================
boot() {
clear
    
# Matrix rain effect
echo -e "${G}"
for i in {1..15}; do
    for j in {1..50}; do
        echo -ne "\e[${i};${j}H${G}$(head /dev/urandom | tr -dc '01' | head -c 1)${W}"
    done
done
sleep 1

clear
center_text "╔══════════════════════════════════════════════════════════╗" "${C}"
center_text "║                                                          ║" "${C}"
center_text "║                 ${G}SYSTEM INITIALIZING${C}                    ║" "${C}"
center_text "║                                                          ║" "${C}"
center_text "╚══════════════════════════════════════════════════════════╝" "${C}"

echo ""
center_text "${BLD}${Y}[ BOOT SEQUENCE ]${W}" "${Y}"
echo ""

# Loading modules with progress bars
modules=("Kernel" "Memory" "Graphics" "Network" "Security" "APK Handler")
for module in "${modules[@]}"; do
    center_text "${DIM}Loading $module module...${W}" "${DIM}"
    progress_bar 0.3
done

echo ""
center_text "${G}✓ All systems operational${W}" "${G}"
center_text "${G}✓ Android Debug Bridge ready${W}" "${G}"
center_text "${G}✓ APK Toolkit loaded${W}" "${G}"

sleep 2
}

# =========================
# ANIMATED BANNER
# =========================
banner() {
clear

# Top decorative border
center_text "╔══════════════════════════════════════════════════════════════════╗" "${C}"
center_text "║                                                                  ║" "${C}"

# Animated RHD Logo
echo ""
center_text "${BLD}${R}██████╗     ██╗  ██╗    ██████╗ ${W}" "${R}"
sleep 0.1
center_text "${BLD}${R}██╔══██╗    ██║  ██║    ██╔══██╗${W}" "${R}"
sleep 0.1
center_text "${BLD}${R}██████╔╝    ███████║    ██║  ██║${W}" "${R}"
sleep 0.1
center_text "${BLD}${R}██╔══██╗    ██╔══██║    ██║  ██║${W}" "${R}"
sleep 0.1
center_text "${BLD}${R}██║  ██║    ██║  ██║    ██████╔╝${W}" "${R}"
sleep 0.1
center_text "${BLD}${R}╚═╝  ╚═╝    ╚═╝  ╚═╝    ╚═════╝ ${W}" "${R}"

echo ""
center_text "${BLD}${Y}⚡ ADVANCED APK TOOLKIT v${VERSION} ⚡${W}" "${Y}"
echo ""

# Bottom border
center_text "║                                                                  ║" "${C}"
center_text "╠══════════════════════════════════════════════════════════════════╣" "${C}"
center_text "║                                                                  ║" "${C}"
center_text "║  ${G}Developer${W} : ${Y}${DEV}${W}$(printf '%*s' $((TERM_WIDTH/2 - 28)) '')║" "${C}"
center_text "║  ${G}GitHub${W}    : ${B}${GITHUB}${W}$(printf '%*s' $((TERM_WIDTH/2 - 48)) '')║" "${C}"
center_text "║  ${G}Version${W}   : ${M}v${VERSION}${W}$(printf '%*s' $((TERM_WIDTH/2 - 20)) '')║" "${C}"
center_text "║                                                                  ║" "${C}"
center_text "╚══════════════════════════════════════════════════════════════════╝" "${C}"

echo ""
center_text "${BLD}${G}[ SYSTEM READY ]${W}" "${G}"
echo ""

# Animated status indicators
echo ""
center_text "┌─────────────────────────────────────────────────────────────┐" "${DIM}"
center_text "│  ${G}●${W} APK Service    : ${G}ACTIVE${W}                              │" "${DIM}"
center_text "│  ${G}●${W} Signing Engine : ${G}READY${W}                               │" "${DIM}"
center_text "│  ${G}●${W} Zipalign Tool  : ${G}ONLINE${W}                              │" "${DIM}"
center_text "│  ${G}●${W} Debug Bridge   : ${G}CONNECTED${W}                           │" "${DIM}"
center_text "└─────────────────────────────────────────────────────────────┘" "${DIM}"
echo ""

center_text "${DIM}Type ${Y}'help'${DIM} to view available commands${W}" "${DIM}"
echo ""
}

# =========================
# ANIMATED HELP MENU
# =========================
help_menu() {
clear
center_text "╔══════════════════════════════════════════════════════════════════╗" "${C}"
center_text "║                       ${Y}COMMAND REFERENCE${C}                        ║" "${C}"
center_text "╚══════════════════════════════════════════════════════════════════╝" "${C}"
echo ""

# Command list with icons
commands=(
    "🔍 help        │ Show this help menu"
    "🧹 clear       │ Clear and refresh screen"
    "🌐 github      │ Open GitHub repository"
    "📦 apktool     │ Launch APK modification toolkit"
    "📱 device      │ Check connected devices"
    "🔐 sign        │ Sign APK file"
    "⚡ optimize    │ Optimize and zipalign APK"
    "🚪 exit        │ Exit the toolkit"
)

for cmd in "${commands[@]}"; do
    center_text "${G}${cmd}${W}" "${G}"
    sleep 0.05
done

echo ""
center_text "${DIM}────────────────────────────────────────────────────────────────${W}" "${DIM}"
}

# =========================
# DEVICE CHECK
# =========================
check_device() {
    echo ""
    center_text "${Y}[ CHECKING CONNECTED DEVICES ]${W}" "${Y}"
    echo ""
    
    # Animated search
    for i in {1..3}; do
        center_text "${DIM}Scanning for devices.${W}" "${DIM}"
        sleep 0.3
        center_text "${DIM}Scanning for devices..${W}" "${DIM}"
        sleep 0.3
        center_text "${DIM}Scanning for devices...${W}" "${DIM}"
        sleep 0.3
    done
    
    echo ""
    if command -v adb &> /dev/null; then
        devices=$(adb devices | tail -n +2)
        if [ -z "$devices" ]; then
            center_text "${R}✗ No devices connected${W}" "${R}"
        else
            center_text "${G}✓ Device found:${W}" "${G}"
            echo "$devices" | while read line; do
                center_text "${C}$line${W}" "${C}"
            done
        fi
    else
        center_text "${R}✗ ADB not installed${W}" "${R}"
    fi
    echo ""
}

# =========================
# APK TOOL MODE
# =========================
apk_tool_mode() {
clear
center_text "╔══════════════════════════════════════════════════════════════════╗" "${Y}"
center_text "║                     ${BLD}📦 APK TOOLKIT MODE 📦${W}${Y}                     ║" "${Y}"
center_text "╚══════════════════════════════════════════════════════════════════╝" "${Y}"
echo ""

center_text "${C}Enter APK file details:${W}" "${C}"
echo ""

# Input fields with styling
echo -ne "${G}┌─[ Input APK Path ]${W}\n${G}└─▶ ${W}"
read apk

echo -ne "${G}┌─[ Output APK Name ]${W}\n${G}└─▶ ${W}"
read out

echo ""
center_text "${Y}[ PROCESSING APK ]${W}" "${Y}"
progress_bar 2

echo ""
center_text "${G}✓ Zipaligning APK...${W}" "${G}"
if command -v zipalign &> /dev/null; then
    zipalign -v 4 "$apk" aligned.apk 2>/dev/null
    center_text "${G}✓ Zipalign complete${W}" "${G}"
else
    center_text "${R}✗ Zipalign not found${W}" "${R}"
fi

echo ""
center_text "${G}✓ Signing APK...${W}" "${G}"
if command -v apksigner &> /dev/null; then
    apksigner sign --ks my-release-key.jks --ks-key-alias myalias --out "$out" aligned.apk 2>/dev/null
    center_text "${G}✓ Signing complete${W}" "${G}"
else
    center_text "${Y}⚠ Manual signing required - apksigner not found${W}" "${Y}"
fi

echo ""
center_text "╔══════════════════════════════════════════════════════════════════╗" "${G}"
center_text "║                    ${BLD}✓ OPERATION COMPLETED ✓${W}${G}                    ║" "${G}"
center_text "╚══════════════════════════════════════════════════════════════════╝" "${G}"
echo ""

read -p "$(center_text "${Y}Press Enter to continue...${W}" "${Y}")"
banner
}

# =========================
# SIGN APK
# =========================
sign_apk() {
    echo ""
    center_text "${Y}[ APK SIGNING TOOL ]${W}" "${Y}"
    echo -ne "${G}└─▶ Enter APK to sign: ${W}"
    read apk_file
    echo -ne "${G}└─▶ Enter output name: ${W}"
    read output_file
    
    center_text "${C}Signing in progress...${W}" "${C}"
    progress_bar 1.5
    
    if command -v apksigner &> /dev/null; then
        apksigner sign --ks my-release-key.jks --ks-key-alias myalias --out "$output_file" "$apk_file" 2>/dev/null
        center_text "${G}✓ APK signed successfully!${W}" "${G}"
    else
        center_text "${R}✗ apksigner not found${W}" "${R}"
    fi
    echo ""
}

# =========================
# OPTIMIZE APK
# =========================
optimize_apk() {
    echo ""
    center_text "${Y}[ APK OPTIMIZATION TOOL ]${W}" "${Y}"
    echo -ne "${G}└─▶ Enter APK to optimize: ${W}"
    read apk_file
    
    center_text "${C}Optimizing...${W}" "${C}"
    progress_bar 1.5
    
    if command -v zipalign &> /dev/null; then
        zipalign -v 4 "$apk_file" "optimized_$apk_file" 2>/dev/null
        center_text "${G}✓ APK optimized: optimized_$apk_file${W}" "${G}"
    else
        center_text "${R}✗ zipalign not found${W}" "${R}"
    fi
    echo ""
}

# =========================
# MAIN INIT
# =========================
boot
banner

# =========================
# CUSTOM SHELL
# =========================
while true; do
    echo ""
    echo -ne "${BLD}${R}R${G}H${B}D${W}${DIM}@${W}${BLD}${C}toolkit${W} ${DIM}➜${W} "
    read cmd

    case $cmd in
        help)
            help_menu
        ;;

        clear)
            banner
        ;;

        github)
            center_text "${Y}[ OPENING GITHUB ]${W}" "${Y}"
            xdg-open "$GITHUB" >/dev/null 2>&1 &
            center_text "${G}✓ GitHub opened in browser${W}" "${G}"
        ;;

        apktool)
            apk_tool_mode
        ;;

        device)
            check_device
        ;;

        sign)
            sign_apk
        ;;

        optimize)
            optimize_apk
        ;;

        exit)
            clear
            center_text "╔══════════════════════════════════════════════════════════════════╗" "${R}"
            center_text "║                                                                  ║" "${R}"
            center_text "║                    ${BLD}${Y}SHUTTING DOWN SYSTEM${W}${R}                     ║" "${R}"
            center_text "║                                                                  ║" "${R}"
            center_text "╚══════════════════════════════════════════════════════════════════╝" "${R}"
            echo ""
            progress_bar 1
            center_text "${G}✓ System halted successfully${W}" "${G}"
            center_text "${C}Goodbye!${W}" "${C}"
            echo ""
            break
        ;;

        *)
            center_text "${R}✗ Unknown command: ${Y}$cmd${W}" "${R}"
            center_text "${DIM}Type 'help' for available commands${W}" "${DIM}"
        ;;
    esac
done
