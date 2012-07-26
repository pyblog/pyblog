from django.db import models
from django.contrib.auth.models import User,Group
class BaseBlog(models.Model):
    enable = models.BooleanField()
    created = models.DateTimeField(auto_now_add = True)
    modified = models.DateTimeField(auto_now = True)
    created_by = models.ForeignKey(User,related_name="%(app_label)s_%(class)s_createdby")
    modified_by = models.ForeignKey(User,related_name="%(app_label)s_%(class)s_modifiedby",null=True, blank=True)
    deleted = models.BooleanField()
    class Meta:
        abstract = True

class UserStatus(BaseBlog):
    name = models.CharField(max_length = 20)

class UserProfile(BaseBlog):
    user = models.OneToOneField(User)
    nice_name = models.CharField(max_length = 100)
    url = models.CharField(max_length = 100)
    activation_key = models.CharField(max_length = 255)
    status = models.ForeignKey(UserStatus)
    display_name = models.CharField(max_length=100)

class UserMetaData(BaseBlog):
    user = models.OneToOneField(User)
    key = models.CharField(max_length = 255)
    data = models.TextField()


class Category(BaseBlog):
    name = models.CharField(max_length = 255)
    parent = models.ForeignKey("self",null=True, blank=True,related_name="child_category_set")

class Tag(BaseBlog):
    name = models.CharField(max_length=255)

class Post(BaseBlog):
    title = models.CharField(max_length = 255)
    body = models.TextField()
    author = models.ForeignKey(User,related_name="AutorPost")
    category = models.ForeignKey(Category)

class Comment(BaseBlog):
    post = models.ForeignKey(Post)
    author = models.ForeignKey(User,null=True, blank=True,related_name="AutorComment")
    author_name = models.CharField(max_length=100)
    author_email = models.CharField(max_length=100)
    author_url = models.CharField(max_length=200)
    author_ip = models.CharField(max_length=100)

    content = models.TextField()

    approved = models.BooleanField()
    agent = models.CharField(max_length=255)



#Definicion del modelo estandar para los datos de auditoria
#class AuditColumns(models.Model):
#    created = models.DateTimeField(auto_now_add=True)
#    createdby = models.ForeignKey(User, editable=False, related_name='user_created')
#    modified = models.DateTimeField(null=True, blank=True)
#    modifiedby =models.ForeignKey(User, null=True, blank=True, related_name='user_modified')
#    deleted = models.BooleanField(default=False)
#    class Meta:
#        abstract = True
#
## Definicion del modelo Status
#class Status(AuditColumns):
#    name = models.CharField(max_length=255)
#
## Definicion del modelo Users
#class Users(AuditColumns):
#    login = models.CharField(max_length=255)
#    password = models.CharField(max_length=255)
#    email = models.EmailField(max_length=75)
#    url = models.URLField(max_length=200)
#    status = models.ForeignKey(Status)
