import matplotlib.image as mpimg
import matplotlib.pyplot as plt 
import numpy as np
import math

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

# Threshold values
threshold = (160, 160, 160)

# Initialize counters
typeA_count = 0
typeB_count = 0

# Iterate over each pixel in the image
for row in labrat:
    for pixel in row:
        # Check if all RGB values are greater than the threshold
        if all(value > threshold[i] for i, value in enumerate(pixel)):
            typeA_count += 1
        else:
            typeB_count += 1

# Calculate the percentage of typeA and typeB pixels
total_pixels = labrat.shape[0] * labrat.shape[1]
percentage_typeA = (typeA_count / total_pixels) * 100
percentage_typeB = (typeB_count / total_pixels) * 100

# Print the percentage of typeA and typeB pixels
print("Percentage of typeA pixels:", percentage_typeA)
print("Percentage of typeB pixels:", percentage_typeB)

imgplot = plt.imshow(labrat)

plt.show()
