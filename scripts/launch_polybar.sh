#!/bin/env sh

pkill polybar
sleep 1;
polybar main &
polybar status &
