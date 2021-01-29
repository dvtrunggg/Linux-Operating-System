#! /bin/bash

#cau 2

#1.
sudo useradd -m -c "Tran Van Binh" -u 2001 tvbinh
#2.
sudo groupadd vp19
#3.
sudo usermod -a -G vp19 tvbinh
#4
sudo passwd tvbinh


