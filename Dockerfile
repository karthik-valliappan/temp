FROM openjdk:8-jdk

# Install leiningen
RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x lein \
    && mv lein /usr/local/bin/lein \
    && lein

# Install make
RUN apt-get update && apt-get install -y make

# Install AWS CLI
RUN apt-get install -y unzip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip

# Install Terraform
ENV TERRAFORM_VERSION=1.5.2
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
