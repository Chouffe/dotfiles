#!/bin/bash

amixer -D pulse sget Master | grep -Eo "[[:digit:]]+%" | head -n 1
