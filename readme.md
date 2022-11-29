Container for launching custom docker inside google cloud vertex ai notebook. These are the steps for container registry:
- 1) build docker and tag it: docker build . -t TAG_NAME
- 2) Link it with GCP Project: docker tag TAG_NAME eu.gcr.io/GCP_PROJECT_ID/TAG_NAME
- 3) Push it, upload docker into container registry: docker push eu.gcr.io/GCP_PROJECT_ID/TAG_NAME
- 4) create a custom notebook instance in vertex ai specifying the custom docker image just uploaded.

The following are the steps for artifact registry, more secure solution:
- 1) build local container and tag it: docker build . -t TAG_NAME
- 2) authenticated on gcp with dsidered region: gcloud auth configure-docker europe-west1-docker.pkg.dev
- 3) tag local container to remote container on gcp: docker tag TAG_NAME europe-west1-docker.pkg.dev/GCP_PROJECT_ID/docker-image-v3/TAG_NAME
- 4) push local to remote artifact repo: docker push europe-west1-docker.pkg.dev/GCP_PROJECT_ID/docker-image-v3/TAG_NAME

Before everything its' necessary to manually create (or from cloud shell) the repository.

Useful links:
- [container registry](https://cloud.google.com/container-registry/docs/pushing-and-pulling)
- [artifact 1](https://cloud.google.com/artifact-registry/docs/docker/store-docker-container-images#console)
- [artifact 2](https://cloud.google.com/artifact-registry/docs/docker/pushing-and-pulling#windows)