# CDP Screenshot Test / Client

This is Python client using [CDP (Chrome DevTools Protocol)](https://chromedevtools.github.io/devtools-protocol/) to create a screenshot from an existing Chromium instances.

Set it up in a [Python virtual environment](https://docs.python.org/3/library/venv.html):

```console
python -m venv .venv
source .venv/bin/activate
pip install poetry
poetry install
```

Update the `CDP_URL` in the `cdp-screenshot.py` file to point to your remote instance.

Run the client:

```console
python cdp-screenshot.py
````
