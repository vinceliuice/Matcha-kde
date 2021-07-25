#!/bin/bash

SRC_DIR=$(cd $(dirname $0) && pwd)

AURORAE_DIR="$HOME/.local/share/aurorae/themes"
SCHEMES_DIR="$HOME/.local/share/color-schemes"
PLASMA_DIR="$HOME/.local/share/plasma/desktoptheme"
LOOKFEEL_DIR="$HOME/.local/share/plasma/look-and-feel"
WALLPAPER_DIR="$HOME/.local/share/wallpapers"
KVANTUM_DIR="$HOME/.config/Kvantum"
SPEEDCRUNCH_DIR="$HOME/.local/share/SpeedCrunch/color-schemes"

THEME_NAME=Matcha-sea

install() {
  local name=${1}

  local AURORAE_THEME="${AURORAE_DIR}/${name}"
  local PLASMA_THEME="${PLASMA_DIR}/${name}"
  local LOOKFEEL_THEME="${LOOKFEEL_DIR}/com.github.vinceliuice.${name}"

  [[ -d ${AURORAE_THEME} ]] && rm -rf ${AURORAE_THEME}
  [[ -d ${PLASMA_THEME} ]] && rm -rf ${PLASMA_THEME}
  [[ -d ${LOOKFEEL_THEME} ]] && rm -rf ${LOOKFEEL_THEME}
  [[ -d ${KVANTUM_THEME}/${name} ]] && rm -rf ${KVANTUM_THEME}/${name}
  [[ -d ${KVANTUM_THEME}/${name}-dark ]] && rm -rf ${KVANTUM_THEME}/${name}-dark
  [[ -d ${WALLPAPER_DIR}/Matcha ]] && rm -rf ${WALLPAPER_DIR}/Matcha/*.jpg
  [[ -d ${SCHEMES_DIR}/MatchaSea.colors ]] && rm -rf ${SCHEMES_DIR}/MatchaSea.colors
  [[ -d ${SCHEMES_DIR}/MatchaSeaDark.colors ]] && rm -rf ${SCHEMES_DIR}/MatchaSeaDark.colors
  [[ -d "${SPEEDCRUNCH_DIR}/Matcha Sea Dark.json" ]] && rm -rf "${SPEEDCRUNCH_DIR}/Matcha Sea Dark.json"

  mkdir -p                                                                           ${AURORAE_DIR}
  mkdir -p                                                                           ${SCHEMES_DIR}
  mkdir -p                                                                           ${PLASMA_DIR}
  mkdir -p                                                                           ${LOOKFEEL_DIR}
  mkdir -p                                                                           ${KVANTUM_DIR}
  mkdir -p                                                                           ${WALLPAPER_DIR}/Matcha
  mkdir -p                                                                           ${SPEEDCRUNCH_DIR}

  cp -ur ${SRC_DIR}/aurorae/${name}                                                  ${AURORAE_DIR}
  cp -ur ${SRC_DIR}/color-schemes/*.colors                                           ${SCHEMES_DIR}
  cp -ur ${SRC_DIR}/wallpaper/*.jpg                                                  ${WALLPAPER_DIR}/Matcha
  cp -ur ${SRC_DIR}/Kvantum/*                                                        ${KVANTUM_DIR}
  cp -ur ${SRC_DIR}/plasma/desktoptheme/${name}${ELSE_DARK}                          ${PLASMA_DIR}
  cp -ur ${SRC_DIR}/color-schemes/MatchaSeaDark.colors                               ${PLASMA_DIR}/${name}/colors
  cp -ur ${SRC_DIR}/plasma/look-and-feel/com.github.vinceliuice.${name}              ${LOOKFEEL_DIR}
  cp -ur ${SRC_DIR}/SpeedCrunch/color-schemes/*.json                                 ${SPEEDCRUNCH_DIR}
}

echo "Installing 'Matcha kde themes'..."

install "${name:-${THEME_NAME}}"

echo "Install finished..."
