## postgres-in-kubernetes
Run postgress db server in kubernetes using config maps or using secrets to add db credential

## Run the command 

`   kubectl create namespace $var1

    kubectl apply -f ./secret-config.yaml

    kubectl create -f ./postgres-storage.yaml
    
    kubectl create -f ./postgres-deployment.yaml
    
    kubectl create -f ./postgres-service.yaml
    
    kubectl port-forward svc/postgres 5432:5432 --namespace postgres
`
