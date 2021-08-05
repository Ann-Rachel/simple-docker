FROM ubuntu:18.04
SHELL ["/bin/bash","-c"]

RUN apt-get -y update && apt-get install -y \
    vim \
    git \
    python3.6 \
    python3-pip \
    wget

RUN wget https://raw.githubusercontent.com/Ann-Rachel/simple-docker/main/entrypoint_simple.sh
#ENTRYPOINT ["/bin/bash"]
#CMD ["entrypoint_simple.sh", "name1", "name2"]
ENTRYPOINT ./entrypoint_simple.sh "$NAME_1" "$NAME_2"
