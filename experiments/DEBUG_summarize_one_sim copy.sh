cd "$(dirname "$0")/.."  # cd to repo root.
mkdir -p models
mkdir -p results
set +x



sim_id=$1
out_id=""

if [[ ${sim_id} == "sync1" ]]
then
    out_id=Tab2_C3
elif [[ ${sim_id} == "sync2" ]]
then
    out_id=Tab6_C1
elif [[ ${sim_id} == "sync3" ]]
then
    out_id=Tab6_C3
elif [[ ${sim_id} == "sync6d" ]]
then
    out_id=Tab2_C6
elif [[ ${sim_id} == "sync7d" ]]
then
    out_id=Tab6_C4
elif [[ ${sim_id} == "sync8d" ]]
then
    out_id=Tab6_C6
elif [[ ${sim_id} == "sync1-p10" ]]
then
    out_id=Tab2_C1
elif [[ ${sim_id} == "sync1-p25" ]]
then
    out_id=Tab2_C2
elif [[ ${sim_id} == "sync6d-p10" ]]
then
    out_id=Tab2_C4
elif [[ ${sim_id} == "sync6d-p25" ]]
then
    out_id=Tab2_C5
elif [[ ${sim_id} == "sync1-miss-0.3" ]]
then
    out_id=Tab5_C1
elif [[ ${sim_id} == "sync1-miss-0.5" ]]
then
    out_id=Tab5_C2
elif [[ ${sim_id} == "sync1-miss-0.7" ]]
then
    out_id=Tab5_C3
elif [[ ${sim_id} == "sync6d-miss-0.3" ]]
then
    out_id=Tab5_C4
elif [[ ${sim_id} == "sync6d-miss-0.5" ]]
then
    out_id=Tab5_C5
elif [[ ${sim_id} == "sync6d-miss-0.7" ]]
then
    out_id=Tab5_C6
elif [[ ${sim_id} == "sync1-p50-h1" ]]
then
    out_id=Fig3_C2
elif [[ ${sim_id} == "sync1-p50-h2" ]]
then
    out_id=Fig3_C3
else
    echo "Setting ${sim_id} is not Found"
fi


set -x
python -u -m experiments.synth_eval --sim_id=${sim_id} --seed=100 > models/${sim_id}-sc-sum.txt
set +x

rm -f results/${out_id}_MAE.txt
touch results/${out_id}_MAE.txt


echo SyncTwin >> results/${out_id}_MAE.txt
grep -E "Treatment effect MAE" models/${sim_id}-prognostic_linear.txt >> results/${out_id}_MAE.txt

echo SyncTwin-Lr >> results/${out_id}_MAE.txt
grep -E "Treatment effect MAE" models/${sim_id}-prognostic_none.txt >> results/${out_id}_MAE.txt

echo SyncTwin-Ls >> results/${out_id}_MAE.txt
grep -E "Treatment effect MAE" models/${sim_id}-prognostic_recon.txt >> results/${out_id}_MAE.txt

cat results/${out_id}_MAE.txt
