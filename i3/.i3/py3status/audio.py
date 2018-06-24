import subprocess

class Py3status:

    def audio(self):
        try:
            volume = subprocess.check_output(["pamixer", "--get-volume"])
        except subprocess.CalledProcessError as e:
            volume = e.output

        try:
            muted = subprocess.check_output(["pamixer", "--get-mute"])
        except subprocess.CalledProcessError as e:
            muted = e.output

        paclist = subprocess.check_output(["pacmd", "list"])

        if "active port: <analog-output-headphones>" in str(paclist):
            if "true" in str(muted):
                color = "#FF9000"
            else:
                color = "#FFFFFF"
        else:
            if "true" in str(muted):
                color = "#FF0000"
            else:
                color = "#00FF00"

        return {
            'full_text': " ♪ {} ".format(int(volume)),
            'color': color,
            'cached_until': self.py3.CACHE_FOREVER
        }
