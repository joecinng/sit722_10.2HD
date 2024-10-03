#
# Publishes a Docker image.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   REGISTRY_UN - User name for your container registry.
#   REGISTRY_PW - Password for your container registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/push-image.sh
#

set -u # or set -o nounset
: "$ECR_URL"
: "$AWS_REGION"

echo "Logging in to ECR..."
aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "$ECR_URL"

docker push $ECR_URL/book_catalog
docker push $ECR_URL/inventory_management