from django.db import models
from django.contrib.auth.models import User

# Definicion del modelo estandar para los datos de auditoria
class AuditColumns(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    createdby = models.ForeignKey(User, editable=False, related_name='user_created')
    modified = models.DateTimeField(null=True, blank=True)
    modifiedby =models.ForeignKey(User, null=True, blank=True, related_name='user_modified')
    deleted = models.BooleanField(default=False)
    class Meta:
        abstract = True

# Definicion del modelo Status
class Status(AuditColumns):
    name = models.CharField(max_length=255)

# Definicion del modelo Users
class Users(AuditColumns):
    login = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    email = models.EmailField(max_length=75)
    url = models.URLField(max_length=200)
    status = models.ForeignKey(Status)


