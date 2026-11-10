-- Run this once in Supabase SQL Editor AFTER the General Manager has registered
-- and confirmed the account using the website's sign-up form.
-- Replace the email below with the exact account email.

update public.profiles as p
set role = 'gm', is_active = true, updated_at = now()
from auth.users as u
where p.id = u.id
  and lower(u.email) = lower('YOUR_WORK_EMAIL@example.com');

-- Verify that exactly the intended account has GM permissions.
select u.email, p.full_name, p.role, p.is_active
from public.profiles as p
join auth.users as u on u.id = p.id
where lower(u.email) = lower('YOUR_WORK_EMAIL@example.com');
