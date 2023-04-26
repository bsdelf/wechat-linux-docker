xhost +
docker run \
    -it \
    --rm \
    --ipc=host \
    -e DISPLAY=$DISPLAY \
    -e XMODIFIERS=$XMODIFIERS \
    -e QT_IM_MODULE=$QT_IM_MODULE \
    -e GTK_IM_MODULE=$GTK_IM_MODULE \
    -v /etc/localtime:/etc/localtime:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
    -v $HOME/.config/wechat:/root/.config/wechat \
    wechat:latest 2>&1 > /dev/null
xhost -
