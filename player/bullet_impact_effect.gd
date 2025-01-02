extends AnimatedSprite2D


func _on_timer_timeout():
	queue_free() # so once run the effect, it cleans up
