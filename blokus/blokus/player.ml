type orientation={
  coordinates: (int * int) list;
  corners: (int * int) list;
}

type piece = {
  color : char;
  mutable position_on_board: (int*int) list;
  mutable position_on_board_corners: (int*int) list;
  shape : orientation list;
}

type gameboard = char array array

type player={
  inventory: piece list; 
  mutable points : int;
  color: char;
}

let monomino_o1 = [(0,0)]
let monomino_o1_corners = [(0,0)]
let monomino = 
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = [{coordinates = monomino_o1; corners = monomino_o1_corners}]}

let domino_o1 = [(0,0); (0,1)]
let domino_o1_corners = [(0,0); (0,1)]
let domino_o2 = [(0,0); (1,0)]
let domino_o2_corners = [(0,0); (1,0)]
let domino = 
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = [{coordinates = domino_o1; corners = domino_o1_corners}; 
            {coordinates = domino_o2; corners = domino_o2_corners}]}

let tromino_p1_o1 = [(0,0); (0,1); (1,1)]
let tromino_p1_o1_corners = [(0,0); (0,1); (1,1)]
let tromino_p1_o2 = [(0,1); (1,0); (1,1)]
let tromino_p1_o2_corners = [(0,1); (1,0); (1,1)]
let tromino_p1_o3 = [(0,0); (1,0); (1,1)]
let tromino_p1_o3_corners = [(0,0); (1,0); (1,1)]
let tromino_p1_o4 = [(0,0); (0,1); (1,0)]
let tromino_p1_o4_corners = [(0,0); (0,1); (1,0)]
let tromino_p1 = 
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = [{coordinates = tromino_p1_o1; corners = tromino_p1_o1_corners};
            {coordinates = tromino_p1_o2; corners = tromino_p1_o2_corners}; 
            {coordinates = tromino_p1_o3; corners = tromino_p1_o3_corners};
            {coordinates = tromino_p1_o4; corners = tromino_p1_o4_corners}]}

let tromino_p2_o1 = [(0,0); (0,1); (0,2)]
let tromino_p2_o1_corners = [(0,0); (0,2)]
let tromino_p2_o2 = [(0,0); (1,0); (2,0)]
let tromino_p2_o2_corners = [(0,0); (2,0)]
let tromino_p2 = 
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = tromino_p2_o1; corners = tromino_p2_o1_corners};
      {coordinates = tromino_p2_o2; corners = tromino_p2_o2_corners}]}

let tetromino_p1_o1 = [(0,0); (0,1); (1,0); (1,1)]
let tetromino_p1_o1_corners = [(0,0); (0,1); (1,0); (1,1)]
let tetromino_p1 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = tetromino_p1_o1; corners = tetromino_p1_o1_corners}]}

let tetromino_p2_o1 = [(0,1); (1,0); (1,1); (1,2)]
let tetromino_p2_o1_corners = [(0,1); (1,0); (1,2)]
let tetromino_p2_o2 = [(0,0); (1,0); (1,1); (2,0)]
let tetromino_p2_o2_corners = [(0,0); (1,1); (2,0)]
let tetromino_p2_o3 = [(0,0); (0,1); (0,2); (1,1)]
let tetromino_p2_o3_corners = [(0,0); (0,2); (1,1)]
let tetromino_p2_o4 = [(0,1); (1,0); (1,1); (2,1)]
let tetromino_p2_o4_corners = [(0,1); (1,0); (2,1)]
let tetromino_p2 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = tetromino_p2_o1; corners = tetromino_p2_o1_corners};
      {coordinates = tetromino_p2_o2; corners = tetromino_p2_o2_corners}; 
      {coordinates = tetromino_p2_o3; corners = tetromino_p2_o3_corners};
      {coordinates = tetromino_p2_o4; corners = tetromino_p2_o4_corners}]}

