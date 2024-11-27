#!/usr/bin/env bats

load "${BATS_PLUGIN_PATH}/load.bash"

export CURL_STUB_DEBUG=/dev/stdout

function setup() {
    export BUILDKITE_ORGANIZATION="foo"
    export BUILDKITE_REGISTRY_TOKEN="bk_12345"
    export BUILDKITE_PLUGIN_HA_ENV_REGISTRY="foo-registry"
}

@test "Success with default configuration" {
    stub curl \
    "-O -L -H 'Authorization: Bearer bk_12345' 'https://packages.buildkite.com/foo/foo-registry/files/agent-hooks.tar.gz' : exit 0"

    run "$PWD"/hooks/environment

    assert_success
    assert_output --partial "Done!"

    unstub curl
}

@test "Success with custom token env" {

    export BUILDKITE_PLUGIN_HA_ENV_TOKEN_ENV="AVOCADO"
    export AVOCADO="bk_54321"
    stub curl \
    "-O -L -H 'Authorization: Bearer bk_54321' 'https://packages.buildkite.com/foo/foo-registry/files/agent-hooks.tar.gz' : exit 0"

    run "$PWD"/hooks/environment

    assert_success
    assert_output --partial "Done!"

    unstub curl
}

@test "Success with custom orgnazation" {
    export BUILDKITE_PLUGIN_HA_ENV_REGISTRY="fre-shavacado"
    export BUILDKITE_PLUGIN_HA_ENV_ORGANIZATION="do-it-for-the-vine"
    
    stub curl \
    "-O -L -H 'Authorization: Bearer bk_12345' 'https://packages.buildkite.com/do-it-for-the-vine/fre-shavacado/files/agent-hooks.tar.gz' : exit 0"

    run "$PWD"/hooks/environment

    assert_success
    assert_output --partial "Done!"

    unstub curl

}

