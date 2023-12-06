library("magick")

picture <- image_read("../images/noise_text_sketch_black.png")

pic <- image_negate(picture)

pic

image_write(pic, path = "../images/noise_text_sketch_gray.png", format = "png")

