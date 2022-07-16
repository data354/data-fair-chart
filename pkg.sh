name=edy.koffi
keyring=~/.gnupg/secring.gpg
repo_dir=~/Projets/repo-helm
repo_url=https://data354.github.io/helm/

helm package --sign --key $name --keyring $keyring -d ${repo_dir}/data-fair .
helm repo index $repo_dir --url $repo_url