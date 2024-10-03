#
# Builds a Docker image.
#
# Environment variables:
#
#   CONTAINER_REGISTRY - The hostname of your container registry.
#   VERSION - The version number to tag the images with.
#
# Usage:
#
#       ./scripts/build-image.sh
#

set -u # or set -o nounset
: "$ECR_URL"

docker-compose build

# Tag the images
docker tag book_catalog $ECR_URL/book_catalog
docker tag inventory_management $ECR_URL/inventory_management
