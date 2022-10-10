---- MODULE serial_sandwich ----

(***********************************************************************************)
(* inspired by                                                                     *)
(* https://github.com/jameshfisher/tlaplus/blob/master/examples/DieHard/DieHard.tla *)

(***************************************************************************)
(* jam starts in fridge,                                                   *)
(* peanut butter (pb) in pantry, and bread is on table.                    *)
(* To construct the sandwich, gather all items on the table.               *)
(* After sandwich is made, return items to their original location.        *)

VARIABLES jam_location,
          pb_location,
          bread_location

(***************************************************************************)
(* valid locations for each of the   *)
(* three items to be                 *)

TypeOk == /\ jam_location \in {"fridge", "table"}
          /\ pb_location \in {"pantry", "table"}
          /\ bread_location \in {"table"}

(***************************************************************************)
(* Define of the initial predicate --             *)
(* specifies the initial values of the variables. *)

Init == /\ jam_location = "fridge"
        /\ pb_location = "pantry"
        /\ bread_location = "table"

(***************************************************************************)
(* Define the actions   *)

MoveJamToTable == /\ jam_location' = "table"
                  /\ pb_location' = pb_location
                  /\ bread_location' = bread_location

MoveJamToFridge == /\ jam_location' = "fridge"
                   /\ pb_location' = pb_location
                   /\ bread_location' = bread_location

MovePbToTable == /\ jam_location' = jam_location
                 /\ pb_location' = "table"
                 /\ bread_location' = bread_location
    
MovePbToPantry == /\ jam_location' = jam_location
                  /\ pb_location' = "pantry"
                  /\ bread_location' = bread_location
    
(***************************************************************************)
(* Define the next-state relation  *)

Next == \/ MoveJamToTable
        \/ MoveJamToFridge
        \/ MovePbToTable
        \/ MovePbToPantry

(***************************************************************************)
(* Define the formula Spec to be the complete specification, asserting       *)
(* of a behavior that it begins in a state satisfying Init, and that every *)
(* step either satisfies Next or else leaves the set of locations unchanged *)

Spec == Init /\ [][Next]_<<jam_location,pb_location,bread_location>> 

(***************************************************************************)
(* Successful sandwich will be completed when two conditions are met       *)
(* 1) <<jam,pb,bread>> are all on table,                                   *)
(* and then, sometime later                                                *)
(* 2) <<jam,pb,bread>> are back to their initial locations.                 *)

MakeSandwich == /\ jam_location = "table"
                  /\ pb_location = "table"
                  /\ bread_location = "table"

(* I'm not clear how to express the terminating condition. *)
(* https://learntla.com/core/temporal-logic.html#eventually-diamond *)
(* https://learntla.com/core/temporal-logic.html#id2 *)

(* Done == MakeSandwich ~> Init *)

====

