#!/bin/bash

# Scurl stands for simplified curl, which is an abstraction over curl to make testing APIs via curl easier.
# This script allows users to test APIs with curl, and offers simple input prompts for URL, request method, headers, and body.

# Default values for the request
method="GET"     # Default method is GET if not specified
url=""            # URL will be entered by the user
headers=()        # Initialize an empty array to store headers
body=""           # Request body, if any, will be stored here

# Source the curl_engine.sh file to access any pre-defined functions (like the curl command generator)
source /opt/scurl/bin/curl_engine.sh

# Infinite loop to allow multiple requests until the user decides to exit
while true
do
    # Prompt the user to enter the URL they want to test
    echo "To exit the script at any time, type 'exit'. To go back to the URL input, type 'end'."
    read -p "Enter the URL you want to test: " url

    # URL validation to ensure it starts with http:// or https://
    if [[ ! "$url" =~ ^https?:// ]]; then # honestly I was using simple regex but chatgpt suggested better
        echo "Please enter a valid URL starting with http:// or https://"
        continue  # Re-prompt for the URL
    elif [[ "$url" == "exit" ]]; then
        exit 1
    elif [[ "$url" == "end" ]]; then
        continue
    fi

    # Prompt the user for the HTTP request method (default is GET)
    read -p "Enter the type of request (leave blank for GET): " method
    if [[ -z "$method" ]]; then
        method="GET"  # Default to GET if no method is provided
    elif [[ "$url" == "exit" ]]; then
        exit 1
    elif [[ "$url" == "end" ]]; then
        continue
    fi

    # Prompt the user to enter headers for the request
    echo "Enter headers (key: value). Type 'done' when finished."
    while true; do
        read -p "Header: " header
        if [[ "$header" == "done" ]]; then
            break
        fi
        headers+=("$header")  # Add the entered header to the headers array
    done

    # Prompt for the request body, if applicable
    echo "Enter the request body (leave blank if not needed):"
    read -r body

    # Generate the curl command using the user's inputs (URL, method, headers, body)
    generate_curl_command

    # Prompt the user to press enter to run the command
    read -p "Press enter to run command" take_input
    if [[ -n $take_input ]]; then
        run_curl_command  # Run the generated curl command
    fi
done
