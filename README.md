# masker.py/sh by ne0mesys

***This script has been created by ne0mesys and serves as a penetration tester software that allows users to mask URLs behind fake domains. I hope you guys enjoy it ;)***

## Welcome
This software allows pentesters to mask all type of URLs behind fake domains and fake tags. It is NOT a phishing generator, it is just a simple software that allows users to mask URLs. This software can be used in two ways: 

* **masker.py** (Graphical User Interface)
* **masker.sh** (terminal)

This tool is developed strictly for educational and ethical purposes. I DO NOT take any responsibility for the misuse of this tool.

By ne0mesys

## Requirements

### For Windows

***Requests** library is required in order to perform the whole masking part. In case you don't have it installed, you can find the instructions below for Windows users:

Open the command prompt and enter the following commands:

```
pip install requests
```

### For Linux

***Curl*** is required in order to perform the whole masking part. In case you don't have it installed, you can find the instructions below for Linux users:

```
sudo apt update
sudo apt install curl
```

### For Arch Linux

***Curl*** is required in order to perform the whole masking part. In case you don't have it installed, you can find the instructions below for Arch Linux users:

```
sudo pacman -S curl
```

## Installation

### For Windows

You just need to download the ***masker.py*** file.

### For Linux

Here's a short documentation about how to install the script for Linux users:

```
sudo apt install git
sudo git clone https://github.com/ne0mesys/Masker
cd Masker
```

### For Arch Linux

Here's a short documentation about how to install the script for Linux users:

```
sudo pacman -S git
sudo git clone https://github.com/ne0mesys/Masker
cd Masker
```

## Execution 

### For Windows

You just need to execute the ***masker.py*** file.

### For Arch Linux & Linux

Once we are in the same folder of the software, we can proceed to enable its execution. We can do this with the following command:

```
sudo chmod +x masker.sh
```

The software includes the Shebang line, #!/bin/bash which allows the user to execute it directly. We can do this using the command ```./masker.sh```

However, it would be necessary to have the script always in the same directory we are in. Therefore, I highly suggest to move a copy with execution permits to the $PATH so we use it as a command: ```masker```

In order to do this perform the next commands in the terminal:

```
sudo chmod +x masker.sh
sudo mv /usr/local/bin/masker
```

**Now you are able to use the script as a command in the terminal!**

**Try it with the command** ```masker```

## About

This software has been created in order to mask all type of URLs. It is a simple software that does not support the option of generate phishing links. It is encoded in **shell** and **python** for **Linux** and **Windows** users. 

This script rather than just allowing to have a fake link, it is focused on having one of the most important parts of social engineering automated, so it is able to help quicker and better. 

## Author

* Ne0mesys

Feel free to open an Issue...

```
E-Mail me at: ne0mesys.acc@gmail.com
```