let tetromino_p3_o1 = [(0,0); (0,1); (0,2); (0,3)]
let tetromino_p3_o1_corners = [(0,0); (0,3)]
let tetromino_p3_o2 = [(0,0); (1,0); (2,0); (3,0)]
let tetromino_p3_o2_corners = [(0,0); (3,0)]
let tetromino_p3 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = tetromino_p3_o1; corners = tetromino_p3_o1_corners};
      {coordinates = tetromino_p3_o2; corners = tetromino_p3_o2_corners}]}

let tetromino_p4_o1 = [(0,2); (1,0); (1,1); (1,2)]
let tetromino_p4_o1_corners = [(0,2); (1,0); (1,2);]
let tetromino_p4_o2 = [(0,0); (1,0); (2,0); (2,1)]
let tetromino_p4_o2_corners = [(0,0); (2,0); (2,1)]
let tetromino_p4_o3 = [(0,0); (0,1); (0,2); (1,0)]
let tetromino_p4_o3_corners = [(0,0); (0,2); (1,0)]
let tetromino_p4_o4 = [(0,0); (0,1); (1,1); (2,1)]
let tetromino_p4_o4_corners = [(0,0); (0,1); (2,1)]
let tetromino_p4 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = tetromino_p4_o1; corners = tetromino_p4_o1_corners};
      {coordinates = tetromino_p4_o2; corners = tetromino_p4_o2_corners}; 
      {coordinates = tetromino_p4_o3; corners = tetromino_p4_o3_corners};
      {coordinates = tetromino_p4_o4; corners = tetromino_p4_o4_corners}]}

let tetromino_p5_o1 = [(0,1); (0,2); (1,0); (1,1)]
let tetromino_p5_o1_corners = [(0,1); (0,2); (1,0); (1,1)]
let tetromino_p5_o2 = [(0,0); (1,0); (1,1); (2,1)]
let tetromino_p5_o2_corners = [(0,0); (1,0); (1,1); (2,1)]
let tetromino_p5 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = tetromino_p5_o1; corners = tetromino_p5_o1_corners};
      {coordinates = tetromino_p5_o2; corners = tetromino_p5_o2_corners};]}

let pentomino_p1_o1 = [(0,0); (1,0); (1,1); (1,2)]
let pentomino_p1_o1_corners = [(0,0); (1,0); (1,2)]
let pentomino_p1_o2 = [(0,0); (0,1); (1,0); (2,0)]
let pentomino_p1_o2_corners = [(0,0); (0,1); (2,0)]
let pentomino_p1_o3 = [(0,0); (0,1); (0,2); (1,2)]
let pentomino_p1_o3_corners = [(0,0); (0,2); (1,2)]
let pentomino_p1_o4 = [(0,1); (1,1); (2,0); (2,1)]
let pentomino_p1_o4_corners = [(0,1); (2,0); (2,1)]
let pentomino_p1 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p1_o1; corners = pentomino_p1_o1_corners};
      {coordinates = pentomino_p1_o2; corners = pentomino_p1_o2_corners}; 
      {coordinates = pentomino_p1_o3; corners = pentomino_p1_o3_corners};
      {coordinates = pentomino_p1_o4; corners = pentomino_p1_o4_corners}]}

let pentomino_p2_o1 = [(0,1); (1,1); (2,0); (2,1); (2,2)]
let pentomino_p2_corners = [(0,1); (2,0); (2,2)]
let pentomino_p2_o2 = [(0,0); (1,0); (1,1); (1,2); (2,0)]
let pentomino_p2_o2_corners = [(0,0); (1,2); (2,0)]
let pentomino_p2_o3 = [(0,0); (0,1); (0,2); (1,1); (2,1)]
let pentomino_p2_o3_corners = [(0,0); (0,2); (2,1)]
let pentomino_p2_o4 = [(0,2); (1,0); (1,1); (1,2); (2,2)]
let pentomino_p2_o4_corners = [(0,2); (1,0); (2,2)]
let pentomino_p2 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p2_o1; corners = pentomino_p2_corners};
      {coordinates = pentomino_p2_o2; corners = pentomino_p2_o2_corners}; 
      {coordinates = pentomino_p2_o3; corners = pentomino_p2_o3_corners};
      {coordinates = pentomino_p2_o4; corners = pentomino_p2_o4_corners}]}

