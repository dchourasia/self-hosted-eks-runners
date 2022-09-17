# Dockerfile for self-hosted eks-runner

FROM ubuntu:18.04


RUN apt-get update && apt-get install -y sudo && apt-get install -y curl && apt-get install -y dnsutils && apt-get install -y iputils-ping && apt-get install -y git

RUN useradd -m runner

RUN usermod -aG sudo runner

USER runner

RUN mkdir /home/runner/actions-runner

WORKDIR /home/runner/actions-runner

RUN ls

#RUN chmod a+x actions-runner && cd actions-runner

RUN curl -o actions-runner-linux-x64-2.289.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.289.1/actions-runner-linux-x64-2.289.1.tar.gz

RUN echo "d75a2b35c47df410bba1ede6196fc62b6063164f5d109bda1693641bba87a65f  actions-runner-linux-x64-2.289.1.tar.gz" | shasum -a 256 -c

RUN tar xzf ./actions-runner-linux-x64-2.289.1.tar.gz

USER root

RUN /home/runner/actions-runner/bin/./installdependencies.sh

USER runner

COPY runner.sh /home/runner/actions-runner/runner.sh

#RUN chmod a+x  /home/runner/actions-runner/runner.sh

#USER runner

WORKDIR /home/runner/actions-runner

ENTRYPOINT ["./runner.sh"]

#ENTRYPOINT ["tail", "-f", "/dev/null"]
