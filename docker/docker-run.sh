docker run --gpus all \
  -v /data/argoai/downloads/argoverse-tracking/test:/data  \
  -v $PWD:/argoverse-tracker \
  -it windinglines19/argoverse-tracker

