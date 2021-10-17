gitbook build
cd AlgorithmExercise
rm -r *
cd ..
cp _book/* AlgorithmExercise/ -r
rm AlgorithmExercise/AlgorithmExercise -r
cd AlgorithmExercise
git add .
git commit -m "update"
git push




