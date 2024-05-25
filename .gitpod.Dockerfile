FROM gitpod/workspace-full

# Install Java 17
RUN sudo apt-get update && sudo apt-get install -y openjdk-17-jdk

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Download and install Android SDK command line tools
RUN mkdir -p /opt/android-sdk/cmdline-tools && \
    curl -o /opt/android-sdk/cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip && \
    unzip /opt/android-sdk/cmdline-tools.zip -d /opt/android-sdk/cmdline-tools && \
    rm /opt/android-sdk/cmdline-tools.zip

    # Set ANDROID_HOME environment variable
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$ANDROID_HOME/cmdline-tools/bin:$PATH
