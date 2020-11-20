Deoplete requires pynvim installed, this fails with virtual environments. The package needs to be reinstalled.
There is no option in the plugin itself to use the global installation of pynvim. There is however an option to create 
virtual environments with reference to the global packages `python -m venv --system-site-packages {VENV-PATH}`.
If you want to install other versions of global packages into your virtual environment, then use `pip install -I` or `pip install -U`.
`-I = --ignore-installed` installs no matter what is in the site-packages.
`-U` overwrites only if there is a newer version than in the site-packages.

There is one special case if you are using `direnv`. The `layout_python` does not allow you to specify arguments like `--system-site-packages`.
Here just use the function like normal and change the option in the 
Now you can use all global packages in your virtual environment while new ones are installed into your virtual environment.
If you want to install other versions of global packages into your virtual environment, then use `pip install -I` or `pip install -U`.
`-I = --ignore-installed` installs no matter what is in the site-packages.
`-U` overwrites only if there is a newer version than in the site-packages.

There is one special case if you are using `direnv`. The `layout_python` does not allow you to specify arguments like `--system-site-packages`.
Here just use the function like normal and change the option in the `{VENV}/pyenv.cfg` to true. I am unsure if this hot-reloads. I activated/deactivated the venv.

REFERENCES: 
https://stackoverflow.com/questions/12079607/make-virtualenv-inherit-specific-packages-from-your-global-site-packages
https://stackoverflow.com/a/40972692
https://stackoverflow.com/a/19459977 (first comment) 
