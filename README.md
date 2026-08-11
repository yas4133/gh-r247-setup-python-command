# GH-R247 owned canary lab

Owned lab for current `actions/setup-python@v7.0.0` handling of TOML version metadata.
No secrets or third-party data are used. Pull-request workflow treats checked-out contributor files
as data and invokes only action's documented `python-path` output.
