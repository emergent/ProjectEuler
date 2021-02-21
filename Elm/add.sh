#!/bin/bash
PROBLEM=$1
NUM=$(printf "%03d" $PROBLEM)
TEMPLATE=$(dirname $0)/template.elm.txt
URL="https:\/\/projecteuler.net\/problem=$PROBLEM"

cat $TEMPLATE \
| sed -e "s/%%id%%/${NUM}/g" \
| sed -e "s/%%title%%/Problem $PROBLEM - Project Euler/g" \
| sed -e "s/%%url%%/$URL/g" \
> $(dirname $0)/src/Problems/P${NUM}.elm


list=$(dirname $0)/src/Problems/List.elm
echo 'module Problems.List exposing (problems, solve)' > $list
echo "" >> $list
for f in $(dirname $0)/src/Problems/P*.elm;
do
    tmp=$(basename $f)
    echo "import Problems.${tmp%.elm}" >> $list
done
echo "problems : List Int" >> $list
echo "problems = " >> $list
for f in $(dirname $0)/src/Problems/P*.elm;
do
    tmp=$(basename $f)
    tmp2=$(echo ${tmp#P}|sed 's/^0*//')
    num=$((${tmp2%.elm} * 1))
    if [[ $(basename $f) = "P001.elm" ]]; then
        echo "    [" >> $list
    else
        echo "    ," >> $list
    fi
    echo "${num}" >> $list
    #echo "Problems.${tmp%.elm}.run" >> $list
done
echo "]" >> $list

echo "solve : Int -> Int" >> $list
echo "solve i = case i of" >> $list
for f in $(dirname $0)/src/Problems/P*.elm;
do
    tmp=$(basename $f)
    tmp2=$(echo ${tmp#P}|sed 's/^0*//')
    num=$((${tmp2%.elm} * 1))
    echo "    $num -> Problems.${tmp%.elm}.run True" >> $list
done
echo "    _ -> -1" >> $list

elm-format --yes $list


#INSERT="import Problems.P$NUM"
#BEFORE_IMPORT="import Problems.P001"
#TMP=$(mktemp)
#cat $MAIN \
#| sed 's/import ' > $TMP_FILE
#cp $TMP $MAIN

