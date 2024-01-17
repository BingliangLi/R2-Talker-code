# test Obama r2talker
method=r2talker # r2talker, genefaceDagger, rad-nerf
cond_type=idexp # eo, idexp
vid=nikki

python test.py \
    --method ${method} \
    --cond_type ${cond_type} \
    --pose ./data/nikki/transforms_val.json \
    --ckpt ./trial_r2talker_nikki_test_1_idexp_torso/checkpoints/ngp_ep0030.pth \
    --aud ./test/aud_eo.npy \
    --workspace nikki_test_piggy \
    --bg_img ./data/nikki/bc.jpg \
    -O --torso --data_range 200 300 

# merge audio with video
ffmpeg -y -i nikki_test_piggy/results/ngp_ep0030.mp4 -i ./test/aud.wav -c:v copy -c:a aac nikki_test_piggy/results/${method}_${vid}_${cond_type}_aud.mp4


# method=genefaceDagger
# cond_type=idexp
# vid=Obama

# python test.py \
#     --method ${method} \
#     --cond_type ${cond_type} \
#     --pose data/${vid}/transforms_val.json \
#     --ckpt trial_genefaceDagger_Obama_idexp/checkpoints/ngp.pth \
#     --aud data/${vid}/aud_idexp_val.npy \
#     --workspace trial_test \
#     --bg_img ./pretrained/bc.jpg \
#     -O --torso --data_range 200 300 



# method=rad-nerf
# cond_type=eo
# vid=Obama

# python test.py \
#     --method ${method} \
#     --cond_type ${cond_type} \
#     --pose data/${vid}/transforms_val.json \
#     --ckpt trial_rad-nerf_Obama_eo_torso/checkpoints/ngp.pth \
#     --aud data/${vid}/aud_eo.npy \
#     --workspace trial_test \
#     --bg_img data/${vid}/bc.jpg \
#     -O --torso --data_range 200 300 