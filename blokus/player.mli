(**
   This module is the game engine.
*)

(** The type containing the orientation for a specific piece. *)
type orientation={
  coordinates: (int * int) list;
  corners: (int * int) list;
}

(** The type containing all the pieces information *)
type piece = {
  color : char;
  mutable position_on_board: (int*int) list;
  mutable position_on_board_corners: (int*int) list;
  shape : orientation list;
}

(** The type of the gameboard. *)
type gameboard = char array array

(** The type conataining all the players information. *)
type player={
  inventory: piece list; 
  mutable points : int;
  color: char;
}


(** [placed_piece p] removes the piece that [p] represents.
    Requires: [p] is a valid player piece representation present in 
    the player's inventory. *)
val placed_piece : piece -> player -> player

(** [check_corners p g] returns true if the piece that [p] represents touches
    one of corners of its own pieces on the gameboard that [g] represents 
    Requires: [p] is a valid player piece representation present in 
    the player's inventory. *)
val check_corners: piece -> gameboard -> bool 

(** [check_faces p g] returns false if the piece that [p] represents touches
    one of faces of its own pieces on the gameboard that [g] represents 
    Requires: [p] is a valid player piece representation present in 
    the player's inventory. *)
val check_faces: piece -> gameboard -> bool

(** [place_piece lst coord lst] takes the coordinate list [lst] of a piece
    and returns the placed pieces' new on-board coordinate list 
    with a series of helper functions given a user defined set of
    coordinates [coord]. *)
val place_piece: (int * int) list -> int * int -> (int * int) list

(** [is_valid p coordlst cornerlst board coord] checks to see if a move is 
    valid. Uses the [coordlst] and [cornerlst] to update the position
    on board with regard to the [coordinates] and [board] passed in. 
    Returns true if it is a valid move and false if not *)
val is_valid: 
  piece -> 
  (int * int) list -> (int * int) list -> gameboard -> int * int -> bool

(** [player_red] is the red player in the game with all 21 pieces 
    represented by the player type *)
val player_red: player

(** [player_green] is the green player in the game with all 21 pieces 
    represented by the player type *)
val player_green: player

(** [player_blue] is the blue player in the game with all 21 pieces 
    represented by the player type *)
val player_blue: player

(** [player_yellow] is the yellow player in the game with all 21 pieces 
    represented by the player type *)
val player_yellow: player

(** [adjust_playerlist lst player] returns the [lst] with the new [player] 
    swapped in for its old version. The input player should match a player 
    in lst in terms of color. *)
val adjust_playerlist: player list -> player -> player list

(** [get_next_player lst player] returns the player following [player] in the 
    [lst]. 
    For example: the list is lst = [player1; player2; player3; player4], 
    get_next_player lst player2 returns player3. *)
val get_next_player: player list -> player -> player

(** [remove_player lst player] removes [player] from lst and returns the 
    modified list. If the player doesn't exist in lst then the list is 
    returned unaltered. *)
val remove_player: player list -> player -> player list

(** [add_player lst1 lst2 player] adds a [player] to [lst1] if and only if
    that player happens to be in [lst2]. *)
val add_player: player list -> player list -> player -> player list

(** [can_place_piece p board] determines wether a piece [p] can be placed
    on the [board] given that the coordinates in [p]'s position_on_board
    list are empty on the actual board. *)
val can_place_piece: piece -> char array array -> bool


(*val update_pos_on_board: piece -> (int * int) list -> int * int -> unit*)

(*val update_corn_on_board: piece -> (int * int) list -> int * int -> unit*)