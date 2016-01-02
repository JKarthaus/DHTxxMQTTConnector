#!/bin/sh
#############################################################################
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
BROKER=bathcontrol
TOPIC=de/filiberry/bathcontrol/data 

# Python Script Parameter
DHT_MODELL=11
GPIO_PIN=4

DIR=/home/bathcontrol/bin

while true; do
	DATA=$(python $DIR/dhtxxMQTTConnector.py $DHT_MODELL $GPIO_PIN 2>&1)
	#
	TEMP=$(echo $DATA | cut -d "#" -f 1)
	HUMINITY=$(echo $DATA | cut -d "#" -f 2)
	#
	# Send the Temperature to the Broker 
	echo "mosquitto_pub -h $BROKER -t $TOPIC/temp/badezimmer -m $TEMP"
	mosquitto_pub -h $BROKER -t $TOPIC/temp/badezimmer -m $TEMP
	#
	sleep 1
	# Send the Huminity to the Broker
	echo "mosquitto_pub -h $BROKER -t $TOPIC/feuchte/badezimmer -m $HUMINITY"
	mosquitto_pub -h $BROKER -t $TOPIC/feuchte/badezimmer -m $HUMINITY
	#
	sleep 10
done



