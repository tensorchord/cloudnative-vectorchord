# cloudnative-vectorchord

Container images for [cloudnative-pg](https://cloudnative-pg.io/) with the [VectorChord](https://github.com/tensorchord/VectorChord) extension installed.


> [!IMPORTANT]
> If you are using this image on an existing database, the postgres configuration needs to be 
> altered to enable the extension. You can do this by setting shared_preload_libraries in your Cluster spec:
> ```yaml
> apiVersion: postgresql.cnpg.io/v1
> kind: Cluster
> spec:
>   (...)
>   postgresql:
>     shared_preload_libraries:
>       - "vchord.so"
>   ```

> [!IMPORTANT]
> The `VectorChord` extension is not enabled by default. You need to enable it when initializing the database. You can configure it in your Cluster spec:
> ```yaml
> apiVersion: postgresql.cnpg.io/v1
> kind: Cluster
> spec:
>   (...)
>   bootstrap:
>     initdb:
>       postInitSQL:
>         - CREATE EXTENSION IF NOT EXISTS vchord CASCADE;

## Building

To build the Dockerfile locally, you need to pass the `CNPG_TAG` and `VECTORCHORD_TAG` args. For example:  
`docker build . --build-arg="CNPG_TAG=16.3" --build-arg="VECTORCHORD_TAG=0.1.0"`
