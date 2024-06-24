#Python`
#@markdown **Install Modules**
# code 1
import importlib
import subprocess

def install_module(module_name):
    try:
        importlib.import_module(module_name)
        print(f"{module_name} module is already installed.")
    except ImportError:
        print(f"{module_name} module is not installed. Installing...")
        subprocess.check_call(["pip", "install", module_name])
        print(f"{module_name} module has been installed successfully.")

# install_if_not_installed('numpy')