let pentomino_p3_o1 = [(0,0); (1,0); (2,0); (2,1); (2,2)]
let pentomino_p3_o1_corners = [(0,0); (2,0); (2,2)]
let pentomino_p3_o2 = [(0,0); (0,1); (0,2); (1,0); (2,0)]
let pentomino_p3_o2_corners = [(0,0); (0,2); (2,0)]
let pentomino_p3_o3 = [(0,0); (0,1); (0,2); (1,2); (2,2)]
let pentomino_p3_o3_corners = [(0,0); (0,2); (2,2)]
let pentomino_p3_o4 = [(0,2); (1,2); (2,0); (2,1); (2,2)]
let pentomino_p3_o4_corners = [(0,2); (2,0); (2,2)]
let pentomino_p3 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p3_o1; corners = pentomino_p3_o1_corners};
      {coordinates = pentomino_p3_o2; corners = pentomino_p3_o2_corners}; 
      {coordinates = pentomino_p3_o3; corners = pentomino_p3_o3_corners};
      {coordinates = pentomino_p3_o4; corners = pentomino_p3_o4_corners}]}

let pentomino_p4_o1 = [(0,1); (0,2); (0,3); (1,0); (1,1)]
let pentomino_p4_o1_corners = [(0,1); (0,3); (1,0); (1,1)]
let pentomino_p4_o2 = [(0,0); (1,0); (1,1); (2,1); (3,1)]
let pentomino_p4_o2_corners = [(0,0); (1,0); (1,1); (3,1)]
let pentomino_p4_o3 = [(0,2); (0,3); (1,0); (1,1); (1,2)]
let pentomino_p4_o3_corners = [(0,2); (0,3); (1,0); (1,2)]
let pentomino_p4_o4 = [(0,0); (1,0); (2,0); (2,1); (3,1)]
let pentomino_p4_o4_corners = [(0,0); (2,0); (2,1); (3,1)]
let pentomino_p4 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p4_o1; corners = pentomino_p4_o1_corners};
      {coordinates = pentomino_p4_o2; corners = pentomino_p4_o2_corners}; 
      {coordinates = pentomino_p4_o3; corners = pentomino_p4_o3_corners};
      {coordinates = pentomino_p4_o4; corners = pentomino_p4_o4_corners}]}

let pentomino_p5_o1 = [(0,2); (1,0); (1,1); (1,2); (2,0)]
let pentomino_p5_o1_corners = [(0,2); (1,0); (1,2); (2,0)]
let pentomino_p5_o2 = [(0,0); (0,1); (1,1); (2,1); (2,2)]
let pentomino_p5_o2_corners = [(0,0); (0,1); (2,1); (2,2)]
let pentomino_p5 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p5_o1; corners = pentomino_p5_o1_corners};
      {coordinates = pentomino_p5_o2; corners = pentomino_p5_o2_corners}]}

let pentomino_p6_o1 = [(0,0); (1,0); (2,0); (3,0); (4,0)]
let pentomino_p6_o1_corners = [(0,0); (4,0)]
let pentomino_p6_o2 = [(0,0); (0,1); (0,2); (0,3); (0,4)]
let pentomino_p6_o2_corners = [(0,0); (0,4)]
let pentomino_p6 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p6_o1; corners = pentomino_p6_o1_corners};
      {coordinates = pentomino_p6_o2; corners = pentomino_p6_o2_corners}]}

