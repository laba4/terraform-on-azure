# ACR Container Image Build

```bash
az acr build -f .docker/Containerfile --registry examplename.azurecr.io --image imagename:v1 .
```

- Registry is the name of the ACR login server