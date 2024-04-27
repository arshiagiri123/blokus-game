let corners_of_player_piece playerpiece = 
  let corner = [] in
  let corner1 = if playerpiece.(0).(0) then (0,0)::corner else corner in
  let corner2 = if playerpiece.(0).(4) then (0,4)::corner1 else corner1 in
  let corner3 = if playerpiece.(4).(0) then (4,0)::corner2 else corner2 in
  let corner4 = if playerpiece.(4).(4) then (4,4)::corner3 else corner3 in
  corner4

let check_right_left_i_z j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(0).(j+1) = false && playerpiece.(0).(j-1) = false then (0,j)::empty else empty in
  corner

let check_right_left_i_f j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(4).(j+1) = false && playerpiece.(4).(j-1) = false then (4,j)::empty else empty in
  corner

let check_right_bottom_i j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(0).(j+1) = false  && playerpiece.(1).(j) = false then (0,j)::empty else empty in
  corner

let check_right_top_i j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(4).(j+1) = false  && playerpiece.(3).(j) = false then (4,j)::empty else empty in
  corner

let check_left_bottom_i j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(0).(j-1) = false && playerpiece.(1).(j) = false then (0,j)::empty else empty in
  corner

let check_left_top_i j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(4).(j-1) = false && playerpiece.(3).(j) = false then (4,j)::empty else empty in
  corner

let check_i_zero j playerpiece = 
  let empty = [] in 
  if check_right_left_i_z j playerpiece <> [] then check_right_left_i_z j playerpiece
  else if check_right_bottom_i j playerpiece <> [] then check_right_bottom_i j playerpiece
  else if check_left_bottom_i j playerpiece <> [] then check_left_bottom_i j playerpiece
  else empty

let check_i_four j playerpiece = 
  let empty = [] in 
  if check_right_left_i_f j playerpiece <> [] then check_right_left_i_f j playerpiece
  else if check_right_top_i j playerpiece <> [] then check_right_top_i j playerpiece
  else if check_left_top_i j playerpiece <> [] then check_left_top_i j playerpiece
  else empty

let check_top_bottom_z_j i playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i-1).(0) = false && playerpiece.(i+1).(0) = false then (i,0)::empty else empty in
  corner

let check_right_bottom_j i playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i).(1) = false && playerpiece.(i-1).(0) = false then (i,0)::empty else empty in
  corner

let check_right_top i playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i).(1) = false && playerpiece.(i-1).(0) = false then (i,0)::empty else empty in
  corner

let check_top_bottom_f_j i playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i-1).(4) = false && playerpiece.(i+1).(4) = false then (i,4)::empty else empty in
  corner

let check_left_top_j i playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i).(3) = false && playerpiece.(i-1).(4) = false then (i,4)::empty else empty in
  corner

let check_left_bottom_j i playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i).(3) = false && playerpiece.(i+1).(4) = false then (i,4)::empty else empty in
  corner



let check_j_zero i playerpiece = 
  let empty =[] in 
  if check_top_bottom_z_j i playerpiece <> [] then check_top_bottom_z_j i playerpiece
  else if check_right_bottom_j i playerpiece <> [] then check_right_bottom_j i playerpiece
  else if check_right_top i playerpiece <> [] then check_right_top i playerpiece
  else empty

let check_j_four i playerpiece = 
  let empty =[] in 
  if check_top_bottom_f_j i playerpiece <> [] then check_top_bottom_f_j i playerpiece
  else if check_left_top_j i playerpiece <> [] then check_left_top_j i playerpiece
  else if check_left_bottom_j i playerpiece <> [] then check_left_bottom_j i playerpiece
  else empty

let check_right_left_top i j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i).(j+1) = false && playerpiece.(i).(j-1) = false && playerpiece.(i-1).(j) = false then (i,j)::empty else empty in
  corner

let check_bottom_left_top i j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i+1).(j) = false && playerpiece.(i).(j-1) = false && playerpiece.(i-1).(j) = false then (i,j)::empty else empty in
  corner

let check_bottom_right_top i j playerpiece = 
  let empty = [] in
  let corner = if playerpiece.(i+1).(j) = false && playerpiece.(i).(j-1) = false && playerpiece.(i-1).(j) = false then (i,j)::empty else empty in
  corner

let check_any i j playerpiece = 
  let empty =[] in 
  if check_right_left_top i j playerpiece <> [] then check_right_left_top i j playerpiece
  else if check_bottom_left_top i j playerpiece <> [] then check_bottom_left_top i j playerpiece
  else if check_bottom_right_top i j playerpiece <> [] then check_bottom_right_top i j playerpiece
  else empty


let find_corners_in_player_piece playerpiece = 
  let all_corners = ref [] in
  for i = 0 to 4 do
    for j = 0 to 4 do
      if i=0 && j<>0 && j<>4 && playerpiece.(i).(j) then all_corners := (check_i_zero j playerpiece)@ !all_corners
      else if j=0 && i<>0 && i<>4 && playerpiece.(i).(j) then all_corners := (check_j_zero i playerpiece)@ !all_corners
      else if i<>0 && j<>0 && j<>4 && i<>4 && playerpiece.(i).(j) then all_corners := (check_any i j playerpiece)@ !all_corners
      else if i=4 && j<>0 && j<>4 && playerpiece.(i).(j) then all_corners := (check_i_four j playerpiece)@ !all_corners
      else if j=4 && i<>0 && i<>4 && playerpiece.(i).(j) then all_corners := (check_j_four i playerpiece)@ !all_corners
      else all_corners := !all_corners
    done
  done;
  !all_corners

let get_all_corners playerpiece = 
  let check_corner_array = corners_of_player_piece playerpiece in
  let check_rest_of_array = find_corners_in_player_piece playerpiece in
  let all = check_corner_array@check_rest_of_array in
  all

let is_touching_simple coordinate board = 
  if board.gameboard.((fst coordinate)-1).((snd coordinate)-1) <> 'W' then true 
  else if board.gameboard.((fst coordinate)-1).((snd coordinate)+1) <> 'W'then true
else if board.gameboard.((fst coordinate)+1).((snd coordinate)-1) <> 'W'then true
else if board.gameboard.((fst coordinate)+1).((snd coordinate)+1) <> 'W'then true
else false 


let rec is_touching playerpiece coordinate board lst = 
  (*let allcorners = find_corners_in_player_piece playerpiece in*)
  match lst with
  |[] -> false
  |(x,y)::t-> if (x-1) = (fst coordinate) && (y+1) = (snd coordinate)then true 
    else if (x+1) = (fst coordinate) && (y-1) = (snd coordinate)then true
    else if (x-1) = (fst coordinate) && (y-1) = (snd coordinate)then true
    else if (x+1) = (fst coordinate) && (y+1) = (snd coordinate)then true
    else is_touching playerpiece coordinate board t