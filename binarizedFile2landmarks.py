import numpy as np

data = np.load("../GeneFace/data/binary/videos/nikki/trainval_dataset.npy", allow_pickle=True).tolist()
print(data.keys())
train_samples = data['train_samples']
val_samples = data['val_samples']

train_lm3d = []
val_lm3d = []
lm3d = []

for sample in train_samples:
    train_lm3d.append(sample['idexp_lm3d'])
    lm3d.append(sample['idexp_lm3d'])

for sample in val_samples:
    val_lm3d.append(sample['idexp_lm3d'])
    lm3d.append(sample['idexp_lm3d'])

np.save('./data/nikki/aud_idexp_train.npy', np.array(train_lm3d))
np.save('./data/nikki/aud_idexp_val.npy', np.array(val_lm3d))
np.save('./data/nikki/aud_idexp.npy', np.array(lm3d))