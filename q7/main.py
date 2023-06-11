import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import numpy as np

from PIL import Image, ImageDraw

# Create a new image with a white background
width, height = 500, 500
image = Image.new("RGB", (width, height), "white")

# Create a drawing object
draw = ImageDraw.Draw(image)

# Draw a rectangle on the image
left = 100
top = 100
right = 400
bottom = 400
draw.rectangle([left, top, right, bottom], fill="red")

# Save the image as a JPEG file
image.save("image.jpg", "JPEG")

image = 'image.jpg'

# RGB (3 streams) matrix representation of the image
labrat = mpimg.imread(image)
print(labrat)

# Calculate the brightness level
brightness_level = (0.21 * labrat[:, :, 0] + 0.72 * labrat[:, :, 1] + 0.07 * labrat[:, :, 2]) / 3

# Create a mask for pixels above and below the brightness level
above_threshold = brightness_level > 0.5
below_threshold = brightness_level <= 0.5

# Set pixels above the brightness level to black (0) and below to white (1)
black_and_white_image = np.ones_like(labrat)  # Initialize with all white pixels
black_and_white_image[above_threshold] = 0

# Display the black and white image
imgplot = plt.imshow(black_and_white_image)
plt.show()
