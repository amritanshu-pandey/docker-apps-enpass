FROM ubuntu:18.04

ENV ENPASS_VERSION 6.0.6.323

RUN apt update && \
	apt install wget gnupg -y && \
	echo "deb https://apt.enpass.io/ stable main" > /etc/apt/sources.list.d/enpass.list && \
	wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add - && \
	apt update && \
	apt install libfontconfig libcups2 libxcb-glx0 libx11-xcb1 libxi6 libsm6 libxrender1 libgtk-3-0 \
		libpulse0 libxcb-randr0-dev libxcb-xtest0-dev libxcb-xinerama0-dev libxcb-shape0-dev \
		libgl1-mesa-glx libxcb-xkb-dev enpass=${ENPASS_VERSION} -y && \
	apt purge wget gnupg -y && \
	apt auto-clean && \
	rm /etc/apt/sources.list.d/enpass.list

ENTRYPOINT /opt/enpass/Enpass

