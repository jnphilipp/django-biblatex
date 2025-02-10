# Copyright (C) 2025 J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
#
# This file is part of django-biblatex.
#
# django-biblatex is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# django-biblatex is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with django-biblatex. If not, see <http://www.gnu.org/licenses/>.
"""Django biblatex app."""

from django.apps import AppConfig
from django.utils.translation import gettext_lazy as _


class DjangoBiblatexConfig(AppConfig):
    """Django biblatex app config."""

    default_auto_field = "django.db.models.BigAutoField"
    name = "django_biblatex"
    verbose_name = _("Biblatex")
    verbose_name_plural = _("Biblatex")
