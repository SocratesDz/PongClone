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
onready var resultScreen = $ResultScreen

const MAX_SCORE := 5

var scoreP1 := 0
var scoreP2 := 0
	
func _process(_delta) -> void:
	p1ScoreLabel.text = str(scoreP1)
	p2ScoreLabel.text = str(scoreP2)

func _on_LeftLimit_body_entered(_body: Ball) -> void:
	scoreP2 += 1
	_calculate_result_and_show(scoreP2, "P2")

func _on_RightLimit_body_entered(_body: Ball) -> void:
	scoreP1 += 1
	_calculate_result_and_show(scoreP1, "P1")

func _on_RestartGameTimer_timeout() -> void:
	ball.position = ballSpawnPosition.position


func _on_LeftPaddleAIArea_body_entered(body: Ball) -> void:
	p1Paddle.ball = body

func _on_RightPaddleAIArea_body_entered(body: Ball) -> void:
	p2Paddle.ball = body


func _on_LeftPaddleAIArea_body_exited(_body: Ball) -> void:
	p1Paddle.ball = null


func _on_RightPaddleAIArea_body_exited(_body: Ball) -> void:
	p2Paddle.ball = null

func _calculate_result_and_show(score: int, player_name: String) -> void:
	if score >= MAX_SCORE:
		resultScreen.player_name = player_name
		resultScreen.visible = true
		yield(get_tree().create_timer(1), "timeout")
		get_tree().set_deferred("paused", true)
		pauseScreen.set_process_input(false)
	else:
		restartTimer.start()
