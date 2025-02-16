CREATE TABLE "public"."runners" ("id" serial NOT NULL, "uid" uuid NOT NULL DEFAULT gen_random_uuid(), "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "user_uid" text NOT NULL, "name" text NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("user_uid") REFERENCES "public"."users"("uid") ON UPDATE restrict ON DELETE cascade, UNIQUE ("uid"));
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_runners_updated_at"
BEFORE UPDATE ON "public"."runners"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_runners_updated_at" ON "public"."runners"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
