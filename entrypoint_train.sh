#! /bin/bash
# roslaunch arena_bringup start_arena_flatland.launch  train_mode:=true 	use_viz:=true  task_mode:=random
roslaunch="$1"
python_train="$2"

echo "$roslaunch"
echo "$python_train"

source /opt/ros/melodic/setup.sh

export WORKON_HOME=/root/.python_env
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export PYTHONPATH=/root/catkin_ws/src/arena-rosnav:${PYTHONPATH}
source /usr/local/bin/virtualenvwrapper.sh
source /root/catkin_ws/devel/setup.bash
export PYTHONPATH=//geometry2_ws/devel/lib/python3/dist-packages:${PYTHONPATH}
source /root/.python_env/rosnav/bin/activate

screen -dmS roslaunch bash -c "source ./ros.sh "$roslaunch""
screen -S roslaunch -X logfile screenlog_roslaunch.log
screen -S roslaunch -X log
sleep 10

# python scripts/training/train_agent.py --agent MLP_ARENA2D

#bash ./py_train.sh $trainmode $agent
screen -dmS python_training bash -c "source ./py_train.sh "$python_train""
screen -S python_training -X logfile screenlog_python_train.log
screen -S python_training -X log
sleep 4

screen -dmS python_test python /root/catkin_ws/src/arena-rosnav/arena_navigation/arena_local_planner/learning_based/arena_local_planner_drl/scripts/training/train_agent.py "$python_train"
screen -S python_test -X logfile screenlog_python_test.log
screen -S python_test -X log
sleep 4


screen -ls
# bash
