package demo

import "../lena"

FRUIT :: #load("demo.png")
CYAN   :: 9
BLUE   :: 10

main :: proc() {
	lena.init("Hello, Lena!", 128, 128, flags = {.HIDE_WINDOW, .HIDE_CURSOR})
	defer lena.destroy()

	lena.set_window_background(BLUE)
	// convert our clover PNG into a Lena image
	fruit := lena.create_image_from_png(FRUIT)
	defer lena.destroy_image(fruit)

	lena.show_window()

	for _ in lena.step() {
		if lena.key_pressed(.F11) {
			lena.toggle_fullscreen()
		}

		if lena.key_pressed(.ESCAPE) {
			lena.quit()
		}

		lena.clear_screen(CYAN)
		// draw composited canvas to screen
		lena.draw_image(fruit, 0, 0)

	}
}
