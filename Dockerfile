FROM osrf/ros:melodic-desktop-full
SHELL ["/bin/bash","-c"]

RUN apt-get -y update && apt-get install -y \
    gnutls-bin \
    vim \
    git \
    original-awk \
    python3.6 \
    python3.6-dev \
    python3-pip 

wget 
ENTRYPOINT ["/bin/bash"]
CMD ["entrypoint_simple.sh", "name1", "name2"]
