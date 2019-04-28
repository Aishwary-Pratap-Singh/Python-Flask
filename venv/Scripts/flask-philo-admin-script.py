#!C:\Users\Maad_Saifuddin\PycharmProjects\FLaskProject\venv\Scripts\python.exe
# EASY-INSTALL-ENTRY-SCRIPT: 'Flask-Philo-Core==0.5.0','console_scripts','flask-philo-admin'
__requires__ = 'Flask-Philo-Core==0.5.0'
import re
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw?|\.exe)?$', '', sys.argv[0])
    sys.exit(
        load_entry_point('Flask-Philo-Core==0.5.0', 'console_scripts', 'flask-philo-admin')()
    )
