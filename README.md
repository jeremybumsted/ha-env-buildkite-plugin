# Hosted Agents Environment Buildkite Plugin

A Buildkite plugin that allows you to configure and run hooks from Buildkite Package registries on Buildkite Hosted Agents (aka Mobile Delivery Cloud)

## Setup

Basic configuration looks like this:
* Write your hooks (see hooks doc)
* Upload the hooks to your artifact store (BK package registries are the only supported store at the moment)


### Buildkite Package Registries

You can store the hooks you would like to run with this plugin by uploading the hooks to a registry. If you don't already have a registry, you should create one:


## Configuration

The plugin primarily relies on Buildkite Package Registries as a storage backend, wiht additional backends planned for future releases.

### token-env (optional)
Tells the plugin which environment variable it should use to reference the registry token (or API token).

Default: BUILDKITE_REGISTRY_TOKEN


### registry (required)
The slug of the Buildkite Package Registry

### organization (optional)
Configure the plugin to use a different Buildkite organizations Package Registry.

Default: BUILDKITE_ORGANIZATION
