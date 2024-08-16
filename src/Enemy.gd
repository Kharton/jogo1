extends DamagableChar
class_name Enemy, "res://assets/enemies/slime/slime_idle_anim_f0.png"


var path: PoolVector2Array

onready var nav: Navigation2D = get_tree().current_scene.get_node("Navigation2D")
onready var player: KinematicBody2D = get_tree().current_scene.get_node("Player")
onready var timer: Timer = get_node("PathTimer")

func chase():
	if path:
		var vector: Vector2 = path[0] - global_position #
		var distance: float = vector.length()
		if distance < 5:
			path.remove(0)
			if not path:
				pass
		direction = vector
		flipSprite(direction)


func _ready():
	pass # Replace with function body.



func _on_PathTimer_timeout():
	if is_instance_valid(player):
		path = nav.get_simple_path(global_position, player.position)
	else:
		timer.stop()
		path = []
		direction = Vector2.ZERO

