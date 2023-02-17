from rest_framework import viewsets, permissions, generics
from rest_framework.response import Response
from knox.models import AuthToken
from django.shortcuts import render
from rest_framework.views import APIView
from django.http import JsonResponse
from rest_framework import status,permissions,viewsets
from rest_framework import generics
from rest_framework.response import Response
from rest_framework.generics import GenericAPIView
from .models import *
from .serializers import *
from django.db.models import Q
import os
from django. shortcuts import render, HttpResponse
import requests
import json
api_key = '66ebdd8d4d2d41faa00d9e9fbeeb6022'

api_url = 'https://ipgeolocation.abstractapi.com/v1/?api_key=' + api_key

def get_ip_geolocation_data(ip_address):
   # not using the incoming IP address for testing
   print(ip_address)
   response = requests.get(api_url)
   return response.content

class RegistrationAPI(generics.GenericAPIView):
    serializer_class = CreateUserSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "token": AuthToken.objects.create(user)[1]
        })


class LoginAPI(generics.GenericAPIView):
    serializer_class = LoginUserSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')
        geolocation_json = get_ip_geolocation_data(ip)
        geolocation_data = json.loads(geolocation_json)
        print(geolocation_data)
        country = geolocation_data['country']
        city = geolocation_data['city']
        region = geolocation_data['region']
        print(country)
        print(region)
        print(city)
        token = self.request.POST.get('token')


        FCM_Token.objects.create(token=token,user=user,country=country,region=region,city=city)
        return Response({
            "user": UserSerializer(user, context=self.get_serializer_context()).data,
            "token": AuthToken.objects.create(user)[1]
        })

class UserAPI(generics.RetrieveAPIView):
    permission_classes = [permissions.IsAuthenticated, ]
    serializer_class = UserSerializer

    def get_object(self):
        return self.request.user

class createprofile(generics.ListCreateAPIView):
    queryset = Profile.objects.all()
    serializer_class = profileserializer
    permission_classes = [permissions.IsAuthenticated]

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)
    def get_object(self):
        return self.request.user

class profileDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Profile.objects.all()
    serializer_class = profileserializer
    permission_classes = [permissions.IsAuthenticated]

    def retrieve(self,request,pk=None):
        like = Profile.objects.filter(user_id=pk)
        data = profileserializer(like,many=True)
        return Response(data.data)
    def get_object(self):
        return self.request.user
