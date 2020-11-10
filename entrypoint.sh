#!/bin/sh -l

echo "$BOX_SECRET_KEY" > kloud-private.pem
echo "$BOX_SECRET_KEY_PASSPHRASE" > kloud-private.passphrase

openssl rsa -in kloud-private.pem --passin kloud-private.passphrase -out kloud-private-nopassphrase.pem

box build

echo ::set-output name=phar::kloud.phar
echo ::set-output name=pubkey::kloud.phar.pubkey
