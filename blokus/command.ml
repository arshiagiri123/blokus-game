(* Note: You may introduce new code anywhere in this file. *) 
open Player

type command = 
  | Quit 
  | Continue 
  | Choose of int
  | EndGame

exception Empty

exception Malformed

let parse_first str =
  let string_list= String.split_on_char ' ' str in
  let filtered_string_list= List.filter (fun x-> x <> "") string_list in
  match filtered_string_list with
  | [] -> raise Empty
  | h::t -> if h= "quit" then Quit else Continue

let parse_int str =
  try int_of_string str with Failure _ -> -1

let parse str =
  let string_list= String.split_on_char ' ' str in
  let filtered_string_list= List.filter (fun x-> x <> "") string_list in
  match filtered_string_list with
  |[] -> raise Empty
  | h::t -> 
    if h = "quit" then Quit 
    else if h = "end" then EndGame
    else if parse_int str = -1 then Continue 
    else if parse_int str <> -1 then Choose (int_of_string str)
    else raise Malformed