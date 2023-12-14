# terminal text color
function print_gray_text() {
    echo "\033[1;30m$1\033[0m"
}
function print_yello_text() {
    echo "\033[0;33m$1\033[0m"
}
function print_green_text() {
    echo "\033[0;32m$1\033[0m"
}
function print_red_text() {
    echo "\033[0;31m$1\033[0m"
}

#tuist install
function install_tuist_if_needed() {
    echo ">> check tuist install\n"
    RESULT=$(tuist local)
    if [[ $RESULT != *"The following versions are available in the local environment"* ]]; then
        print_yello_text "🍺 tuist install...\n"
        curl -Ls https://install.tuist.io | bash
        print_green_text "✅ tuist install success\n"
    else
        print_yello_text "🍺 tuist update...\n"
        tuist update
        print_green_text "✅ tuist update success\n"
    fi
}
install_tuist_if_needed

# git submodule add
print_yello_text "🍺 git submoudle add...\n"
git submodule add git@github.com:Kiseok-Peter/CommonFoundation.git ./Modules/Common/CommonFoundation
print_green_text "✅ git submodule add success\n"

# git submodule update
print_yello_text "🍺 git submoudle update...\n"
git submodule sync
git submodule update --recursive --merge --remote
print_green_text "✅ git submodule update success\n"

# Tuist Generate
print_yello_text "🍺 tuist generate...\n"
tuist generate
print_green_text "✅ tuist generate success\n"
