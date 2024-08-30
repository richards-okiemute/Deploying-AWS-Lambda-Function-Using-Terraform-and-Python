import json
import logging
from math import pi

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def circle_calculation(event, context):
    # Get the radius from the event object.
    radius = event['radius']
    
    # Validate radius
    if  radius < 0:
        return json.dumps({"error": "Invalid radius: Radius must be a non-negative number."})
    
    area = calculate_area(radius)
    logger.info(f"The area of the circle is {area}")
    
    perimeter = calculate_perimeter(radius)
    logger.info(f"Also, the perimeter of the circle is {perimeter}")
    
    # Return the calculated area and perimeter of the circle as a JSON string
    data = {
        "The area of your circle": area, 
        "The perimeter of your circle": perimeter
    }
    return json.dumps(data)
    
def calculate_area(radius):
    return round((pi * (radius ** 2)),3)

def calculate_perimeter(radius):
    return round((2 * pi * radius),3)
