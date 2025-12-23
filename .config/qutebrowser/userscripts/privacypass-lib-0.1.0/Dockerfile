FROM rust:1.84 AS builder

# Install dependencies
RUN bash -c "curl -fsS https://rustwasm.github.io/wasm-pack/installer/init.sh | sh" && \
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc && \
    export PATH="$HOME/.cargo/bin:$PATH"&& \
    mkdir -p /build/wasm && \
    chmod 777 /build/wasm

ENV PATH="/root/.cargo/bin:${PATH}"

#Copy source

COPY src /src

# Build library

WORKDIR /src
RUN bash build.sh

# Copy library to host

CMD [ "cp", "-r", "/src/wasm/pkg", "/build/wasm" ]
