# dVRK Manufacturing Test Software

This repository contains script files to set up a Linux computer to test the custom electronics boards and controllers
used by the da Vinci Research Kit (dVRK). It has been tested with Ubuntu 20.04 and 22.04. There are two setup configurations,
which are selected by command line parameters to the `setup.sh` script:

* `pcb`:  Set up for testing assembled PCBs
* `box`:  Set up for testing classic controller box (with 2xFPGA/2xQLA or FPGA/DQLA)

## Initial Setup

The initial setup should be as follows:

1. Install the following packages (if not already installed): `sudo apt install build-essential libraw1394-dev libncurses5-dev cmake-curses-gui cmake-qt-gui git libfuse-dev`
2. Set permissions on FireWire device, using the "convenient solution" described [here](https://github.com/jhu-dvrk/sawIntuitiveResearchKit/wiki/ControllerConnection#convenient-solution).
3. Create a subdirectory called `test` (must be in home directory): `mkdir ~/test`
4. Change to the test directory: `cd ~/test`
5. Clone this repository into a `scripts` subdirectory:  `git clone https://github.com/jhu-dvrk/dvrk-mfg-test.git scripts`
6. Run the provided `setup` script, with the appropriate parameter:
   *  `sh scripts/setup.sh pcb` -- this should create 5 icons on the Desktop for testing assembled boards; it also creates a `QLA_test_results` folder for the QLA test log files
   *  `sh scripts/setup.sh box` -- this should create 2 icons on the Desktop for testing assembled controller boxes
  
Both configurations create the following desktop icon:
* **JHU SW Update**: updates the test software

The `pcb` configuration also creates the following icons:

* **FPGA Connection Test**: tests Firewire and Ethernet connectivity for FPGA board
* **DQLA1**: tests QLA #1 in a DQLA setup
* **DQLA2**: tests QLA #2 in a DQLA system
* **dRAC Test**: GUI program that tests dRAC

The `box` configuration also creates the following icon:
* **Classic Controller Test**: tests classic dVRK controller box

Note: `setup.sh` also accepts an `all` parameter, which is equivalent to both `pcb` and `box`.

## Setting up Terminal Emulator

Some of the `pcb` testing requires a terminal emulator, such as PuTTY. To install and set up PuTTY:

1. Install putty if needed: `sudo apt install putty`
2. Add the user name to the `dialout` group:  `sudo usermod -a -G dialout <username>`
3. Reboot the computer
4. Start PuTTy, choose the `Serial` connection type, `\dev\ttyUSB0`, and set `Speed` to 115200
5. (Optional) Improve appearance by increasing window size (e.g., to 128 x 46) and changing font to `Ubuntu Mono`; note that session settings can be saved

### 
