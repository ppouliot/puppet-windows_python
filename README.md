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
 * Vijay Tripathi <vijayt@microsoft.com>
 
License
-------

Copyright (C) 2014 Vijay Tripathi

Vijay Tripathi can be contacted at: vijayt@microsoft.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 
