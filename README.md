# A Github action running box-project to build .phar packages

This Github action runs the box-project packager to build .phar packages from your existing PHP applications.

## Inputs

### `secret-key`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

Nothing

## Example usage

```yaml
- uses: gplanchat/github-action-box@master
  env:
    BOX_SECRET_KEY: ${{secrets.BOX_SECRET_KEY}}
    BOX_SECRET_KEY_PASSPHRASE: ${{secrets.BOX_SECRET_KEY_PASSPHRASE}}
```
