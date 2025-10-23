FROM kalilinux/kali-rolling:latest
RUN apt update && \
    apt install -y git python3-pip figlet sudo && \
    apt install -y boxes php curl xdotool wget

WORKDIR /root/hackingtool
COPY requirements.txt ./
RUN pip3 install --no-cache-dir boxes flask lolcat requests -r requirements.txt
COPY . .
RUN true && echo "/root/hackingtool/" > /home/hackingtoolpath.txt;
EXPOSE 1-65535
ENTRYPOINT ["python3", "/root/hackingtool/hackingtool.py"]