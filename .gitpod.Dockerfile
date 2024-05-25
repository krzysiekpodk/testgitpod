FROM gitpod/workspace-full

# Install Java 17
RUN sudo apt-get update && sudo apt-get install -y openjdk-17-jdk

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

# Create the Android SDK directories with appropriate permissions
RUN sudo mkdir -p /opt/android-sdk/cmdline-tools && \
    sudo chown -R gitpod:gitpod /opt/android-sdk

# Download and unpack Android SDK command line tools
RUN sudo wget -q -O cmdline-tools.zip "https://dl.google.com/android/repository/commandlinetools-linux-7302050_latest.zip" && \
    sudo unzip cmdline-tools.zip -d /opt/android-sdk/cmdline-tools && \
    sudo rm cmdline-tools.zip

# Set ANDROID_HOME environment variable
ENV ANDROID_HOME=/opt/android-sdk
ENV PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

# Accept Android SDK licenses
RUN yes | sudo sdkmanager --licenses
