import time
from PIL import Image
from pathlib import Path

from LCD.ST7789 import ST7789

disp = ST7789()
disp.begin()
# disp.clear()
images_dir = Path('cartoons')
for path in images_dir.glob('*.png'):
    image=Image.open(path)
    resized = image.resize((320,240))
    disp.display(resized)
    time.sleep(1)
