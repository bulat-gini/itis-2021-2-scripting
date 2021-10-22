# Author: Bulat Giniyatullin
declare -i STEP=0
declare -a LAST_TEN
declare -i HIT=0
declare -i MISS=0
while true; do
  echo "Step: $STEP";
  while true; do
    echo -n "Enter number from 0 to 9 (q to quit): ";
    read -r INPUT
    if [ "$INPUT" = "q" ]; then
        echo "Bye!";
        exit;
    elif [ "$INPUT" -le 9 ] 2>/dev/null && [ "$INPUT" -ge 0 ] 2>/dev/null; then
      break ;
    else
      echo "Wrong number. Try again.";
      continue ;
    fi
  done
  NUMBER=$((RANDOM % 10))
  declare NUMBER_REPR="$NUMBER"
  if [ "$NUMBER" -eq "$INPUT" ]; then
    echo "Excellent, buddy!"
    NUMBER_REPR="$NUMBER_REPR+"
    HIT=$((HIT + 1))
  else
    echo "Wrong ((. Number was $NUMBER"
    MISS=$((MISS + 1))
  fi
  if [ "${#LAST_TEN[@]}" -ge 10 ]; then
    LAST_TEN=("${LAST_TEN[@]:1}")
  fi
  LAST_TEN["${#LAST_TEN[@]}"]=$NUMBER_REPR
  TOTAL=$((HIT + MISS))
  echo -n "Hit: $(echo "scale=2;($HIT / $TOTAL) * 100" | bc)% "
  echo "Miss: $(echo "scale=2;($MISS / $TOTAL) * 100" | bc)%"
  echo "${LAST_TEN[@]}"
  STEP=$((STEP + 1));
  echo "---"
done
