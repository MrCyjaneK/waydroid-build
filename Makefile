
build:
	docker buildx build --platform linux/amd64,linux/arm64 . -f Dockerfile.ubuntu.20-04 -t mrcyjanek/waydroid:ubuntu.20-04
	docker buildx build --platform linux/amd64,linux/arm64 . -f Dockerfile.debian.11 -t mrcyjanek/waydroid:debian.11
	docker buildx build --platform linux/amd64,linux/arm64 . -f Dockerfile.debian.12 -t mrcyjanek/waydroid:debian.12
	docker buildx build --platform linux/amd64,linux/arm64 . -f Dockerfile.ubuntu.21-04 -t mrcyjanek/waydroid:ubuntu.21-04
	docker buildx build --platform linux/amd64,linux/arm64 . -f Dockerfile.ubuntu.21-10-t mrcyjanek/waydroid:ubuntu.21-10

push:
	docker push mrcyjanek/waydroid:ubuntu.20-04
	docker push mrcyjanek/waydroid:debian.11
	docker push mrcyjanek/waydroid:debian.12
	docker push mrcyjanek/waydroid:ubuntu.21-04
	docker push mrcyjanek/waydroid:ubuntu.21-10