let pentomino_p7_o1 = [(0,0); (1,0); (1,1); (2,0); (2,1)]
let pentomino_p7_o1_corners = [(0,0); (1,1); (2,0); (2,1)]
let pentomino_p7_o2 = [(0,0); (0,1); (0,2); (1,0); (1,1)]
let pentomino_p7_o2_corners = [(0,0); (0,2); (1,0); (1,1)]
let pentomino_p7_o3 = [(0,0); (0,1); (1,0); (1,1); (2,1)]
let pentomino_p7_o3_corners = [(0,0); (0,1); (1,0); (2,1)]
let pentomino_p7_o4 = [(0,1); (0,2); (1,0); (1,1); (1,2)]
let pentomino_p7_o4_corners = [(0,1); (0,2); (1,0); (1,2)]
let pentomino_p7 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p7_o1; corners = pentomino_p7_o1_corners};
      {coordinates = pentomino_p7_o2; corners = pentomino_p7_o2_corners}; 
      {coordinates = pentomino_p7_o3; corners = pentomino_p7_o3_corners};
      {coordinates = pentomino_p7_o4; corners = pentomino_p7_o4_corners}]}

let pentomino_p8_o1 = [(0,1); (0,2); (1,0); (1,1); (2,0)]
let pentomino_p8_o1_corners = [(0,1); (0,2); (1,0); (1,1); (2,0)]
let pentomino_p8_o2 = [(0,0); (0,1); (1,1); (1,2); (2,2)]
let pentomino_p8_o2_corners = [(0,0); (0,1); (1,1); (1,2); (2,2)]
let pentomino_p8_o3 = [(0,2); (1,1); (1,2); (2,0); (2,1)]
let pentomino_p8_o3_corners = [(0,2); (1,1); (1,2); (2,0); (2,1)]
let pentomino_p8_o4 = [(0,0); (1,0); (1,1); (2,1); (2,2)]
let pentomino_p8_o4_corners = [(0,0); (1,0); (1,1); (2,1); (2,2)]
let pentomino_p8 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p8_o1; corners = pentomino_p8_o1_corners};
      {coordinates = pentomino_p8_o2; corners = pentomino_p8_o2_corners}; 
      {coordinates = pentomino_p8_o3; corners = pentomino_p8_o3_corners};
      {coordinates = pentomino_p8_o4; corners = pentomino_p8_o4_corners}]}

let pentomino_p9_o1 = [(0,0); (0,1); (1,0); (2,0); (2,1)]
let pentomino_p9_o1_corners = [(0,0); (0,1); (2,0); (2,1)]
let pentomino_p9_o2 = [(0,0); (0,1); (0,2); (1,0); (1,2)]
let pentomino_p9_o2_corners = [(0,0); (0,2); (1,0); (1,2)]
let pentomino_p9_o3 = [(0,0); (0,1); (1,1); (2,0); (2,1)]
let pentomino_p9_o3_corners = [(0,0); (0,1); (2,0); (2,1)]
let pentomino_p9_o4 = [(0,0); (0,2); (1,0); (1,1); (1,2)]
let pentomino_p9_o4_corners = [(0,0); (0,2); (1,0); (1,2)]
let pentomino_p9 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p9_o1; corners = pentomino_p9_o1_corners};
      {coordinates = pentomino_p9_o2; corners = pentomino_p9_o2_corners}; 
      {coordinates = pentomino_p9_o3; corners = pentomino_p9_o3_corners};
      {coordinates = pentomino_p9_o4; corners = pentomino_p9_o4_corners}]}

let pentomino_p10_o1 = [(0,1); (0,2); (1,0); (1,1); (2,1)]
let pentomino_p10_o1_corners = [(0,1); (0,2); (1,0); (2,1)]
let pentomino_p10_o2 = [(0,1); (1,0); (1,1); (1,2); (2,2)]
let pentomino_p10_o2_corners = [(0,1); (1,0); (1,2); (2,2)]
let pentomino_p10_o3 = [(0,1); (1,1); (1,2); (2,0); (2,1)]
let pentomino_p10_o3_corners = [(0,1); (1,2); (2,0); (2,1)]
let pentomino_p10_o4 = [(0,0); (1,0); (1,1); (1,2); (2,1)]
let pentomino_p10_o4_corners = [(0,0); (1,0); (1,2); (2,1)]
let pentomino_p10 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p10_o1; corners = pentomino_p10_o1_corners};
      {coordinates = pentomino_p10_o2; corners = pentomino_p10_o2_corners}; 
      {coordinates = pentomino_p10_o3; corners = pentomino_p10_o3_corners};
      {coordinates = pentomino_p10_o4; corners = pentomino_p10_o4_corners}]}

