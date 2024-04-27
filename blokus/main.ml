open Game
open Player
open Command

let rec play_game_helper playerlist board currplayer player_scores =
  if List.length (playerlist) = 0 then  begin
    (*adjust score*)
    print_endline "Thank you for playing blokus! Here are the final scores:";
    print_scores player_scores;
    Stdlib.exit 0 
  end 
  else begin
    print_board board;
    print_newline ();
    (*check if inventory is empty*)
    print_pieces currplayer;
    print_endline 
      "Choose piece you want to place. If you want to quit type 'quit'. 
      If you want to terminate game type 'end'";
    match parse (read_line ()) with
    | exception Malformed-> begin
        print_endline "Your command isn't right! Try again!";
        play_game_helper playerlist board currplayer player_scores
      end
    | exception Empty-> begin
        print_endline "Your command is empty! Please enter a command!";
        play_game_helper playerlist board currplayer player_scores
      end
    | Quit-> begin
        print_endline "Thank you for playing the game!";
        let update_scorelist = 
          add_player player_scores playerlist currplayer in 
        let updatedlist = remove_player playerlist currplayer in
        let next_player = get_next_player playerlist currplayer in
        play_game_helper updatedlist board next_player update_scorelist
      end
    | Continue -> play_game_helper playerlist board currplayer player_scores
    | Choose t-> begin
        if List.length currplayer.inventory <= t then begin 
          print_endline "The piece does not exist! Try again!";
          play_game_helper playerlist board currplayer player_scores end
        else
          let specificpiece = List.nth currplayer.inventory t in
          print_orientation specificpiece;
          print_endline "Choose orientation you want to place.";
          let spec_int = parse_int (read_line ()) in
          if List.length specificpiece.shape <= spec_int then begin 
            print_endline "The orientation does not exist! Try again!";
            play_game_helper playerlist board currplayer player_scores end
          else
            let specific_orien = List.nth specificpiece.shape spec_int in
            (*add try catch for nth exception*)
            print_endline "Enter row # coordinate.";
            let x_coord = parse_int (read_line ()) in
            print_endline "Enter column # coordinate.";
            let y_coord = parse_int (read_line ()) in
            if is_valid specificpiece specific_orien.coordinates 
                specific_orien.corners board (x_coord,y_coord)
            then begin
              let coordonboard = specificpiece.position_on_board in
              let newboard = update_board currplayer coordonboard board in
              let addpoints_player = add_points specificpiece currplayer in
              let adjustedplayer = 
                placed_piece specificpiece addpoints_player in
              let adjustedplayerlist = 
                adjust_playerlist playerlist adjustedplayer in
              let next_player = get_next_player playerlist currplayer in
              play_game_helper adjustedplayerlist newboard 
                next_player player_scores
            end
            else begin
              print_endline "Invalid move! Your turn has been skipped!"; 
              let next_player = get_next_player playerlist currplayer in
              play_game_helper playerlist board next_player player_scores
            end
      end
    |EndGame ->
      print_endline "Thank you for playing blokus! Here are the final scores:";
      print_scores player_scores;
      Stdlib.exit 0 
  end
(** *)

(** [play_game f] starts the adventure in file [f]. *)
let play_game ()=
  let players = player_list in
  let official_board = Array.make_matrix 20 20 '-' in
  let currplayer = List.hd (players) in
  play_game_helper players official_board currplayer []


(** [main ()] prompts for the game to play, then starts it. *)
let main () =
  (**not printing this statement!!!*)
  ANSITerminal.(print_string [red] "\n\nWelcome to Blokus Game!
  Game Rules:
  - Each player chooses a color and places that set of 21 pieces in front of 
  ``his/her side of the board.
  - The order of play is as follows: blue, yellow, red, green.
  - The first piece played by each player must cover a corner square.
  - Each new piece must touch at least one other piece of the same color, but 
    only at the corners.
  - Pieces of the same color cannot be in contact along an edge.
  - There are no restrictions on how many pieces of different colors may be in 
    contact with each other.
  - Once a piece has been placed on the board it cannot be moved during 
    subsequent turns.
  - The game ends when all players quit the game
  - Scores are tallied, and the player with the highest score is the winner.
  - Each player then counts the number of unit squares in his/her remaining 
    pieces (1 unit square = -1 point).
  During each player’s turn, they will be given a choice on whether they want to 
  continue the game if they think they have more movements left or whether they 
  want to quit the game. If they choose to quit the game, they won’t have their 
  turn. Else, they will be prompted to choose a piece, if it's an invalid piece 
  they have chosen a number for the piece that does not exist, the game will 
  have an error. They are then prompted to choose the orientation for the piece 
  that they have chosen. Again, if the orientation number for that piece does 
  not exist, the game will end with an error. Next, the player will be prompted 
  to place the piece on the board. If the placed piece position is valid, i.e it 
  touches the corner of one if the same colored pieces on the board but does not 
  touch any of the faces of same colored pieces and does not overlap on any of
  the existing pieces on the board, the piece will be placed. Then another 
  player will be prompted to do the same. If the placed piece position is 
  invalid, the player’s turn will be skipped.
  \n");
  play_game ()

(* Execute the game engine. *)


let () = main ()