FROM jenkins/jenkins:2.580.2-jdk21

# Versión de Terraform (verifica la última en https://releases.hashicorp.com/terraform/)
ARG TERRAFORM_VERSION=1.13.5

USER root

# Docker CLI
RUN apt-get update && apt-get install -y ca-certificates curl unzip make && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    . /etc/os-release && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian ${VERSION_CODENAME} stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && apt-get install -y docker-ce-cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# AWS CLI v2 (x86_64 o aarch64 según la arquitectura del build)
RUN curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m).zip" -o /tmp/awscliv2.zip && \
    unzip -q /tmp/awscliv2.zip -d /tmp && \
    /tmp/aws/install && \
    rm -rf /tmp/aws /tmp/awscliv2.zip

# Terraform (amd64 o arm64), con verificación de checksum
RUN ARCH="$(dpkg --print-architecture)" && \
    BASE_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}" && \
    cd /tmp && \
    curl -fsSLO "${BASE_URL}/terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip" && \
    curl -fsSLO "${BASE_URL}/terraform_${TERRAFORM_VERSION}_SHA256SUMS" && \
    sha256sum -c --ignore-missing "terraform_${TERRAFORM_VERSION}_SHA256SUMS" && \
    unzip -q "terraform_${TERRAFORM_VERSION}_linux_${ARCH}.zip" terraform -d /usr/local/bin && \
    rm -f /tmp/terraform_* && \
    terraform version

USER jenkins
RUN jenkins-plugin-cli --plugins "docker-workflow json-path-api"