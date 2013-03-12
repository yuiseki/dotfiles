
fname=`date +%s`.flv

echo $fname

retry=10
check=1
while [ "${check}" -ne 0 ] ; do
  rtmpdump -v --stop 5\
    -r "rtmp://flash83.ustream.tv:1935/ustreamVideo/5883040/streams/live"\
    -a "ustreamVideo/5883040" -y "streams/live"\
    -f "LNX 10,0,42,34"\
    -o /home/yuiseki/scripts/opencv/flv/${fname} #&>/dev/null
  check=$( (ffplay ${fname} -loglevel error -nodisp -autoexit > /dev/null) 2>&1 | wc -l )
  retry=`expr $retry - 1`
  echo "${check} ${retry}"
  if [ "${retry}" -eq 0 ] ; then
    break
  fi
  sleep 2
done

#if [ "${check}" -ne 0 ] ; then
#  rm /home/yuiseki/scripts/opencv/flv/${fname}
#fi
