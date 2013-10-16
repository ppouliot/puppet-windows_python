puppet-windows_python
==============
This module allows you to manage Python on Windows machines. Among other things, this module:

 - Installs **Python**, **Easy Install** and **pip**.
 - Adds the installation and scripts directory to PATH environment variable.
 - Exposes a class for installing python modules.
 - Exposes a wrapper for creating windows services based on Python scripts.

Basic usage
-----------
The basic scenario allows the user to install Python fetching the installer from the main site:

    class { 'windows_python': }

It is also possible to specify alternative URLs:

    class { 'windows_git':
      python_remote      => "http://internal.web.server/python-2.7.3.msi",
      easyinstall_remote => "http://internal.web.server/ez_setup.py",
      pip_remote         => "http://internal.web.server/get-pip.py",
    }

Contributors
------------

License
-------

 
