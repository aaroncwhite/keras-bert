# FROM nvidia/cuda:10.0-cudnn7-runtime AS base
FROM tensorflow/tensorflow:1.14.0-gpu-py3 as base
ARG DEV
ARG CI_USER_TOKEN
RUN echo -e "machine gitlab.com\nlogin gitlab-ci-token\npassword ${CI_USER_TOKEN}" > ~/.netrc

ENV \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8 \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    PIPENV_HIDE_EMOJIS=true \
    # PIPENV_COLORBLIND=true \
    # PIPENV_NOSPIN=true \
    PYTHONPATH="/app:${PYTHONPATH}" \
    PIP_SRC="/src"

RUN pip install pipenv && \
    apt-get update && \
    apt-get install git -y

WORKDIR /app
# COPY .git .git
COPY Pipfile .
COPY Pipfile.lock .
# COPY setup.py .
# COPY src/toxic_comment/__init__.py src/toxic_comment/__init__.py

RUN pipenv install --system --deploy --ignore-pipfile --dev
COPY docker/jupyter_notebook_config.py /root/.jupyter/

EXPOSE 8888
WORKDIR /app
