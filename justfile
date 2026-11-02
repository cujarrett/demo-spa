# List available recipes
default:
    @just --list

# Preview against demo-api from source on localhost:8080
preview-local port="8765":
    #!/usr/bin/env bash
    set -euo pipefail
    url="http://localhost:{{port}}/index.html?api=http://localhost:8080/"
    echo "Serving demo-spa -> $url"
    echo "Ctrl-C to stop."
    trap 'kill 0' EXIT
    python3 -m http.server {{port}} --directory . >/dev/null 2>&1 &
    sleep 1
    open "$url" 2>/dev/null || echo "Open: $url"
    wait

# Preview against a live sandbox's API, such as just preview guest-foo
preview workspace port="8765":
    #!/usr/bin/env bash
    set -euo pipefail
    # The demoN slot a workspace gets is assigned at creation, so read the real
    # hostname off the route rather than assuming which slot it landed on.
    # `|| true` because grep exits 1 on no match and pipefail would abort first.
    api=$(kubectl get httproute -n "{{workspace}}" \
        -o jsonpath='{range .items[*]}{.spec.hostnames[*]}{"\n"}{end}' 2>/dev/null \
        | grep -- '-api\.' | head -1 || true)
    if [ -z "$api" ]; then
        echo "No API route in {{workspace}}. Sandboxes expire after ~10 minutes - is it still live?" >&2
        echo "Live now: $(kubectl get ns -o name 2>/dev/null | grep guest- | sed 's|namespace/||' | paste -sd' ' - || echo none)" >&2
        exit 1
    fi
    url="http://localhost:{{port}}/index.html?api=https://$api/"
    if lsof -nP -iTCP:{{port}} -sTCP:LISTEN >/dev/null 2>&1; then
        echo "Reusing the server already on :{{port}}"
        open "$url" 2>/dev/null || echo "Open: $url"
        exit 0
    fi
    echo "Serving demo-spa -> $url"
    echo "Ctrl-C to stop."
    trap 'kill 0' EXIT
    python3 -m http.server {{port}} --directory . >/dev/null 2>&1 &
    sleep 1
    open "$url" 2>/dev/null || echo "Open: $url"
    wait
