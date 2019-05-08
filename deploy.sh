docker build -t vladimirkuchinskiy/multi-client:latest -t vladimirkuchinskiy/multi-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t vladimirkuchinskiy/multi-server:latest -t vladimirkuchinskiy/multi-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t vladimirkuchinskiy/multi-worker:latest -t vladimirkuchinskiy/multi-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push vladimirkuchinskiy/multi-client:latest
docker push vladimirkuchinskiy/multi-server:latest
docker push vladimirkuchinskiy/multi-worker:latest

docker push vladimirkuchinskiy/multi-client:$GIT_SHA
docker push vladimirkuchinskiy/multi-server:$GIT_SHA
docker push vladimirkuchinskiy/multi-worker:$GIT_SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=vladimirkuchinskiy/multi-server:$GIT_SHA
kubectl set image deployments/client-deployment client=vladimirkuchinskiy/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=vladimirkuchinskiy/multi-worker:$GIT_SHA