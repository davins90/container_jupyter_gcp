Container for launching custom docker inside google cloud vertex ai notebook. These are the steps for container registry:
- 1) build docker and tag it: docker build . -t TAG_NAME
- 2) Link it with GCP Project: docker tag TAG_NAME eu.gcr.io/GCP_PROJECT_ID/TAG_NAME
- 3) Push it, upload docker into container registry: docker push eu.gcr.io/GCP_PROJECT_ID/TAG_NAME
- 4) create a custom notebook instance in vertex ai specifying the custom docker image just uploaded.

The following are the steps for artifact registry, more secure solution:
- 0) create repo in artifact with REPO_NAME
- 1) authentication: gcloud auth configure-docker europe-west1-docker.pkg.dev
- 2) build: docker build . -t LOCAL_NAME
- 3) tag: docker tag LOCAL_NAME europe-west1-docker.pkg.dev/PROJECT_ID/REPO_NAME/LOCAL_NAME
- 4) push: docker push europe-west1-docker.pkg.dev/PROJECT_ID/REPO_NAME/LOCAL_NAME

Before everything its' necessary to manually create (or from cloud shell) the repository.

Useful links:
- [container registry](https://cloud.google.com/container-registry/docs/pushing-and-pulling)
- [artifact 1](https://cloud.google.com/artifact-registry/docs/docker/store-docker-container-images#console)
- [artifact 2](https://cloud.google.com/artifact-registry/docs/docker/pushing-and-pulling#windows)