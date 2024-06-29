# Maven-Test
This is a Proof Of Concept for a self hosted Runner that runs tests on your Java 21 project with Maven.

# BUILD
`docker build . -t mvn-test:latest`

# Run locally
If you just want to run the Docker container locally:  
`docker run --platform linux/amd64 -v "$(pwd)":/opt/project_source:rw maven-test:latest`

# Example usage
Github workflow file:
```yaml
name: Test Project

on:
  pull_request:
    branches:
      - action_test
jobs:
  build:
    runs-on: self-hosted

    steps:
    - name: Checkout code
      uses: actions/checkout@v2
      with:
        ref: ${{ github.event.pull_request.head.ref }}

    - name: Run Test
        run: docker run -v "${{ github.workspace }}:/opt/project_source/:rw" mvn-test
```
