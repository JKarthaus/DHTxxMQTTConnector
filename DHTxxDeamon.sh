#############################################################################
#!/bin/bash
#
# DHTxx MQTT Connector
#
# Read Data from DHTxx sensor, and send the Data to a MQTT Broker
#
# Joern Karthaus 12/2015
#############################################################################
#
# The MQTT Broker
# 
BROKER=heizung:1883
TOPIC=de.filiberry.bathcontrol/ 

# Python Script Parameter
DHT_MODELL=11
GPIO_PIN=4

DATA= "22#60"

TEMP= echo $DATA | cut -d "#" -f 1
HUMINITY= echo $DATA | cut -d "#" -f 2





echo $TEMP
echo $HUMINITY


