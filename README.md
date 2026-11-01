# demo-spa

The sample Spa that [Launchpad](https://launchpad.mattjarrett.dev) puts in each guest sandbox. It calls the sandbox's [demo-api](https://github.com/cujarrett/demo-api) and shows what each binding reported.

Preview it against a live sandbox with `just preview guest-foo`.

Image: `ghcr.io/cujarrett/demo-spa`. Each push to `main` builds `:latest`, which the next sandbox pulls.
