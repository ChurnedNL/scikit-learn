FROM --platform=linux/amd64 python:3.8

RUN pip install --upgrade pip
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN apt-get install -y wget && rm -rf /var/lib/apt/lists/*

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

RUN conda --version

RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" \
    && bash Miniforge3-$(uname)-$(uname -m).sh -b

RUN conda update conda -y

RUN conda create -n sklearn-dev -c conda-forge --yes -v python=3.8.0 numpy scipy cython joblib threadpoolctl pytest compilers

RUN conda init

# docker run -it --entrypoint bash qntq-sklearn-linux-build
#RUN conda activate sklearn-dev
#
#RUN git clone https://github.com/ChurnedNL/scikit-learn.git && cd scikit-learn && git checkout origin/build_lbfgs
#
#RUN python setup.py bdist_wheel
#
#CMD ["conda list"]
