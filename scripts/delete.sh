#
# Destroys the Node.js microservice on Kubernetes.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number of the image to deploy.
#
# Usage:
#
#   ./scripts/deploy.sh
#

set -u # or set -o nounset
: "$ECR_URL"
: "$AWS_DATABASE_URL"

export AWS_DATABASE_URL="${AWS_DATABASE_URL}"

envsubst < ./scripts/kubernetes/deployment.yaml | kubectl delete -f -