# git submodule add
git submodule add git@github.com:Kiseok-Peter/CommonFoundation.git ./Modules/Common/CommonFoundation

# git submodule update
git submodule sync
git submodule update --recursive --merge --remote


# Tuist Generate
tuist generate
