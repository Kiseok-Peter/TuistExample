#tuist install
function install_tuist_if_needed() {
    echo ">> check tuist install\n"
    RESULT=$(tuist local)
    if [[ $RESULT != *"The following versions are available in the local environment"* ]]; then
        echo "tuist install...\n"
        curl -Ls https://install.tuist.io | bash
        echo "tuist install success\n"
    else
        echo "tuist update...\n"
        tuist update
        echo "tuist update success\n"
    fi
}
install_tuist_if_needed

# git submodule add
git submodule add git@github.com:Kiseok-Peter/CommonFoundation.git ./Modules/Common/CommonFoundation

# git submodule update
git submodule sync
git submodule update --recursive --merge --remote


# Tuist Generate
tuist generate
