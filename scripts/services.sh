#!/bin/bash
systemctl enable systemd-timesyncd.service
systemctl enable cronie.service
systemctl enable docker.service