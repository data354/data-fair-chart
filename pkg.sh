name=dykoffi
keyring=~/.gnupg/pubring.gpg
repo=~/Projets/repo-helm/data-fair

helm package --sign --key name --keyring keyring -d $repo .