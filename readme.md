Container for launching custom docker inside google cloud vertex ai notebook. These are the steps:
- 1) build docker and tag it: docker build . -t TAG_NAME
- 2) Link it with GCP Project: docker tag TAG_NAME eu.gcr.io/GCP_PROJECT_ID/TAG_NAME
- 3) Push it, upload docker into container registry: docker push eu.gcr.io/GCP_PROJECT_ID/TAG_NAME
- 4) create a custom notebook instance in vertex ai specifying the custom docker image just uploaded.

Next steps:
- move from container registry to artifact