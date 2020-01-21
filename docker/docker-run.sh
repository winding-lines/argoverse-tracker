# Use datacrumbs to allocate a new output folder, for example for a new run.

set -e

docker run --gpus all \
  -v /data/argoai/downloads/argoverse-tracking/val:/data  \
  -v `datacrumbs --base /data/argoai/marius/argoverse-tracker`:/tracker_output \
  -v $PWD:/argoverse-tracker \
  -it windinglines19/argoverse-tracker

