(**
   This module handles the user interface.
*)

open Player

(** [print_board board] prints the [board] passed in. *)
val print_board: gameboard -> unit

(** [print_pieces p] prints all the pieces in the player [p]'s
    inventory *)
val print_pieces: Player.player -> unit

(** [player_list playerlst] contains the list [playerlst] of all four 
    players in the game: player_blue, player_green, player_red, 
    player_yellow *)
val player_list: player list

(** [update_board p coordlst board] uses player [p]'s color and [coordlst]
    and the current [board] and updates the board according to the piece
    passed in. *)
val update_board: 
  Player.player -> (int * int) list -> char array array -> char array array

(** [print_orientation piece] prints all possible orientations 
    of the [piece]. *)
val print_orientation: Player.piece -> unit

(** [print_scores lst] prints the scores of each player in the [lst]. *)
val print_scores: Player.player list -> unit

(** [add_points piece player] returns the [player] with his/her points 
    incremented with respect to the contribution of the [piece].
    For example: a tetromino contributes 4 points, domino 2, etc. *)
val add_points: Player.piece -> Player.player -> Player.player