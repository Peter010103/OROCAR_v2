from moviepy.editor import *

clip = (VideoFileClip("./output/demo.avi"))
# clip = (VideoFileClip("PATH NAME").subclip((START TIME),(END TIME)) .resize(ACCORDING TO THE USER WISH)) 
clip.write_gif("output/demo.gif")