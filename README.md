# Forked from [strongio/keras-bert](https://github.com/strongio/keras-bert)
A light fork that adds reproducible aspects to the original demonstration including a [Pipfile](Pipfile) that declares dependencies and a docker setup to automatically build the environment and launch a jupyter and tensorboard servers.  

To run:
```
docker-compose build
docker-compose up
```

Use `docker-compose up -d` to launch as a daemon process in the background. The jupyter server will be accessible at http://localhost:8888/lab like normal.  Token access is disabled.  This jupyter server is *not* firewalled at all.  Do not run this on the open web!

# Using BERT in Keras with tensorflow hub
Following on our [previous demo using ELMo embeddings in Keras with tensorflow hub](https://github.com/strongio/keras-elmo), we present a brief demonstration on how to integrate BERT from tensorflow hub into a custom Keras layer that can be directly integrated into a Keras or tensorflow model.

See the accompanying blog post with further description
