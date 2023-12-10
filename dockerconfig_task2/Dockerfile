# Use a minimal base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Install necessary dependencies
RUN apk --no-cache add \
    build-base \
    cmake \
    git \
    bash \
    boost-dev \
    protobuf-dev \
    zlib-dev \
    lua5.3-dev \
    jq

# Clone the Valhalla repository
RUN git clone --branch master --single-branch https://github.com/valhalla/valhalla.git .

# Build Valhalla
RUN mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc) && \
    make install

# Clean up unnecessary dependencies and files
RUN apk del build-base cmake git && \
    rm -rf /var/cache/apk/* /app

# Expose the Valhalla service port
EXPOSE 8002

# Set the entry point
CMD ["valhalla"]
