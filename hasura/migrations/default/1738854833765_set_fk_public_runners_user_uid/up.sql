alter table "public"."runners"
  add constraint "runners_user_uid_fkey"
  foreign key ("user_uid")
  references "public"."users"
  ("uid") on update restrict on delete restrict;
