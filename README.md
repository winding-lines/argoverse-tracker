# Argoverse  Tracker

Based on https://github.com/alliecc/argoverse_baselinetracker

## 
Baseline tracker code release for the paper **Argoverse: 3D Tracking and Forecasting With Rich Maps**, CVPR 2019.
[[paper]](http://openaccess.thecvf.com/content_CVPR_2019/html/Chang_Argoverse_3D_Tracking_and_Forecasting_With_Rich_Maps_CVPR_2019_paper.html)&nbsp;  [[website]](https://www.argoverse.org/index.html)&nbsp;

## Introduction



## Docker Image

It might be tricky to install all the dependencies, so we provided docker image.
- Docker version 18.09.7, build 2d0083d

To run docker image, first install nvidia-docker and then run following command to build image using the provided DockerFile:
```shell
docker build -t baselinetracker docker/
```
After building the image, run following command to start. Mount dataset folder so the data can be accessed in docker environment:
```shell
docker run --gpu all -v /path/to/argoverse-tracking/test:/data  -it baselinetracker:latest
```
And then clone this repo:
```shell
git clone https://github.com/winding-lines/argoverse-tracker
cd argoverse-tracker
wget https://www.nayuki.io/res/smallest-enclosing-circle/smallestenclosingcircle.py
```
Here is an example command to start tracker. The tracking output would be stored in /tracking_output.
```shell
python3 run_tracking.py --path_dataset=/data --log_id=0f0d7759-fa6e-3296-b528-6c862d061bdd  --path_output=/tracking_output --use_maskrcnn --region_type=roi --use_map_lane --motion_model='const_v' --measurement_model=both --fix_bbox_size --dataset_name=Argoverse
```

You can use `--save_bev_imgs` to print birds-eye-view image as above example or `--show_segmentation` to plot 3D visualization of segmentation result if mayavi is installed. Tracker output format is the same as Argoverse tracking label format.  







