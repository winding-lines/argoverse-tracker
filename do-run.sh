# Script to run inside the docker container.
# It assumes that /data and /tracker_output have been mounted correctly.
set -e

for i in /data/* ; do
  if [ -f $i/vehicle_calibration_info.json ] ; then
    log_id=`basename $i`
    python3 run_tracking.py --path_dataset=/data --log_id=$log_id \
      --path_output=/tracker_output --use_maskrcnn --region_type=roi --use_map_lane \
      --motion_model='const_v' --measurement_model=both --fix_bbox_size 
  fi
done
