
ORG_NAME=NubeIO
REPO_NAME=wires-builds
LATEST_VERSION=$(curl -s https://api.github.com/repos/${ORG_NAME}/${REPO_NAME}/releases/latest | grep "tag_name" | cut -d'v' -f2 | cut -d'"' -f1)
echo "${LATEST_VERSION}.zip"