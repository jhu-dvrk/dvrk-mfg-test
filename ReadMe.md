This repository contains script files to set up a Linux computer to test the custom electronics boards
used by the da Vinci Research Kit (dVRK). It has been tested with Ubuntu 20.04 and 22.04.
The initial setup should be as follows (this assumes that all
build tools are already installed on the computer):

1. Create a subdirectory called `test` (must be in home directory): `mkdir ~/test`
2. Change to the test directory: `cd ~/test`
3. Clone this repository into a `scripts` subdirectory:  `git clone https://github.com/jhu-dvrk/dvrk-mfg-test.git scripts`
4. Run the provided `setup` script:  `sh scripts/setup.sh`
5. This should create 5 icons on the Desktop, which are described below; it also creates a `QLA_test_results` folder for the QLA test log files

The five test icons are:

* **FPGA Connection Test**: tests Firewire and Ethernet connectivity for FPGA board
* **DQLA1**: tests QLA #1 in a DQLA setup
* **DQLA2**: tests QLA #2 in a DQLA system
* **dRAC Test**: GUI program that tests dRAC
* **JHU SW Update**: updates the test software

Some of the testing requires a terminal emulator, such as PuTTY. To install and set up PuTTY:

1. Install putty if needed: `sudo apt install putty`
2. Add the user name to the `dialout` group:  `sudo usermod -a -G dialout <username>`
3. Reboot the computer
4. Start PuTTy, choose the `Serial` connection type, `\dev\ttyUSB0`, and set `Speed` to 115200
5. (Optional) Improve appearance by increasing window size (e.g., to 128 x 46) and changing font to `Ubuntu Mono`; note that session settings can be saved
