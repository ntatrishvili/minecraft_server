import requests

# Set up your personal access token and the base URL for the GitHub API
personal_access_token = "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"
api_base_url = "https://api.github.com"

# Create a dictionary to store the data for your new repository
data = {
    "name": "help-me-plz",
    "description": "This is a test repository created with Github API",
    "private": False
}

# Send a POST request to the API endpoint to create a new repository
response = requests.post(f"{api_base_url}/user/repos", json=data, headers={
    "Authorization": f"Bearer {personal_access_token}"
})

# Check the status code of the response
if response.status_code == 201:
    print("Successfully created repository")
else:
    print("Failed to create repository")

