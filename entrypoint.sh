#!/bin/sh -l

echo "$BOX_SECRET_KEY" > kloud-private.pem

openssl rsa -in kloud-private.pem -passin pass:"$BOX_SECRET_KEY_PASSPHRASE" -out kloud-private-nopassphrase.pem

box build
