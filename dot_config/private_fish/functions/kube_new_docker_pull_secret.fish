function kube_new_docker_pull_secret
    # Usage: create_docker_pull_secret <secret-name> <docker-server> <username> <password> <namespace> <output-file>

    if test (count $argv) -ne 6
        echo "❌ Usage: create_docker_pull_secret <secret-name> <docker-server> <username> <password> <namespace> <output-file>"
        return 1
    end

    set SECRET_NAME $argv[1]
    set DOCKER_SERVER $argv[2]
    set DOCKER_USERNAME $argv[3]
    set DOCKER_PASSWORD $argv[4]
    set NAMESPACE $argv[5]
    set OUTPUT_FILE $argv[6]

    # Encode Docker config JSON
    set DOCKER_AUTH (echo -n "$DOCKER_USERNAME:$DOCKER_PASSWORD" | base64)
    set DOCKER_CONFIG (printf '{"auths":{"%s":{"username":"%s","password":"%s","auth":"%s"}}}' \
        $DOCKER_SERVER $DOCKER_USERNAME $DOCKER_PASSWORD $DOCKER_AUTH)

    # Encode the entire Docker config in base64 for Kubernetes secret
    set DOCKER_CONFIG_B64 (echo -n $DOCKER_CONFIG | base64)

    # Generate YAML content and write to file
    echo "---
apiVersion: v1
kind: Secret
metadata:
  name: $SECRET_NAME
  namespace: $NAMESPACE
type: kubernetes.io/dockerconfigjson
data:
  .dockerconfigjson: $DOCKER_CONFIG_B64" > $OUTPUT_FILE

    echo "✅ Docker pull secret YAML generated: $OUTPUT_FILE"
end