extends Node2D


var score_text_scene = preload("res://src/VFX/ScoreText.tscn")


func _ready():
	Events.connect("scored", self, "_score")
	Events.connect("track_finished", self, "_game_over")
	
	$AnimationPlayer.play("begin_game")


func _score(_msg : Dictionary) -> void:
	if _msg.has("score"):
		var new_score_text = score_text_scene.instance()
		new_score_text.global_position = get_global_mouse_position()
		new_score_text.set_score(_msg["score"])
		add_child(new_score_text)


func _game_over(_msg : Dictionary) -> void:
	$AnimationPlayer.play("game_over")

