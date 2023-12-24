FROM continuumio/anaconda3:main
# use an older system (18.04) to avoid opencv incompatibility (issue#3524)


# compile python from source - avoid unsupported library problems
RUN apt-get update

RUN conda install python=3.7 -y

RUN conda install pytorch==1.4.0 torchvision==0.5.0 cudatoolkit=10.1 -c pytorch -y

RUN git clone https://github.com/NVIDIA/apex.git
RUN cd apex
RUN python setup.py install --cuda_ext --cpp_ext