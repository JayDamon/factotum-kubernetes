kubectl apply -f config-map.yml

kubectl apply -f movie-catalog-app.yml --namespace=media-dev

kubectl apply -f ingress-config.yml