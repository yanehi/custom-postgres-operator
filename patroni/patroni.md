





# Using Patroni Service

* Execute Shell on Pod
* List all cluster members
  * `patronictl -c /home/postgres/.config/patroni/patronictl.yaml list`
* Execute switchover
  * `patronictl -c /home/postgres/.config/patroni/patronictl.yaml switchover`
