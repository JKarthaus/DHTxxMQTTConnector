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
BROKER=heizung
TOPIC=de/filiberry/bathcontrol/data 

# Python Script Parameter
DHT_MODELL=11
GPIO_PIN=4

DIR=${PWD}

while true; do
	DATA=$(python $DIR/test_dhtxx.py 2>&1)
	#
	TEMP=$(echo $DATA | cut -d "#" -f 1)
	HUMINITY=$(echo $DATA | cut -d "#" -f 2)
	#
	# Send the Temperature to the Broker 
	#echo "mosquitto_pub -h $BROKER -t $TOPIC/temp/wintergarten -m $TEMP"
	mosquitto_pub -h $BROKER -t $TOPIC/temp/wintergarten -m $TEMP
	#
	sleep 1
	# Send the Huminity to the Broker
	#echo "mosquitto_pub -h $BROKER -t $TOPIC/feuchte/badezimmer -m $HUMINITY"
	mosquitto_pub -h $BROKER -t $TOPIC/feuchte/badezimmer -m $HUMINITY
	#
	sleep 10
done



