extends Node

var screenshot_resource

func _ready():
	$Grab.connect('pressed', self, '_grab_pressed')
	$Place.connect('pressed', self, '_place_pressed')


func _grab_pressed():
	var image = get_viewport().get_texture().get_data()
	image.flip_y()

	image.save_png('screenshot.png')
	
func _place_pressed():
	screenshot_resource = ImageTexture.new()
	screenshot_resource.load('screenshot.png')
	
	if (screenshot_resource):
		$ScreenshotTarget.set_texture(screenshot_resource)
