EgyptAir Executive Management — دليل التشغيل

1) ما تم إنشاؤه
- Supabase Project: EgyptAir Executive Management
- Project URL: https://uehwmebvmrklqnwxjfyj.supabase.co
- Region: Europe (Frankfurt)
- Database: PostgreSQL 17
- الجداول: departments, profiles, employees, projects, email_records, tasks, decisions, risks, executive_reports, activity_logs.
- تم تفعيل Row Level Security على جميع جداول public.
- المراسلات والقرارات مقصورة على حساب المدير العام (GM) في سياسات قاعدة البيانات الحالية.
- تم تسجيل مشروعي Currency File Project و Cargo Flash File Project فقط، دون افتراض نسبة إنجاز أو حالة تنفيذ فعلية.

2) تشغيل الموقع
- ارفع index.html إلى استضافة Static Website مثل Netlify أو Vercel أو استضافة الشركة.
- يمكن اختباره محلياً من مجلد الملف باستخدام خادم محلي (مثلاً: python -m http.server 8000) ثم فتح http://localhost:8000.
- لا يُنصح بفتح الملف مباشرة عبر file:// عند استخدام تأكيد البريد الإلكتروني.
- في Supabase Dashboard > Authentication > URL Configuration أضف عنوان الموقع المنشور وعنوان localhost إلى Redirect URLs.
- يعتمد الموقع على Supabase JS من CDN بإصدار محدد، وعلى Publishable Key فقط. لا يوجد service_role أو Secret Key داخل المتصفح.

3) إنشاء حساب المدير العام الأول
- افتح الموقع، أدخل بريد العمل، وأنشئ حساباً بكلمة مرور قوية.
- أكّد البريد الإلكتروني إذا طلب Supabase ذلك، ثم سجّل الدخول.
- الحساب الجديد يحصل تلقائياً على دور viewer ولا يمكنه تعديل البيانات.
- بعد إنشاء الحساب، افتح Supabase Dashboard > SQL Editor، واستبدل YOUR_WORK_EMAIL@example.com ببريد الحساب في ملف promote_first_gm.sql ثم نفّذ الاستعلام.
- سجّل الخروج ثم الدخول مرة أخرى. يجب أن يظهر الدور «مدير عام».
- بعد تفعيل الحساب الأول، يُنصح بإيقاف التسجيل العام من إعدادات Authentication، وإضافة المستخدمين لاحقاً بطريقة إدارية معتمدة.

4) الصلاحيات الحالية
- GM: قراءة وإضافة وتعديل وحذف سجلات الإدارة.
- المستخدم النشط الآخر: قراءة بيانات المشروعات والمهام والمخاطر والهيكل؛ لا يمكنه تعديلها.
- البريد الإلكتروني والقرارات: للـ GM فقط.
- لا تعتمد على إخفاء الأزرار في الواجهة كحماية؛ الحماية الفعلية مطبقة داخل PostgreSQL عبر RLS.

5) حدود النسخة الحالية
- الموقع متصل بقاعدة Supabase عند تشغيله من عنوان ويب مسموح به.
- الموقع لم يُنشر بعد على نطاق عام/داخلي؛ يلزم اختيار استضافة ونشر index.html.
- لا يوجد تكامل تلقائي مع Gmail أو Microsoft 365 حتى الآن؛ سجل المراسلات يُدخل يدوياً.
- لم تُحمّل أسماء الموظفين أو الإدارات الفعلية أو مسؤوليات الفريق؛ يلزم تزويدنا بملف معتمد قبل إدخالها.
- لا تُرسل المنصة رسائل بريد ولا تعتمد قرارات نيابة عن المدير العام.

6) تنبيه أمني
- Publishable Key الموجود داخل index.html مصمم للاستخدام في المتصفح، لكن الأمان يعتمد على RLS.
- لا تضع مطلقاً service_role key أو أي Secret Key في HTML أو JavaScript عام.
- استخدم HTTPS، وكلمات مرور قوية، وأوقف التسجيل العام بعد إنشاء الحساب الأول.
