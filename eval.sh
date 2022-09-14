DATASET=$1
CKPT=$2
NVOCAB=0
if [ ${DATASET} == "fire" ]; then
NVOCAB=4100
fi

python eval.py \
   --dataset_name phototourism \
   --root_dir /mnt/ssd0/leemiso/nerf/${DATASET} \
   --scene_name ${DATASET} \
   --split "test" \
   --img_downscale 2 \
   --N_samples 128 \
   --N_importance 128 \
   --N_importance 128 \
   --img_downscale 2 \
   --use_cache \
   --N_vocab ${NVOCAB} \
   --encode_a \
   --encode_t \
   --beta_min 0.03 \
   --chunk 65536 \
   --ckpt_path ${CKPT} \
   --video_format mp4