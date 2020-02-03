#!/bin/bash

if [ ! -r ~/.freeipa_org_ocp_config ]; then
    echo "Cannot read ~/.freeipa_org_ocp_config" >&2
    exit 1
else
    source ~/.freeipa_org_ocp_config
fi

WORK_DIR=`mktemp -d`

function finish {
    rm -rf "$WORK_DIR"
}
trap finish EXIT

export KUBECONFIG=$WORK_DIR/kubeconfig
oc login $OPENSHIFT_SERVER --token="$OPENSHIFT_TOKEN" > /dev/null

if [ $? -ne 0 ]; then
    echo "Cannot login to OpenShift" >&2
    exit 1
fi

oc project $OPENSHIFT_PROJECT > /dev/null

oc start-build freeipa-org-planet

if [ $! -ne 0 ]; then
    echo "Could not start build" >&2
    exit 1
fi
