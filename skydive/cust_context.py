from django.conf import settings


def cust_context(request):
    """Returns the custom context variables (meta tags)."""
    return {
        'meta': settings.META
    }