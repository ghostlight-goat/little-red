extends Area2D
signal collected
var speed = 400
var angular_speed = PI

func _process(delta):
	rotation += angular_speed * delta

func _on_body_entered(_body):
	hide()
	collected.emit()
	$CollisionShape2D.set_deferred("disabled", true)
