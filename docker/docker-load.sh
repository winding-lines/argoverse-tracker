# Load an earlier run in docker in order to do data analysis and evaluation.
# The code folder is mapped ot /argoverse-tracker

OUTPUT=/data/argoai/marius/argoverse-tracker/1ff75cd1-3613-11ea-8001-00d86118ce97
set -e

docker run --gpus all \
  -v /data/argoai/downloads/argoverse-tracking/test:/data  \
  -v $OUTPUT:/tracker_output \
  -v $PWD:/argoverse-tracker \
  -it windinglines19/argoverse-tracker

