SERVICE_VERSION="$(cat .env | grep SERVICE_VERSION)"
serviceVersionArr=(${SERVICE_VERSION//=/ })

SERVICE_NAME="$(cat .env | grep SERVICE_NAME)"
serviceNameArr=(${SERVICE_NAME//=/ })

eval "docker build . -t ${serviceNameArr[1]}:${serviceVersionArr[1]}"