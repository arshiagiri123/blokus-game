(**
   Parsing of player commands.
*)

(** The type [command] represents a player command that allows the user
    to do the following actions. *)
type command = 
  | Quit 
  | Continue 
  | Choose of int
  | EndGame


(** Raised when an empty command is parsed. *)
exception Empty

(** Raised when a malformed command is encountered. *)
exception Malformed

(** [parse str] takes in a string [str] and cleans it up so it can be matched
    with the commands described in type command. It parses the user input of a
    string "quit", "end" or a user inputed integer.*)
val parse : string -> command

(** [parse str] takes in a string [str] and converts it into an integer.
    This allows the user to choose the piece number, orientation number,
    and row column corrdinate.*)
val parse_int : string -> int