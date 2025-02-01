#!/bin/bash

# Function to generate curl command with headers and body
generate_curl_command() {
    curl_command="curl -X $method $url"
    
    # Add headers to the curl command
    for header in "${headers[@]}"; do
        curl_command="$curl_command -H \"$header\""
    done
    
    # Add body if it's not empty
    if [[ -n "$body" ]]; then
        curl_command="$curl_command -d \"$body\""
    fi
    
    # Echo the final generated curl command
    echo "Generated curl command:"
    echo "$curl_command"
}

# Function to execute the generated curl command
run_curl_command() {
    eval "$curl_command"  # eval is a cool command used to run bash command from strings 
}

# I have used local curl_command then it would be local otherwise it can be acceseed across all terminal session

# variables scope in bash is weird