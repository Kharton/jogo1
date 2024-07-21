extends KinematicBody2D

var velocity = Vector2(1,0)
var speed = 300

func _ready():
	pass

func _physics_process(delta):
	var info = move_and_collide(velocity.normalized()*delta*speed)


func _on_visibilityNotifier2D_screen_exited():
	queue_free()

func _on_area_body_entered(body):
	body.queue_free()
	queue_free()
