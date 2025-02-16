alter table "public"."runs"
  add constraint "runs_runner_uid_fkey"
  foreign key ("runner_uid")
  references "public"."runners"
  ("uid") on update restrict on delete cascade;
