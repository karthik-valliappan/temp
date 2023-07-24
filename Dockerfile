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

# Install Terraform
ENV TERRAFORM_VERSION=1.5.2
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get install terraform=${TERRAFORM_VERSION}
