open Player

let print_board (board:gameboard) =
  let printerbaord = board in
  print_string("  0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9");
  for i = 0 to Array.length printerbaord - 1 do 
    print_newline ();
    print_string (string_of_int(i mod 10) ^ " ");
    for j = 0 to Array.length printerbaord.(i) - 1 do
      if printerbaord.(i).(j) = 'R' then 
        ANSITerminal.(print_string [red] 
                        (String.make 1 (printerbaord.(i).(j))))
      else if printerbaord.(i).(j) = 'B' then 
        ANSITerminal.(print_string [blue] 
                        (String.make 1 (printerbaord.(i).(j))))
      else if printerbaord.(i).(j) = 'G' then 
        ANSITerminal.(print_string [green] 
                        (String.make 1 (printerbaord.(i).(j))))
      else if printerbaord.(i).(j) = 'Y' then 
        ANSITerminal.(print_string [yellow] 
                        (String.make 1 (printerbaord.(i).(j))))
      else 
        print_char printerbaord.(i).(j);
      print_char ' ';
    done
  done

let piece_printer piece =
  for i = 0 to Array.length piece -1 do
    print_newline ();
    for j = 0 to Array.length piece.(i) -1 do
      if piece.(i).(j) = 'R' then 
        ANSITerminal.(print_string [red] 
                        (String.make 1 (piece.(i).(j))))
      else if piece.(i).(j) = 'B' then 
        ANSITerminal.(print_string [blue] 
                        (String.make 1 (piece.(i).(j))))
      else if piece.(i).(j) = 'Y' then 
        ANSITerminal.(print_string [yellow] 
                        (String.make 1 (piece.(i).(j))))
      else if piece.(i).(j) = 'G' then 
        ANSITerminal.(print_string [green] 
                        (String.make 1 (piece.(i).(j))))
      else
        print_char piece.(i).(j)
    done
  done


let piece_to_piecearray piece color= 
  let matrix = Array.make_matrix 5 5 ' ' in
  let rec helper piece =
    match piece with
    |[]->[]
    |(x,y)::t -> matrix.(x).(y) <- color; helper t
  in
  ignore(helper piece);
  matrix

let print_individual_piece indpiece color = 
  let orien = indpiece.shape in
  let matrixofpiece =  
    piece_to_piecearray (List.hd orien).coordinates color in
  piece_printer matrixofpiece


let print_pieces piecesplayer = 
  let allpieces = piecesplayer.inventory in
  let rec helper allpieces index = 
    match allpieces with
    |[] -> []
    |h::t -> begin
        print_newline();
        print_string("Piece: "^ string_of_int(index)); 
        print_individual_piece h piecesplayer.color; 
        helper t (index+1)
      end
  in 
  ignore(helper allpieces 0);
  ()

let player_list = [player_blue;
                   player_green;
                   player_red;
                   player_yellow]

let update_board player coordinate board =  
  let rec helper coordinate = 
    match coordinate with
    |[]->[]
    |(x,y)::t -> board.(x).(y) <- player.color; helper t
  in
  ignore (helper coordinate);
  board

let base_piece = [[' '; ' '; ' '; ' '; ' ']; [' '; ' '; ' '; ' '; ' '];
                  [' '; ' '; ' '; ' '; ' ']; [' '; ' '; ' '; ' '; ' ']; 
                  [' '; ' '; ' '; ' '; ' ']]

let print_char_list lst color =
  let string_of_char_list l = 
    String.concat " " (List.map (Char.escaped) l) in
  let char_list_to_string l = 
    String.concat "\n" (List.map string_of_char_list l) in
  if color = 'R' 
  then ANSITerminal.(print_string [red] (char_list_to_string lst))
  else if color = 'Y'
  then ANSITerminal.(print_string [yellow] (char_list_to_string lst))
  else if color = 'G' 
  then ANSITerminal.(print_string [green] (char_list_to_string lst))
  else if color = 'B' 
  then ANSITerminal.(print_string [blue] (char_list_to_string lst))
  else failwith "impossible"

let rec change_val_cols b row color y =
  match row with
  | [] -> row
  | h :: t ->
    if b = y 
    then color :: change_val_cols b t color (y+1) 
    else h :: change_val_cols b t color (y+1) 

let rec change_val_rows a b lst color x y =
  match lst with
  | [] -> lst
  | h :: t ->
    if a = x 
    then change_val_cols b h color y :: change_val_rows a b t color (x+1) y 
    else h :: change_val_rows a b t color (x+1) y

let rec fill_in_base base coordlst color =
  match coordlst with
  | [] -> base
  | (a, b) :: t -> 
    let newbase = change_val_rows a b base color 0 0 in
    fill_in_base newbase t color

let rec orientation_print_helper lst num color =
  match lst with
  | [] -> print_newline ();
  | h :: t -> 
    let coordlst = h.coordinates in
    print_newline ();
    print_string ("Orientation: " ^ string_of_int num);
    print_newline ();
    print_char_list (fill_in_base base_piece coordlst color) color;
    print_newline ();
    orientation_print_helper t (num+1) color

let print_orientation piece = 
  orientation_print_helper piece.shape 0 piece.color

let check_isvalid piece coordlst cornerlst board coordinate =
  is_valid piece coordlst cornerlst board coordinate

let check_inventory player =
  match player with
  | {inventory = inv; points = p; color = c} -> 
    match inv with
    | [] -> false
    | _ -> true

let match_color color score =
  if color = 'R'
  then ANSITerminal.(print_string [red] 
                       ("Red Player: " ^ string_of_int score))
  else if color = 'Y'
  then ANSITerminal.(print_string [yellow] 
                       ("Yellow Player: " ^ string_of_int score))
  else if color = 'G' 
  then ANSITerminal.(print_string [green] 
                       ("Green Player: " ^ string_of_int score))
  else if color = 'B' 
  then ANSITerminal.(print_string [blue] 
                       ("Blue Player: " ^ string_of_int score))
  else failwith "impossible"

let add_points piece player =
  let lst = List.hd piece.shape in
  let v = List.length lst.coordinates in
  {inventory = player.inventory; 
   points = v + player.points; 
   color = player.color}


let rec print_scores playerlst =
  match playerlst with
  | [] -> print_newline ()
  | h :: t -> 
    print_newline ();
    match_color h.color h.points;
    print_scores t