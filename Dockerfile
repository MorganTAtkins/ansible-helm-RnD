FROM spy86/ansible:latest
USER root
RUN curl https://baltocdn.com/helm/signing.asc | apt-key add - \
&& apt-get install apt-transport-https --yes \ 
&& echo "deb https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list \
&& apt-get update \
&& apt-get install helm

# Everthing from here is need to connet to EKS

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
&& install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN ansible-galaxy install gantsign.minikube
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" && \
unzip awscli-bundle.zip && \
./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
mv /tmp/eksctl /usr/local/bin
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator && \
chmod +x ./aws-iam-authenticator && \
mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator 
