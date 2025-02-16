alter table "public"."segments" drop constraint "segments_run_uid_fkey",
  add constraint "segments_run_uid_fkey"
  foreign key ("run_uid")
  references "public"."runs"
  ("uid") on update restrict on delete restrict;