let pentomino_p11_o1 = [(0,1); (1,0); (1,1); (1,2); (2,1)]
let pentomino_p11_o1_corners = [(0,1); (1,0); (1,2); (2,1)]
let pentomino_p11 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p11_o1; corners = pentomino_p11_o1_corners}]}

let pentomino_p12_o1 = [(0,1); (1,0); (1,1); (1,2); (1,3)]
let pentomino_p12_o1_corners = [(0,1); (1,0); (1,3)]
let pentomino_p12_o2 = [(0,0); (1,0); (1,1); (2,0); (3,0)]
let pentomino_p12_o2_corners = [(0,0); (1,1); (3,0)]
let pentomino_p12_o3 = [(0,0); (0,1); (0,2); (0,3); (1,2)]
let pentomino_p12_o3_corners = [(0,0); (0,3); (1,2)]
let pentomino_p12_o4 = [(0,1); (1,1); (2,0); (2,1); (3,1)]
let pentomino_p12_o4_corners = [(0,1); (2,0); (3,1)]
let pentomino_p12 =
  {color = 'W'; position_on_board = []; position_on_board_corners = [];
   shape = 
     [{coordinates = pentomino_p12_o1; corners = pentomino_p12_o1_corners};
      {coordinates = pentomino_p12_o2; corners = pentomino_p12_o2_corners}; 
      {coordinates = pentomino_p12_o3; corners = pentomino_p12_o3_corners};
      {coordinates = pentomino_p12_o4; corners = pentomino_p12_o4_corners}]}

let pieces = 
  [monomino; domino; tromino_p1; tromino_p2; tetromino_p1; tetromino_p2;
   tetromino_p3; tetromino_p4; tetromino_p5; pentomino_p1; pentomino_p2;
   pentomino_p3; pentomino_p4; pentomino_p5; pentomino_p6; pentomino_p7; 
   pentomino_p8; pentomino_p9; pentomino_p10; pentomino_p11; pentomino_p12]

let set_color c (piece : piece) = 
  { piece with color = c; }

(* [inventory_generator] returns a list of piece objects with color field
   equal to [c]. *)
let inventory_generator c = 
  List.map (set_color c) pieces

let player_red =
  { inventory = inventory_generator 'R'; points = 0; color = 'R' }
let player_green = 
  { inventory = inventory_generator 'G'; points = 0; color = 'G' }
let player_blue = 
  { inventory = inventory_generator 'B'; points = 0; color = 'B' }
let player_yellow = 
  { inventory = inventory_generator 'Y'; points = 0; color = 'Y' }

(** same_orientation returns true if two pieces, [piece1] and [piece2] are the 
    same piece with either the same exact orientation or a different orientation 
    or returns false otherwise, i.e. two unique/distinct pieces.*)
let rec same_orientation piece1 piece2 e =
  match piece1 with
  | [] -> true
  | h :: t -> 
    match piece2 with
    | [] -> true
    | a :: b ->
      if (h = a) then (
        same_orientation t b e
      ) else (
        false
      )

let rec get_next_index lst current x =
  match lst with
  | [] -> failwith "impossible"
  | h :: t -> 
    if h.color = current.color then x 
    else get_next_index t current (x+1)

let rec get_player_helper lst index num =
  match lst with
  | [] -> failwith "impo"
  | h :: t -> 
    if index = num then h else get_player_helper t index (num + 1)

let get_next_player lst current =
  let index = get_next_index lst current 0 in
  if index = List.length lst - 1 
  then get_player_helper lst 0 0
  else get_player_helper lst (index + 1) 0

