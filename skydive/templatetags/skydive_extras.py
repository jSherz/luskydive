import re

from django import template


register = template.Library()


@register.simple_tag(takes_context=True)
def active_link(context, expected):
    if re.match(expected, context['request'].path):
        return ' class="active"'
    else:
        return ''