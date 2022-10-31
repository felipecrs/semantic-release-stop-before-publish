# semantic-release-stop-before-publish

[semantic-release](https://github.com/semantic-release/semantic-release) plugin to stop semantic-release before reaching the publish step. It's like a `--dry-run` which still runs `prepare` steps.

[![npm](https://img.shields.io/npm/v/semantic-release-stop-before-publish.svg)](https://www.npmjs.com/package/semantic-release-stop-before-publish)
[![downloads](https://img.shields.io/npm/dt/semantic-release-stop-before-publish.svg)](https://www.npmjs.com/package/semantic-release-stop-before-publish)
[![ci](https://github.com/felipecrs/semantic-release-stop-before-publish/workflows/ci/badge.svg)](https://github.com/felipecrs/semantic-release-stop-before-publish/actions?query=workflow%3Aci)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

| Step               | Description                                                                                        |
| ------------------ | -------------------------------------------------------------------------------------------------- |
| `prepare` | Causes semantic-release to exit |

## Install

```bash
npm install --save-dev semantic-release-stop-before-publish
```

OR

```bash
yarn add -D semantic-release-stop-before-publish
```

## Usage

The plugin can be configured in the [**semantic-release** configuration file](https://github.com/semantic-release/semantic-release/blob/master/docs/usage/configuration.md#configuration):

```json
{
  "plugins": ["semantic-release-stop-before-publish"]
}
```

> **Note:** it should be the last plugin in your list, so that when it executes its `prepare` step (which will cause `semantic-release` to exit) all the other plugins have also executed their own `prepare` steps.
