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
out_path = os.path.join(args.root_dir, dataset_type+'.tsv')

db = []
header = ['filename', 'id', 'split', 'dataset']
seq_dirs = []
for file in sorted(os.listdir(args.root_dir)):
    if file.find('seq') == 0:
        seq_dirs.append(file)

for seq_dir in seq_dirs:
    is_train = True if seq_dir in args.train_dirs else False
    for image in sorted(os.listdir(os.path.join(args.root_dir, seq_dir))):
        if image.find('color.png') != -1:
            db.append([os.path.join(seq_dir, image), '-1', 'train' if is_train else 'test', dataset_type])

with open(out_path, 'w') as f:
    f.write('\t'.join(header))
    f.write('\n')
    for data in db:
        f.write('\t'.join(data))
        f.write('\n')