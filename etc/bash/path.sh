
# Directories to be prepended to PATH
declare -a dirs_to_prepend=(
    "/usr/local/bin"      # Ensure that this bin always takes precedence over `/usr/bin`
    "${HOME}/.local/bin"  # Add path to pispi
)

# Directories to be appended to PATH
declare -a dirs_to_append=(
    "/usr/bin"
)

# Prepend directories to PATH
for index in ${!dirs_to_prepend[*]}
do
    if [ -d "${dirs_to_prepend[$index]}" ]; then
        # If these directories exist, then prepend them to existing PATH
        PATH="${dirs_to_prepend[$index]}:$PATH"
    fi
done

# Append directories to PATH
for index in ${!dirs_to_append[*]}
do
    if [ -d "${dirs_to_append[$index]}" ]; then
        # If these directories exist, then append them to existing PATH
        PATH="$PATH:${dirs_to_append[$index]}"
    fi
done

unset dirs_to_prepend dirs_to_append

export PATH