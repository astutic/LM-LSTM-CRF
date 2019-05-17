From anibali/pytorch:no-cuda
#From te_server:latest

#RUN apk add -u python3 && \
#	python3 -m ensurepip && \
#	apk add -u python3-dev
#
#RUN apk add -u libc6-compat
#RUN apk add --virtual .build-deps gcc musl-dev g++
#RUN pip3 install cython
#RUN apk add -u zlib zlib-dev
#RUN apk add jpeg jpeg-dev
#
COPY requirements.txt ~/
#
#RUN pip3 install --upgrade pip
#RUN pip3 install --upgrade setuptools
#RUN python3 -c "import platform; print(platform.python_version())"
RUN pip install -r ~/requirements.txt

RUN mkdir -p /home/user/tmp/root
WORKDIR /home/user/root
COPY * ./
COPY model model
COPY train_ner.sh .
COPY eval_ner.sh .
COPY debug.sh .
RUN sudo chmod +x *.sh

CMD /bin/sh
