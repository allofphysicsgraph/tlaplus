# Containerized TLA+

Using the official release from <https://github.com/tlaplus/tlaplus/releases#latest-tla-files>
as stand-alone (not integrated with Visual Studio Code or Jupyter).

# TLA+ software
<https://lamport.azurewebsites.net/tla/toolbox.html>

# Other examples of containerized TLA+
* Integrated with Jupyter: <https://github.com/kelvich/tlaplus_jupyter> and <https://pypi.org/project/tlaplus-jupyter/>
* Compile from source: <https://github.com/talex5/tla>. Caveat: from 2018 and relies on out-of-date URLs for build
* Integrated with Visual Studio Code <https://github.com/kevinsullivan/TLAPlusDocker>. Based on Ubuntu 22.04.
  * forked to <https://github.com/allofphysicsgraph/TLAPlusDocker>

## Uninstalling VSCode on Mac:
as per <https://code.visualstudio.com/docs/setup/uninstall>

* stop running containers: `docker kill <container id>`
* remove image from docker: `docker rmi -f <image id>`
* remove VSCode from Applications
* `cd $HOME/Library/Application Support/; rm -rf Code`
* `cd ~; rm -rf .vscode`

For more discussion about containerization, see <https://github.com/tlaplus/tlaplus/issues/683>.

# access a Java GUI inside Docker using VNC

<https://focusedforsuccess.com/how-do-i-run-a-java-app-with-a-gui-in-docker/>

