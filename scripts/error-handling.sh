# This file provides error handling functions when sourced

export RED='\033[0;31m'   # Green text
export NO_COLOR='\033[0m' # No color text
export PRINT_IN_COLOR=${PRINT_IN_COLOR:-1} # Colorized printing flag

# Print the given error message to stderr
# argument $1: error message to be printed to stderr
print_error() {
    if [[ ${PRINT_IN_COLOR} -eq 1 ]]; then
        echo -e "${RED}$*${NO_COLOR}" >&2
    else
        echo "$*" >&2
    fi
}

# Exits the script with an invalid arguments error message
# argument $1: the name of the script
# argument $2: error message to be printed to stderr
invalid_args_error(){
    print_error $1 ": invalid argument -- " $2
    exit 2
}
export -f invalid_args_error

# Exits the script with an error message
# argument $1: error message to be printed to stderr
die() {
    print_error "$*"
    exit 1
}
export -f die
