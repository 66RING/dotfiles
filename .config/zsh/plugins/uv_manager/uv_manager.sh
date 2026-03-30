#!/bin/bash

UV_BASE_PATH="${HOME}/.uv_environments"


_ensure_base_dir() {
    if [ ! -d "$UV_BASE_PATH" ]; then
        mkdir -p "$UV_BASE_PATH"
    fi
}

uvmk() {
    _ensure_base_dir

    if [ $# -eq 0 ]; then
        echo "Usage uvmk <venv_name> [args]"
        return 1
    fi

    local env_name="$1"
    shift
    local env_path="${UV_BASE_PATH}/${env_name}"

    if [ -d "$env_path" ]; then
        echo "'$env_name' existed $env_path"
        return 1
    fi

    uv venv --relocatable "$env_path" "$@"
    
    if [ $? -eq 0 ]; then
        echo "'$env_name' created at $env_path"
    else
        echo "'$env_name' failed to create"
        return 1
    fi
}

uvrm() {
    if [ $# -eq 0 ]; then
        echo "Usage: uvrm <venv_name>"
        return 1
    fi

    local env_name="$1"
    local env_path="${UV_BASE_PATH}/${env_name}"

    if [ ! -d "$env_path" ]; then
        echo "'$env_name' not existed $env_path"
        return 1
    fi

    rm -rf "$env_path"
    
    if [ $? -eq 0 ]; then
        echo "'$env_name' deleted"
    else
        echo "'$env_name' failed to delete"
        return 1
    fi
}

uvlist() {
    _ensure_base_dir

    local envs=$(ls -1 "$UV_BASE_PATH" 2>/dev/null)
    
    if [ -z "$envs" ]; then
        echo "  empty venv list"
        return 0
    fi

    local count=1
    while IFS= read -r env; do
        echo "  $count. $env"
        ((count++))
    done <<< "$envs"
}

uvworkon() {
    if [ $# -eq 0 ]; then
        echo "Usage: uvworkon <venv_name>"
        return 1
    fi

    local env_name="$1"
    local activate_script="${UV_BASE_PATH}/${env_name}/bin/activate"

    if [ ! -f "$activate_script" ]; then
        echo "Error:  '$env_name' not exist."
        return 1
    fi

    source "$activate_script"
}

uvon() {
  uvworkon "$@"
}



