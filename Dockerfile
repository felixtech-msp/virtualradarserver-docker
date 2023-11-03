FROM mono:6
WORKDIR /app
RUN apt-get update && apt-get install wget tar && apt-get clean
RUN wget https://github.com/vradarserver/vrs/releases/download/v3.0.0-preview-11-mono/VirtualRadar-3.0.0-preview-11.tar.gz && \
    wget https://github.com/vradarserver/vrs/releases/download/v3.0.0-preview-11-mono/LanguagePack-3.0.0-preview-11.tar.gz && \
    wget https://github.com/vradarserver/vrs/releases/download/v3.0.0-preview-11-mono/Plugin-WebAdmin-3.0.0-preview-11.tar.gz && \
    wget https://github.com/vradarserver/vrs/releases/download/v3.0.0-preview-11-mono/Plugin-TileServerCache-3.0.0-preview-11.tar.gz && \
    wget https://github.com/vradarserver/vrs/releases/download/v3.0.0-preview-11-mono/Plugin-DatabaseWriter-3.0.0-preview-11.tar.gz && \
    wget https://github.com/vradarserver/vrs/releases/download/v3.0.0-preview-11-mono/Plugin-DatabaseEditor-3.0.0-preview-11.tar.gz && \
    tar -xzf VirtualRadar-3.0.0-preview-11.tar.gz && \
    tar -xzf LanguagePack-3.0.0-preview-11.tar.gz && \
    tar -xzf Plugin-WebAdmin-3.0.0-preview-11.tar.gz && \
    tar -xzf Plugin-TileServerCache-3.0.0-preview-11.tar.gz && \
    tar -xzf Plugin-DatabaseWriter-3.0.0-preview-11.tar.gz && \
    tar -xzf Plugin-DatabaseEditor-3.0.0-preview-11.tar.gz && \
    rm -f *-preview-11.tar.gz
RUN timeout --preserve-status --foreground -s INT 7 mono VirtualRadar.exe -nogui -createAdmin:admin -password:password
CMD ["mono", "/app/VirtualRadar.exe", "-nogui"]
EXPOSE 8080
VOLUME /root/.local/share/VirtualRadar
