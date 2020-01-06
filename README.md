# Argoverse  Tracker

Based on https://github.com/alliecc/argoverse_baselinetracker

## 
Baseline tracker code release for the paper **Argoverse: 3D Tracking and Forecasting With Rich Maps**, CVPR 2019.
[[paper]](http://openaccess.thecvf.com/content_CVPR_2019/html/Chang_Argoverse_3D_Tracking_and_Forecasting_With_Rich_Maps_CVPR_2019_paper.html)&nbsp;  [[website]](https://www.argoverse.org/index.html)&nbsp;

## Introduction

Please install docker version 19.x.y and then build the image

```shell
sh docker/build.sh
```

Edit `docker-run.sh` to map your data folder and the current code folder
```shell
wget https://www.nayuki.io/res/smallest-enclosing-circle/smallestenclosingcircle.py
sh docker/docker-run.sh
```

Here is an example command to start tracker. The tracking output would be stored in /tracking_output.
```shell
python3 run_tracking.py --path_dataset=/data --log_id=0f0d7759-fa6e-3296-b528-6c862d061bdd  --path_output=/tracking_output --use_maskrcnn --region_type=roi --use_map_lane --motion_model='const_v' --measurement_model=both --fix_bbox_size --dataset_name=Argoverse
```

You can use `--save_bev_imgs` to print birds-eye-view image as above example or `--show_segmentation` to plot 3D visualization of segmentation result if mayavi is installed. Tracker output format is the same as Argoverse tracking label format.  







