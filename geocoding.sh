#!/bin/bash

read -p "Enter Your Address: " address
read -p "Enter Your Geo API Key: " apikey

echo "Address: $address"
echo "Apikey: $apikey"

FULLADDRESS=$(wget -O- -q "https://maps.google.com/maps/api/geocode/xml?address=$address&key=$apikey" | grep formatted_address | cut -d\> -f2 | cut -d\< -f1)

RESULT=$(wget -O- -q "https://maps.google.com/maps/api/geocode/json?address=$address&key=$apikey"| grep -A2 '"location"' | tail -n2 | cut -d\: -f2 | tr '\n' ' ')

echo "Full Address of the given details is: $FULLADDRESS" 

echo "Latitude and Longitude of the given address are: $RESULT"
