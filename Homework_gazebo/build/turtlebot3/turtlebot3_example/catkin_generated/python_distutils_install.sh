#!/nix/store/cjbyb45nxiqidj95c4k1mh65azn1x896-bash-5.2-p21/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_example"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/lib/python3.11/site-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /nix/store/5idwbbv23b6vnqdicx97s3hsgrwwnj7j-coreutils-9.4/bin/env \
    PYTHONPATH="/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/lib/python3.11/site-packages:/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/lib/python3.11/site-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build" \
    "/nix/store/w4fvvhkzb0ssv0fw5j34pw09f0qw84w8-python3-3.11.7/bin/python3" \
    "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/src/turtlebot3/turtlebot3_example/setup.py" \
     \
    build --build-base "/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/build/turtlebot3/turtlebot3_example" \
    install \
    --root="${DESTDIR-/}" \
     --prefix="/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install" --install-scripts="/home/ionut/UNI/Year_3/AI_Python/Project/Homework_gazebo/install/bin"
