#!/bin/bash

# Launcher Burpsuite

launcher(){
	java -javaagent:BurpSuiteLoader_v2021.6.1.jar -noverify -jar burpsuite_pro_v2021.6.1.jar > /dev/null 2>&1 &
}

launcher
exit

