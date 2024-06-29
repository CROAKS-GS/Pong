extends Node

var player1score
var player2score

signal bounce


# Called when the node enters the scene tree for the first time.
func _ready():
	$Background.visible = false

func new_game():
	$Background.visible = true
	$ColorRect.visible = false
	$player1.start($Player1Position.position)
	$player2.start($Player2Position.position)
	$Ball.start(0)
	player1score = 0
	player2score = 0

func additional_game():
	$Background.visible = false
	$ColorRect.visible = true
	$player1.hide()
	$player2.hide()
	$Ball.hide()
	$Ball.velocity = Vector2.ZERO

func reset():	
	$player1.start($Player1Position.position)
	$player2.start($Player2Position.position)
	$Ball.start(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(player1score == 5):
		$HUD.results(1)
	if(player2score == 5):
		$HUD.results(2)
	

func _on_playerhit():
	bounce.emit()

func _on_ball_player_1_score():
	player1score += 1
	$HUD.update_p1_score(player1score)
	reset()
func _on_ball_player_2_score():
	player2score += 1
	$HUD.update_p2_score(player2score)
	reset()
