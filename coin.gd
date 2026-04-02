extends Area2D
signal collected

func _on_body_entered(_body):
	hide()
	collected.emit()
	$CollisionShape2D.set_deferred("disabled", true)
