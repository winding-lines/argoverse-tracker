set -e

docker run --gpus all \
  -v /data/argoai/downloads/argoverse-tracking/test:/data  \
  -v `datacrumbs /data/argoai/marius/argoverse-tracker`:/tracker_output \
  -v $PWD:/argoverse-tracker \
  -it windinglines19/argoverse-tracker

