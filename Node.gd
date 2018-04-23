extends Node

var screenshot_resource
var clicked = 0

func _ready():
	$Grab.connect('pressed', self, '_grab_pressed')
	$Place.connect('pressed', self, '_place_pressed')


func _grab_pressed():
	clicked += 1
	$Label.text = str('Grabbed %d times' % [clicked])

	var image = get_viewport().get_texture().get_data()
	image.flip_y()
	screenshot_resource = ImageTexture.new()
	screenshot_resource.create_from_image(image)
	
func _place_pressed():
	if (screenshot_resource):
		$ScreenshotTarget.set_texture(screenshot_resource)
