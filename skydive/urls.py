from django.conf.urls import patterns, include, url

from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
                       # App views
                       url(r'^$', 'skydive.views.home', name='home'),
                       url(r'^why-skydive$', 'skydive.views.why_skydive', name='why_skydive'),
                       url(r'^learn-to-skydive$', 'skydive.views.learn_to_skydive', name='learn_to_skydive'),
                       url(r'^contact-us$', 'skydive.views.contact_us', name='contact_us'),

                       # Admin
                       url(r'^admin/doc/', include('django.contrib.admindocs.urls')),
                       url(r'^admin/', include(admin.site.urls)),
)