let rec adjust_playerlist lst newplayer =
  match lst with
  | [] -> []
  | h :: t -> 
    if h.color = newplayer.color then newplayer :: t
    else h :: adjust_playerlist t newplayer

let rec remove_player lst playerr =
  match lst with
  | [] -> []
  | h :: t -> 
    if h.color = playerr.color then t
    else h :: remove_player t playerr

let return_inventory player =
  player.inventory

let rec placed_piece_helper inv piece =
  match inv with
  | [] -> failwith "Piece not in Inventory"
  | h :: t ->
    if (h = piece) then (
      t
    ) else (
      [h] @ placed_piece_helper t piece
    )

(** [placed_piece] returns the [player] with his/her inventory modified after
    removing the placed [piece] for their inventory. *)
let placed_piece piece player =
  {inventory = (placed_piece_helper (player.inventory) piece); 
   color = player.color; points = player.points}


let is_eliminated player = 
  if player.inventory = [] then true else false

(*let rec corner_place_algo piece coordinate = 
  match piece with
  |[]->[]
  |(x,y)::t -> ((x - (fst coordinate)), (y - (snd coordinate))):: (corner_place_algo t coordinate)*)

(*let rec place_algo piece coordinate = 
  match piece with
  |[]->[]
  |(x,y)::t -> ((x - (fst coordinate)), (y - (snd coordinate))):: (place_algo t coordinate)*)

let rec corner_place_algo piece coordinate = 
  match piece with
  |[]->[]
  |(x,y)::t -> if (x + (fst coordinate)) < 20 && (y + (snd coordinate)) < 20 
                  && (x + (fst coordinate)) >= 0 && (y + (snd coordinate)) >= 0
    then 
      ((x + (fst coordinate)), 
       (y + (snd coordinate)))::(corner_place_algo t coordinate) 
    else []

let rec place_algo piece coordinate = 
  match piece with
  |[]->[]
  |(x,y)::t -> if (x + (fst coordinate)) < 20 && (y + (snd coordinate)) < 20 
                  && (x + (fst coordinate)) >= 0 && (y + (snd coordinate)) >= 0 
    then 
      ((x + (fst coordinate)), 
       (y + (snd coordinate)))::(place_algo t coordinate) 
    else []

let get_head piece =
  match piece with
  |[]->(0,0)
  |(x,y)::t -> (x,y)

let get_tail piece = 
  match piece with
  |[]->[]
  |(x,y)::t -> t

let rec subtract_from_init piece head = 
  match piece with
  |[]->[]
  |(x,y)::t -> ((x - fst head), (y -snd head)) :: subtract_from_init t head

(* update position on board list*)
let place_piece piece coordinate =
  let head = get_head piece in
  let list_to_board = subtract_from_init piece head in
  place_algo list_to_board coordinate

let place_piece_corner piece coordinate =
  let head = get_head piece in
  let list_to_board = subtract_from_init piece head in
  corner_place_algo list_to_board coordinate

(*let place_piece_corner piece coordinate =
  match piece with
  |[]->[]
  |h::t -> coordinate :: (place_algo t coordinate)*)

let rec check_board piece board = 
  match piece with 
  | [] -> true
  |(x,y)::t -> if board.(x).(y) = '_' then check_board t board else false

let update_pos_on_board piece lst coordinate = 
  let posonboard = place_piece lst coordinate in
  let check_cond = if List.length posonboard = List.length lst then true 
    else false in
  if check_cond = true then piece.position_on_board <- posonboard 
  else piece.position_on_board <- []

let update_corn_on_board piece lst coordinate = 
  let cornonbord = place_piece_corner lst coordinate in
  let check_cond = if List.length cornonbord = List.length lst then true 
    else false in
  if check_cond = true then piece.position_on_board_corners <- cornonbord 
  else piece.position_on_board_corners <- []

(** see if we can actually place piece*)
let can_place_piece piece board =
  if piece.position_on_board = [] then false 
  else check_board piece.position_on_board board

