#!/bin/bash
echo 'Adding asdf-vm plugins'

declare  plugins=(Erlang Elixir NodeJS Terraform)
declare -r cmd_install_plugin="asdf plugin add {PLUGIN_NAME}"
declare -r cmd_update_plugins="asdf plugin update --all"
declare -r cmd_remove_package="asdf uninstall {PACKAGE_NAME} {PACKAGE_VERSION}"
declare -r no_package_mensage="No versions installed"

function add_plugin() { #name=$1, plugin command 
  echo "Adding $1"

  eval ${cmd_install_plugin/\{PLUGIN_NAME\}/${plugins[1],,}} >> echo 

  echo "$1 Added\n"
}

function add_latest_package() { #name=$1
  echo "Installing $1, version:"
  eval "asdf latest ${1,,}" >> echo
  eval "asdf install ${1,,} latest"
  eval "asdf global ${1,,} latest"
}

function remove_package() {
  local installed_package=$(asdf list $1)
  echo installed_package
  if [[ ! $no_package_mensage =~ "${installed_package}" ]]; then
    local cmd_replace_package=${cmd_remove_package/\{PACKAGE_NAME\}/${1,,}}
    eval ${cmd_replace_package/\{PACKAGE_VERSION\}/${installed_package#*\*}}
  fi
}

for plugin in ${plugins[@]}
do
  add_plugin ${plugin}
  remove_package ${plugin}
  add_latest_package ${plugin}
done

