# Pre-commit

## Table of contents <!-- omit in toc -->

1. [TL;DR](#tldr)
1. [Troubleshooting](#troubleshooting)
   1. [Some files are skipped during a run](#some-files-are-skipped-during-a-run)
1. [Further readings](#further-readings)

## TL;DR

```sh
# Generate a very basic configuration.
pre-commit sample-config > .pre-commit-config.yaml

# Manually run checks.
pre-commit run --all-files
pre-commit run "ansible-lint" --files "ansible/"

# Automatically run checks at every commit.
pre-commit install

# Update all hooks to the latest version available.
# It is *not* always the latest *stable* release.
pre-commit autoupdate

# Skip check on commit.
SKIP="flake8" git commit -m "foo"
```

```yaml
---
# File .pre-commit-config.yaml
# See https://pre-commit.com for more information
# See https://pre-commit.com/hooks.html for more hooks
# See https://github.com/pre-commit/identify/blob/main/identify/extensions.py for the list of file types by extension

exclude: ^FIXME/.*$                       # ignore all files matching the regexp
fail_fast: true                           # stop at the first error
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v4.4.0
    hooks:
      - id: check-added-large-files
      - id: check-json
      - id: check-yaml
        args: [--allow-multiple-documents]
      - id: check-xml
      - id: trailing-whitespace
        args:
          - --markdown-linebreak-ext=md   # ignore markdown's line break
      - id: end-of-file-fixer
  - repo: https://github.com/alessandrojcm/commitlint-pre-commit-hook
    rev: v9.5.0
    hooks:
      - id: commitlint
        stages: [commit-msg]              # limit to specific stages
        additional_dependencies: ['@commitlint/config-conventional']
  - repo: https://github.com/markdownlint/markdownlint
    rev: v0.12.0
    hooks:
      - id: markdownlint
        types: [markdown]                 # limit target types
        args:
          - -r "~MD013"                   # ignore line-length rule
  - repo: https://github.com/ansible-community/ansible-lint
    rev: v6.19.0
    hooks:
      - id: ansible-lint
        name: ansilint                    # use an alias
```

## Troubleshooting

### Some files are skipped during a run

Check they are tracked (have been `add`ed to the repository).

## Further readings

- Pre-commit's [website]
- List of [supported hooks]

<!--
  References
  -->

<!-- Upstream -->
[file types by extension]: https://github.com/pre-commit/identify/blob/main/identify/extensions.py
[supported hooks]: https://pre-commit.com/hooks.html
[website]: https://pre-commit.com
