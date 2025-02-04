CREATE TABLE "public"."games" ("id" serial NOT NULL, "uuid" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "name" text NOT NULL, PRIMARY KEY ("ID") , UNIQUE ("UUID"));
CREATE EXTENSION IF NOT EXISTS pgcrypto;
