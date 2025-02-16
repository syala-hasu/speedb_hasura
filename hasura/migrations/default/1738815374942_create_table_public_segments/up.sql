CREATE TABLE "public"."segments" ("id" serial NOT NULL, "uid" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), "run_uid" text NOT NULL, "name" text NOT NULL, "split_time" interval NOT NULL, "best_time" interval NOT NULL, "index" integer NOT NULL, PRIMARY KEY ("id") , FOREIGN KEY ("run_uid") REFERENCES "public"."runs"("uid") ON UPDATE restrict ON DELETE restrict, UNIQUE ("uid"));
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
CREATE TRIGGER "set_public_segments_updated_at"
BEFORE UPDATE ON "public"."segments"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_segments_updated_at" ON "public"."segments"
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
