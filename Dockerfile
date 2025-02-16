FROM hasura/graphql-engine:latest

ENV HASURA_GRAPHQL_ENABLE_CONSOLE="true"
COPY ./hasura/migrations /migrations
COPY ./hasura/metadata /metadata
ENV HASURA_GRAPHQL_MIGRATIONS_DIR=/migrations
ENV HASURA_GRAPHQL_METADATA_DIR=/metadata

EXPOSE ${PORT}