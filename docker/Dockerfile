ARG CUDA="10.1"
ARG CUDNN="7"

FROM nvidia/cuda:${CUDA}-cudnn${CUDNN}-devel-ubuntu18.04

# install basics
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
 && apt-get update --fix-missing -y \
 && apt-get install -y apt-utils git curl ca-certificates bzip2 cmake g++ wget \
 && apt-get install -y libglib2.0-0 libsm6 libxext6 libxrender-dev \
 && apt-get install --reinstall python3-apt -y

# Install Miniconda
RUN curl -so /miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
 && chmod +x /miniconda.sh \
 && /miniconda.sh -b -p /miniconda \
 && rm /miniconda.sh

ENV PATH=/miniconda/bin:$PATH

# Create a Python 3.6 environment
RUN /miniconda/bin/conda install -y conda-build \
 && /miniconda/bin/conda create -y --name py36 python=3.6.7 \
 && /miniconda/bin/conda clean -ya

ENV CONDA_DEFAULT_ENV=py36
ENV CONDA_PREFIX=/miniconda/envs/$CONDA_DEFAULT_ENV
ENV PATH=$CONDA_PREFIX/bin:$PATH
ENV CONDA_AUTO_UPDATE_CONDA=false

RUN conda install -y cython  \
  && pip install requests ninja yacs cython matplotlib opencv-python tqdm numpy



# Install PyTorch and TorchVision
ENV TORCH_CUDA_ARCH_LIST=Volta;Turing;Kepler+Tesla
ARG CUDA
RUN conda install pytorch cudatoolkit=${CUDA} -c pytorch \
 && conda clean -ya \
 && conda install torchvision \
 && git clone https://github.com/NVIDIA/apex.git \
 && cd apex \
 && python setup.py install --cuda_ext --cpp_ext


# install PyTorch Detection
ARG FORCE_CUDA="1"
ENV FORCE_CUDA=${FORCE_CUDA}
RUN git clone https://github.com/facebookresearch/maskrcnn-benchmark.git \
 && cd maskrcnn-benchmark \
 && git checkout 55796a04ea770029a80cf5933cc5c3f3f6fa59cf\
 && python setup.py build develop



# install python-pcl dependencies
RUN apt-get install -y pkg-config build-essential linux-libc-dev libeigen3-dev \
  && apt-get install -y libpcl-dev libvtk6-dev 

RUN git clone https://github.com/winding-lines/python-pcl \
   && cd python-pcl \
   && python setup.py build_ext -i \
   && python setup.py install


#install argoverse-api and download map
RUN git clone https://github.com/argoai/argoverse-api \
    && cd argoverse-api \
    && pip install -e .\
    && cd .. \
    && wget https://s3.amazonaws.com/argoai-argoverse/hd_maps.tar.gz\
    && tar -xf hd_maps.tar.gz\
    && mv map_files argoverse-api \
    && pip install sklearn pyquaternion uuid

#For visualization
## RUN apt-get install -y libglib2.0-0 libxext6 libsm6 libxrender1 gtk3.0 \
##     && conda install -y -c conda-forge jsoncpp=0.10.6 qt pyvtk pyside envisage mesalib mayavi\
##     && conda install -y -c ajsrk traitsui=6.0.0 \
##     && conda install -c viscid-hub vtk

