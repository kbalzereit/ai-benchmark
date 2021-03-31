FROM ubuntu:20.04
RUN apt-get update

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq install -y gnupg lsb-release wget
RUN for deb in deb deb-src; do echo "$deb http://build.openmodelica.org/apt `lsb_release -cs` stable"; done | tee /etc/apt/sources.list.d/openmodelica.list
RUN wget -q http://build.openmodelica.org/apt/openmodelica.asc -O- | apt-key add -


# Install OpenModelicaCompiler and OpenModelicaLibrary
RUN apt-get update && \ 
    DEBIAN_FRONTEND=noninteractive apt-get -qq install -y omc omlib-modelica-3.2.2

# Install Python
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3.6 build-essential
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git

# Upgrade pip
RUN pip3 install --upgrade pip

# Create a user profile "openmodelicausers" 
RUN useradd -m -s /bin/bash openmodelicausers

# Change the container to non-root "openmodelicauser" and set the env 
USER openmodelicausers
ENV HOME /home/openmodelicausers
ENV USER openmodelicausers
WORKDIR $HOME

# Clone simulation models
RUN git clone https://github.com/kbalzereit/ai-benchmark.git

# Run all simulations
RUN cd ai-benchmark && python3 runAll.py


