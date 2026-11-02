# demo-spa

The sample Spa that [Launchpad](https://launchpad.mattjarrett.dev) puts in each guest sandbox. It calls the sandbox's [demo-api](https://github.com/cujarrett/demo-api) and shows what each binding reported.

## Run it locally

The page is one static `index.html`. Each command serves it on http://localhost:8765 and opens it.

| Command | API |
|---|---|
| `just preview guest-foo` | A live sandbox's API. Use the sandbox name Launchpad shows. Needs `kubectl` |
| `just preview-local` | [demo-api](https://github.com/cujarrett/demo-api) from source on `localhost:8080`. Start it first with `just run` in that repo |

Image: `ghcr.io/cujarrett/demo-spa`. Each push to `main` builds `:latest`, which the next sandbox pulls.
