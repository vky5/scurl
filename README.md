# SCurl - Simplified Curl
---

## Installation

### 1. Download the Repository

Clone or download the repository containing the `install.sh` script, the `curl_engine.sh` script, and the `scurl.sh` script.

```bash
git clone https://github.com/vky5/scurl
cd scurl
```

### 2. Change the permission for install.sh

Before executing the installation script, you need to give it executable permissions. Run the following command:

```bash
chmod +x install.sh
```

### 3. Install Scurl
Once the permissions are set, run the install.sh script to install Scurl.

This script will:

- Install Scurl by copying files to the appropriate locations.
- Set up necessary directories.
-  Install required dependencies (rn now dependencies but in future I am gonna add few).
- Set up a user for running Scurl.


### 4. Verify Installation
To ensure the installation was successful, you can check if the scurl.sh script is installed:

```bash
which scurl
```

## Usage
### Running Scurl
To run Scurl and make HTTP requests, use the following command:

```bash
./scurl.sh
```

This will launch the Scurl prompt, where you can enter the URL, request method, headers, and body for your API requests.

- Enter the URL: Input the URL you want to test.
- Enter the HTTP Method: Type the HTTP method (e.g., GET, POST) or leave it blank to default to GET.
- Enter Headers: Add custom headers in the key: value format. - Type done when finished.
- Enter Body: Input the body content if required. Leave it blank if no body is needed.


Scurl will then generate and display the equivalent curl command.

Press enter to execute that command.