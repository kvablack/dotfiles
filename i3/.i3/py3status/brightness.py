import subprocess

class Py3status:
    def brightness(self):
        brightness = subprocess.check_output(["xbacklight", "-get"])
        brightness = int(round(float(brightness)))
        return {
            'full_text': " ☀ {} ".format(brightness),
            'cached_until': self.py3.CACHE_FOREVER
        }
