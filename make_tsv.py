# Referred to https://github.com/kwea123/nerf_pl/pull/72

import argparse
import os

def get_opts():
    parser = argparse.ArgumentParser()
    parser.add_argument('--dataset_type', type=str, default='phototourism',
                        help='dataset type(blender, phototourism, etc.)')
    parser.add_argument('--root_dir', type=str, required=True,
                        help='root directory of dataset')
    parser.add_argument('--train_dirs', nargs="+", type=str, default=[],
                        help='directory list for training')

    return parser.parse_args()

args = get_opts()
dataset_type = args.dataset_type
path = args.root_dir
train_dirs = args.train_dirs
images = f'{path}/colmap/sequences'
out_path = f'{path}/{dataset_type}.tsv'

db = []
header = ['filename', 'id', 'split', 'dataset']
for image in sorted(os.listdir(images)):
    db.append([image, '-1', 'train' if image.split('_')[0] in train_dirs else 'test', dataset_type]) # id

with open(out_path, 'w') as f:
    f.write('\t'.join(header))
    f.write('\n')
    for data in db:
        f.write('\t'.join(data))
        f.write('\n')