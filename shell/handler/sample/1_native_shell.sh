# It's compatible to run a native bash script, but it's strongly unrecommended.
# The code will be wrapped in the launcher.sh context

name="world"
if [ $# -ne 0 ];then
    name="$1"
fi
echo "hello, $name!"
echo "It's a native bash shell!"