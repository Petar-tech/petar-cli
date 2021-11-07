PORT="$(cat .env | grep PORT)"
portNumberArr=(${PORT//=/ })

SERVICE_NAME="$(cat .env | grep SERVICE_NAME)"
serviceNameArr=(${SERVICE_NAME//=/ })

SERVICE_VERSION="$(cat .env | grep SERVICE_VERSION)"
serviceVersionArr=(${SERVICE_VERSION//=/ })

eval "docker run -p ${portNumberArr[1]}:${portNumberArr[1]} ${serviceNameArr[1]}:${serviceVersionArr[1]}"