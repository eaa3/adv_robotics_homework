# adv_robotics_homework

Advanced robotics homework solutions in matlab (2014).

## Solutions include 

* Forward kinematics, inverse kinematics, forward dynamics (with the Newton-Euler algorithm).

Naming conventions follow Siciliano's book (http://www.springer.com/us/book/9783540382195).

## Dependencies:

* Peter Corke's Robotics Toolbox

To run the solutions setup Peter Corke's Robotics Toolbox following the instructions in http://petercorke.com/wordpress/toolboxes/robotics-toolbox/.


## Running the code

Initial testing examples are provided, with full details provided in the report. For testing inverse kinematics one can run:


### Testing forward kinematics demo

Tests forward kinematics comparing with builtin forward kinematics implemented in the Robotics Toolbox

```
test_fk
```

### Testing inverse kinematics demo

Tests ik by finding corresponding joint angles to take the robot to a given end-effector position and orientation. (call without args will use default parameters)

```
test_ik
```

![Inverse Kinematics](https://github.com/eaa3/adv_robotics_homework/raw/master/gifs/ik_test.gif)

### Testing forward dynamics with the Newton-Euler algorithm

1. Simulate a pendulum

```
simulate_pendulum
```

![Forward Dynamics Pendulum](https://github.com/eaa3/adv_robotics_homework/raw/master/gifs/pendulum.gif)

1. Simulate a 3-link arm under the effect of gravity

```
fdyn_ne(3)
```

![3-link arm](https://github.com/eaa3/adv_robotics_homework/raw/master/gifs/3-link-arm.gif)

1. Simulate a N-link arm under the effect of gravity

```
fdyn_ne(N)
```







