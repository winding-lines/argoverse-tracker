from argoverse.evaluation.eval_tracking import eval_tracks
import os.path

data_dir = "/data/argoai"
labels_dir = os.path.join(data_dir, "downloads/argoverse-tracking/test")
our_output = os.path.join(data_dir, "marius/argoverse-tracker")

log_id = "028d5cb1-f74d-366c-85ad-84fde69b0fd3"

labels = os.path.join(labels_dir, log_id)

run_id = "1ff75cd1-3613-11ea-8001-00d86118ce97/lane_1_fixbbox_1_rcnn_1_map_const_v_both_roi"
generated = os.path.join(our_output, run_id, log_id)


output = os.path.join(our_output, "report.txt")
centroid_method = "average" # "label_center"


"""
            "num_frames",
            "mota" - multiple object tracker accuracy
            "motp_c" - multiple object tracker precision centroid
            "motp_o" - multiple object tracker precision orientation
            "motp_i" - multiple object tracker precision iou
            "idf1" - global min-cost f1 score
            "mostly_tracked" - number of objects tracked for at least 80% of their lifespan
            "mostly_lost" - number of objectrs tracked for less than 20% of their lifespan
            "num_false_positives",
            "num_misses",
            "num_switches" - number of track switches
            "num_fragmentations" - total number of switches from tracked to untracked

        f"{fn} {num_frames} {mota:.2f} {motp_c:.2f} {motp_o:.2f} {motp_i:.2f} {idf1:.2f} {most_track:.2f} "
        f"{most_lost:.2f} {num_fp} {num_miss} {num_switch} {num_flag} \n"

"""
with open(output, "w") as out_file:
    eval_tracks([generated], [labels], 0, 100, out_file, "average")

print(f"wrote file {output}")