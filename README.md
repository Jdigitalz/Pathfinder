#Pathfinder
A simple CLI utility made in python that allows you to get the full file path of a file and copy it to your clipboard on wayland devices

##Table of contents
- [Installation](#installation)
- [Usage](#usage)

## Installation
1. Clone the repository
```bash
git clone https://github.com/Jdigitalz/Pathfinder.git
cd Pathfinder

2. Install wl-clipboard
```bash
sudo apt install wl-clipboard

3. Install using setup.py
```bash
sudo python setup.py install

(optional) add pathfinder to shell config
```bash
alias pathto="pathfinder "

##Usage
```bash
pathfinder example.py
