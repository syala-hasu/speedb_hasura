alter table "public"."runs" alter column "runner_uid" drop not null;
alter table "public"."runs" add column "runner_uid" text;
