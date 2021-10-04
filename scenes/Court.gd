class_name Court
extends Node2D

onready var ball = $Ball
onready var p1ScoreLabel = $P1Score
onready var p2ScoreLabel = $P2Score
onready var restartTimer = $RestartGameTimer
onready var ballSpawnPosition = $BallSpawn
onready var p1Paddle = $LeftPlayerPaddle
onready var p2Paddle = $RightPlayerPaddle
onready var pauseScreen = $PauseScreen

var scoreP1 = 0
var scoreP2 = 0
	
func _process(_delta):
	p1ScoreLabel.text = str(scoreP1)
	p2ScoreLabel.text = str(scoreP2)
	
	if Input.is_action_just_pressed("exit"):
		_show_pause()

func _on_LeftLimit_body_entered(_body: Ball):
	scoreP2 += 1
	restartTimer.start()

func _on_RightLimit_body_entered(_body: Ball):
	scoreP1 += 1
	restartTimer.start()

func _on_RestartGameTimer_timeout():
	ball.position = ballSpawnPosition.position


func _on_LeftPaddleAIArea_body_entered(body: Ball):
	p1Paddle.ball = body

func _on_RightPaddleAIArea_body_entered(body: Ball):
	p2Paddle.ball = body


func _on_LeftPaddleAIArea_body_exited(_body: Ball):
	p1Paddle.ball = null


func _on_RightPaddleAIArea_body_exited(_body: Ball):
	p2Paddle.ball = null

func _show_pause():
	pauseScreen.popup()
	get_tree().set_deferred("paused", true)
