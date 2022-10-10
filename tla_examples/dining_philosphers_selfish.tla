---- MODULE dining_philosophers_selfish ----

(***)
(* Assume 2 philosophers, 4 hands, and 2 chopsticks *)
(* Each philosopher can pick up at most two chop sticks *)
(* Once a philosopher has a chopstick, they selfishly try to take the other chopstick *)

(* spatial layout                                                  *)
(*                                                                 *)
(*               philA_left     chopstick1   philB_right           *)
(*     philA                                               philB   *)
(*               philA_right    chopstick2   philB_left            *)
(*                                                                 *)

VARIABLES   philosopher_A_lefthand,
            philosopher_A_righthand,
            philosopher_B_lefthand,
            philosopher_B_righthand

(* values *)
TypeOk ==   /\ philosopher_A_lefthand  \in {"empty", "has_chopstick_1"}
            /\ philosopher_A_righthand \in {"empty", "has_chopstick_2"}
            /\ philosopher_B_lefthand  \in {"empty", "has_chopstick_2"}
            /\ philosopher_B_righthand \in {"empty", "has_chopstick_1"}

Init == /\ philosopher_A_lefthand = "empty"
        /\ philosopher_A_righthand = "empty"
        /\ philosopher_B_lefthand = "empty"
        /\ philosopher_B_righthand = "empty"

(***************************************************************************)
(* Define the actions   *)
(* the following makes the process serial rather than concurrent *)

philosopher_A_takes_chopstick_1 == /\ philosopher_A_lefthand' = "has_chopstick_1"
                                 /\ philosopher_A_righthand' = philosopher_A_righthand
                                 /\ philosopher_B_lefthand' = philosopher_B_lefthand
                                 /\ philosopher_B_righthand' = philosopher_B_righthand

philosopher_A_takes_chopstick_2 == /\ philosopher_A_lefthand' = philosopher_A_lefthand
                                 /\ philosopher_A_righthand' = "has_chopstick_2"
                                 /\ philosopher_B_lefthand' = philosopher_B_lefthand
                                 /\ philosopher_B_righthand' = philosopher_B_righthand

philosopher_B_takes_chopstick_1 == /\ philosopher_A_lefthand' = philosopher_A_lefthand
                                  /\ philosopher_A_righthand' = philosopher_A_righthand
                                  /\ philosopher_B_lefthand' = philosopher_B_lefthand
                                  /\ philosopher_B_righthand' = "has_chopstick_1"

philosopher_B_takes_chopstick_2 == /\ philosopher_A_lefthand' = philosopher_A_lefthand
                                  /\ philosopher_A_righthand' = philosopher_A_righthand
                                  /\ philosopher_B_lefthand' = "has_chopstick_2"
                                  /\ philosopher_B_righthand' = philosopher_B_righthand

philosopher_A_puts_chopstick_1_down == /\ philosopher_A_lefthand' = "empty"
                                     /\ philosopher_A_righthand' = philosopher_A_righthand
                                     /\ philosopher_B_lefthand' = philosopher_B_lefthand
                                     /\ philosopher_B_righthand' = philosopher_B_righthand

philosopher_A_puts_chopstick_2_down == /\ philosopher_A_lefthand' = philosopher_A_lefthand
                                     /\ philosopher_A_righthand' = "empty"
                                     /\ philosopher_B_lefthand' = philosopher_B_lefthand
                                     /\ philosopher_B_righthand' = philosopher_B_righthand

philosopher_B_puts_chopstick_1_down == /\ philosopher_A_lefthand' = philosopher_A_lefthand
                                     /\ philosopher_A_righthand' = philosopher_A_righthand
                                     /\ philosopher_B_lefthand' = philosopher_B_lefthand
                                     /\ philosopher_B_righthand' = "empty"

philosopher_B_puts_chopstick_2_down == /\ philosopher_A_lefthand' = philosopher_A_lefthand
                                     /\ philosopher_A_righthand' = philosopher_A_righthand
                                     /\ philosopher_B_lefthand' = "empty"
                                     /\ philosopher_B_righthand' = philosopher_B_righthand

(***************************************************************************)
(* Define the next-state relation  *)

Next == \/ philosopher_A_takes_chopstick_1
        \/ philosopher_A_takes_chopstick_2
        \/ philosopher_B_takes_chopstick_1
        \/ philosopher_B_takes_chopstick_2
        \/ philosopher_A_puts_chopstick_1_down
        \/ philosopher_A_puts_chopstick_2_down
        \/ philosopher_B_puts_chopstick_1_down
        \/ philosopher_B_puts_chopstick_2_down

(***************************************************************************)
(* Define the formula Spec to be the complete specification, asserting       *)
(* of a behavior that it begins in a state satisfying Init, and that every *)
(* step either satisfies Next or else leaves the set of locations unchanged *)

Spec == Init /\ [][Next]_<<philosopher_A_lefthand,philosopher_A_righthand,philosopher_B_lefthand,philosopher_B_righthand>> 


====
