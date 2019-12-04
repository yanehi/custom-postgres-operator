# Using Patroni Service

1. Execute Shell on Pod
1. List all cluster members
  2.1 `patronictl -c /home/postgres/.config/patroni/patronictl.yaml list`
1. Execute switchover
  3.1 `patronictl -c /home/postgres/.config/patroni/patronictl.yaml switchover`