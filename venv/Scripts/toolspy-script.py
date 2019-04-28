#!C:\Users\Maad_Saifuddin\PycharmProjects\FLaskProject\venv\Scripts\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'toolspy==0.2.45','console_scripts','toolspy'
__requires__ = 'toolspy==0.2.45'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('toolspy==0.2.45', 'console_scripts', 'toolspy')()
    )
