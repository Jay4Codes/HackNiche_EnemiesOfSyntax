from django.db import models
from django.contrib.auth.models import User
import os
# Create your models here.

class Profile(models.Model):
	user = models.ForeignKey(User, related_name = 'profiledetails', on_delete=models.CASCADE) 
	email = models.EmailField(("Email Address"),primary_key=True)
	name = models.CharField(max_length = 30)
	interests = models.TextField(null=True,blank=True)
	about = models.TextField(null=True,blank=True)
	age = models.TextField(null=True,blank=True)
	date_of_birth = models.DateField(null=True, blank=True)
	profile_pic = models.ImageField(null=True,blank=True)



class FCM_Token(models.Model):
    user                = models.ForeignKey(User, on_delete=models.CASCADE, related_name="fcm_user")  
    token               = models.CharField(max_length=255, blank=True, null=True)
    city 				= models.TextField(null=True,blank=True)
    country				= models.TextField(null=True,blank=True)
    region			    = models.TextField(null=True,blank=True)
    create_date         = models.DateTimeField(auto_now_add=True)

class createnews(models.Model):
	user                = models.ForeignKey(User, on_delete=models.CASCADE, related_name="journalist") 
	source 				= models.TextField(null=True,blank=True)
	title               = models.TextField(null=True,blank=True)
	description 		= models.TextField(null=True,blank=True)
	url   		   	    = models.TextField(null=True,blank=True)
	create_date         = models.DateTimeField(auto_now_add=True)
	content             = models.TextField(null=True,blank=True)
	Image			= models.ImageField(null=True,blank=True)
