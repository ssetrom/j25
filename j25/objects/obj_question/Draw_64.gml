
var cx  = 0
var cy  = 0

draw_set_alpha(1 * current_alpha)
draw_set_colour(c_white)
draw_text(640/2 - 100 + cx, 300 + cy - 50, "[A]")
draw_text(640/2 - 100 + cx + 4, 320 + cy - 50, "NO")

draw_text(640/2 + 100 + cx, 300 + cy - 50, "[D]")
draw_text(640/2 + 100 + cx, 320 + cy - 50, "YES")

draw_set_alpha(1)