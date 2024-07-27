extends Area2D

export var texto = 'Eu posso usar manipular o tempo pra voltar la pra cima (aperte R)'
export var tempo = 6
export var trigger = "player"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_body_entered(body):
	if get_parent().has_node(trigger):
		if body.name == trigger:
			var player = body
			var timer = player.get_node("tutorial/timer")
			var label = player.get_node("tutorial/label")
			timer.start(tempo)
			label.visible=true
			label.text = texto


func _on_area_body_exited(body):
	if get_parent().has_node(trigger):
		if body.name == trigger:
			var player = body
			var timer = player.get_node("tutorial/timer")
			var label = player.get_node("tutorial/label")
			label.visible=false
