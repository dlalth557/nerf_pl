DATASET=$1
SCENE=$2
CKPT=$3
N_VOCAB=0
if [ ${SCENE} = "chess" ]then
   N_VOCAB=6100
elif [ ${SCENE} = "fire" ]; then
   N_VOCAB=4100
elif [ ${SCENE} = "heads" ]; then
   N_VOCAB=2100
elif [ ${SCENE} = "office" ]; then
   N_VOCAB=10100
elif [ ${SCENE} = "pumpkin" ]; then
   N_VOCAB=10100
elif [ ${SCENE} = "redkitchen" ]; then
   N_VOCAB=14100
elif [ ${SCENE} = "stairs" ]; then
   N_VOCAB=6100
fi

python eval.py \
   --dataset_name phototourism \
   --root_dir /mnt/hdd0/leemiso/${DATASET}/${SCENE} \
   --scene_name ${SCENE} \
   --split test \
   --N_samples 64 \
   --N_importance 64 \
   --img_downscale 2 \
   --use_cache \
   --N_vocab ${N_VOCAB} \
   --encode_a \
   --encode_t \
   --beta_min 0.03 \
   --gpus 0 \
   --ckpt_path ${CKPT} \
   --video_format mp4