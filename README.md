### Create patch

```shell
npm install
dos2unix node_modules/neverthrow/dist/index.es.js
cp node_modules/neverthrow/dist/index.es.js diff.js
# edit diff.js
diff -u node_modules/neverthrow/dist/index.es.js diff.js > neverthrow.patch
sed -i -e 's|^\+\+\+ diff\.js\t|+++ node_modules/neverthrow/dist/index.es.js\t|' neverthrow.patch
npm ci
```

### Use patch

```shell
# DEST=libs/nt.js bash -c 'mkdir -p $(dirname ${DEST})'
NAMESPACE=neverthrow DEST=libs/nt.js bash -c '\
    dos2unix node_modules/neverthrow/dist/index.es.js && \
    sed -e "s/const namespace = /const ${NAMESPACE} = /" neverthrow.patch | patch -p0 && \
    cp node_modules/neverthrow/dist/index.es.js ${DEST} && \
    rm node_modules/neverthrow/dist/index.es.js && \
    npm ci'
```