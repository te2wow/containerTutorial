set -eux
aws ecr get-login-password --profile tetsuwo-profile | docker login --username AWS --password-stdin 905418468932.dkr.ecr.us-east-1.amazonaws.com

docker build -t service-a-image:latest ./service_a
docker build -t service-b-image:latest ./service_b
# docker　imagesを確認
docker images

# 作成したdocker imageをタグ付け
docker tag service-a-image 905418468932.dkr.ecr.us-east-1.amazonaws.com/service-a-image:latest
docker tag service-b-image 905418468932.dkr.ecr.us-east-1.amazonaws.com/service-b-image:latest
# ECRにpush
docker push 905418468932.dkr.ecr.us-east-1.amazonaws.com/service-a-image
docker push 905418468932.dkr.ecr.us-east-1.amazonaws.com/service-b-image

# kubectlを使ってdeploymentを再起動　
kubectl rollout restart deployment service-a -n tetsuwo
kubectl rollout restart deployment service-b -n tetsuwo