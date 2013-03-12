
ls ${1}*.flv | while read line; do
  check=$( (timeout.sh ffplay ${line} -loglevel error -nodisp -autoexit > /dev/null) 2>&1 | wc -l )
  echo "${line} ${check}"
  if [ "${check}" -eq 0 ] ; then
    mv $line good/
  else
    mv $line bad/
  fi
done

