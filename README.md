# mkctf

`mkctf` is a convenient tool for setting up Capture the Flag (CTF) challenge environments. This script creates a standardized directory structure and initializes a Docker container with essential pentesting tools, providing a ready-to-use environment for tackling CTF challenges.

## Features

- **Automatic Directory Setup**: Creates a structured environment with directories for `network`, `web`, `creds`, and `notes`.
- **Docker Integration**: Uses Docker to provide an isolated environment pre-configured with essential CTF tools.
- **Comprehensive Toolset**: Installs a wide range of pentesting tools including network utilities, web tools, password crackers, and more.
## Installation

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/polo-sec/mkctf.git
    cd mkctf
    ```

2. **Make the Script Executable**:
    ```bash
    chmod +x mkctf.sh
    ```

3. **Add an Alias** (optional but recommended):
    Add the following line to your `.bashrc` or `.zshrc`:
    ```bash
    alias mkctf='/path/to/mkctf.sh'
    ```
    Then, source the file:
    ```bash
    source ~/.bashrc
    ```
    or
    ```bash
    source ~/.zshrc
    ```

## Usage

1. **Create a New Challenge Environment**:
    ```bash
    mkctf <challenge_name>
    ```

2. **Navigate to the Challenge Directory**:
    ```bash
    cd <challenge_name>
    ```

3. **Build and Start the Docker Container**:
    ```bash
    docker-compose up -d --build
    ```

4. **Access the Running Container**:
    ```bash
    docker exec -it <challenge_name>_pentest /bin/bash
    ```

## Directory Structure

When you run `mkctf <challenge_name>`, the following directory structure is created:

```
<challenge_name>/
├── creds/
├── docker-compose.yml
├── Dockerfile
├── network/
├── notes/
└── web/
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss any changes or suggestions.

## License

This project is licensed under the MIT License

## Acknowledgments

- Inspired by the need for a streamlined and efficient CTF preparation environment.
- Thanks to the developers of the various tools integrated into this project.