(* [check_corners piece game] checks that the placed piece touches the 
    corner of one of the pieces on the board *)
let check_corners piece board =
  let corner_positions = piece.position_on_board_corners in
  let rec helper corner_positions board =
    match corner_positions with
    | [] -> false
    | (x,y)::t -> let continue = begin
        let has_left= (y - 1 < 0) || 
                      (List.mem (x, y-1) piece.position_on_board) 
        in 
        let has_right= (y + 1 >= Array.length board) || List.mem (x, y+1) 
                         piece.position_on_board in 
        let has_top= (x - 1 < 0) || List.mem (x-1, y) piece.position_on_board 
        in 
        let has_bottom= (x + 1 >= Array.length board) || List.mem (x+1, y) 
                          piece.position_on_board in 
        if has_bottom && has_top <> true && has_left && has_right <> true then 
          begin if (board.(x-1).(y+1)) = piece.color then true else false end  
        else if has_bottom && has_top <> true && has_left <> true && has_right  
        then begin
          if (board.(x-1).(y-1)) = piece.color then true else false end 
        else if has_bottom <> true && has_top && has_left && has_right <> true 
        then begin
          if (board.(x+1).(y+1)) = piece.color then true else false end 
        else if (has_top && has_right) && not (has_bottom && has_left) 
        then begin
          if (board.(x+1).(y-1)) = piece.color then true else false end 
        else if has_top && has_bottom <> true && 
                has_left <> true && has_right <> true then begin
          if ((board.(x+1).(y-1)) = piece.color || 
              (board.(x+1).(y+1)) = piece.color) then true else false end 
        else if has_bottom && has_top <> true && 
                has_left <>true  && has_right <> true then begin (* change *)
          if ((board.(x-1).(y-1)) = piece.color || 
              (board.(x-1).(y+1)) = piece.color) then true else false end 
        else if has_left && has_bottom <> true && 
                has_top <> true && has_right <>true then begin
          if ((board.(x-1).(y+1)) = piece.color || 
              (board.(x+1).(y+1)) = piece.color) then true else false end 
        else if has_right && not has_bottom && not has_top && not has_left 
        then begin
          if ((board.(x-1).(y-1)) = piece.color || 
              (board.(x+1).(y-1)) = piece.color) then true else false end 
        else if has_bottom && has_top then false 
        else if has_right && has_left then false 
        else false end 
      in if continue then true else helper t board
  in 
  helper corner_positions board

(* [check_faces piece game] checks that the placed piece does not 
   touch faces of pieces the same color. *)
let check_faces piece board = 
  let all_positions = piece.position_on_board in 
  let rec helper all_positions (board : gameboard) =
    match all_positions with
    | [] -> true
    | (x,y)::t -> begin
        if ((x-1) >= 0) && board.(x-1).(y) = piece.color then false 
        else if (x+ 1 < Array.length board) && board.(x+1).(y) = piece.color 
        then false 
        else if (y+ 1 < Array.length board) && board.(x).(y+1) = piece.color 
        then false 
        else if ((y-1) >= 0) && board.(x).(y-1) = piece.color then false
        else helper t board end 
  in helper all_positions board

let rec starting_pos_helper lst =
  match lst with
  | [] -> false
  | (a, b) :: t -> 
    if ((a = 0 && b = 0) || 
        (a = 0 && b = 19) ||
        (a = 19 && b = 0) || 
        (a = 19 && b = 19)) 
    then true else starting_pos_helper t

let starting_pos piece =
  starting_pos_helper piece.position_on_board

let is_valid piece coordlst cornerlst board coordinate = 
  update_pos_on_board piece coordlst coordinate;
  update_corn_on_board piece cornerlst coordinate;
  let can_we_place = can_place_piece piece board in
  if can_we_place = true then begin
    let cornerchecker = 
      if starting_pos piece 
      then true else check_corners piece board in
    if begin
      (cornerchecker)
      && (check_faces piece board = true) 
    end
    then true
    else false
  end
  else false

let actually_place_piece piece baord = ()