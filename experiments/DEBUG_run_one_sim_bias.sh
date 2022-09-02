cd "$(dirname "$0")/.."  # cd to repo root.
mkdir -p models
mkdir -p results
set +x



sim_id=$1
tau=$2


set -x
python -u -m experiments.pkpd_sim3_model_training --regular=True --sim_id=${sim_id} --seed=100 --model_id=-prognostic-linear --reduced_fine_tune=True --tau=${tau} --lam_prognostic=1 --pretrain_Y=True --itr=3 --linear_decoder=True  > models/${sim_id}-prognostic_linear.txt
# python -u -m experiments.pkpd_sim3_model_training --regular=True --sim_id=${sim_id} --seed=100 --model_id=-prognostic-none --reduced_fine_tune=True --tau=${tau} --lam_prognostic=0 --pretrain_Y=False --itr=3 --linear_decoder=True  > models/${sim_id}-prognostic_none.txt
# python -u -m experiments.pkpd_sim3_model_training --regular=True --sim_id=${sim_id} --seed=100 --model_id=-prognostic-recon --reduced_fine_tune=True --tau=${tau} --lam_prognostic=1 --lam_recon=0 --pretrain_Y=True --itr=3 --linear_decoder=True  > models/${sim_id}-prognostic_recon.txt
set +x
