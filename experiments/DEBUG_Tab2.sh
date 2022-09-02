cd "$(dirname "$0")/.."  # cd to repo root.
mkdir -p models
mkdir -p results
set +x



# small data
set -x
python -u -m experiments.pkpd_sim3_bias_generation --sim_id=sync1-p10 --control_sample=200 --control_c1=20 --train_step=25 --step=30 --seed=100
set +x


bash experiments/DEBUG_run_one_sim_bias.sh sync1-p10 1.5


# summarize
bash experiments/DEBUG_summarize_one_sim.sh sync1-p10
