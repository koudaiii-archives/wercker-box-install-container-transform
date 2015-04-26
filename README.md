install-container-transform
---



Usage
---

```wercker.yml
box: koudaiii/install-container-transform
build:
  steps:
    - script:
        name: Configuring based on parameters..
        code: |
          aws configure set aws_access_key_id $WERCKER_INSTALL_CONTAINER_TRANSFORM_KEY
          aws configure set aws_access_key_id $WERCKER_INSTALL_CONTAINER_TRANSFORM_SECRET
          aws configure set default.region $WERCKER_INSTALL_CONTAINER_TRANSFORM_REGION
    - script:
        name: register task definition
        code: |
        aws ecs register-task-definition --family wercker --container-definitions "$(cat docker-compose.yml | container-transform)"
    - script:
        name:
        code: |
          aws ecs run-task --cluster $WERCKER_INSTALL_CONTAINER_TRANSFORM_CLUSTER --task-definition wercker
    - script:
        name: Done.
```
