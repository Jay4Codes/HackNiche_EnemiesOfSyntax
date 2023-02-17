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
from newsapi.newsapi_client  import NewsApiClient
newsApi = NewsApiClient(api_key='70aad84b320846ad98c6d2974b4145ee')
from rest_framework.views import APIView

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


class newsapi(APIView):
    #permission_classes = [permissions.IsAuthenticated]
    def get(self, request):
        category = self.request.GET.get('category')
        local = self.request.GET.get('local')
        if local:
            headLines = newsApi.get_top_headlines(country='in')
            articles = headLines['articles']
            return Response(articles)
        if category and local:
            headLines = newsApi.get_top_headlines(category=category,country='in')
            articles = headLines['articles']
            return Response(articles)
        source = self.request.GET.get('source')
        if source:
            headLines = newsApi.get_top_headlines(source=source,country='in')
            articles = headLines['articles']
            return Response(articles)
        globalloc = self.request.GET.get('global')
        if globalloc:
            headLines = newsApi.get_top_headlines(country='us')
            articles = headLines['articles']
            return Response(articles)
        if category and globalloc:
            headLines = newsApi.get_top_headlines(category=category,country='us')
            articles = headLines['articles']
            return Response(articles)
        query = self.request.GET.get('query')
        if query:
            headLines = newsApi.get_top_headlines(q=query)
            articles = headLines['articles']
            return Response(articles)

class newsSources(APIView):
    def get(self,request):
        newsSources = newsApi.get_sources()
        articles = newsSources['sources']
        return Response(articles)

class createnewsapi(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated, ]
    serializer_class = newsserializer
    queryset = createnews.objects.all()

    def create(self, request, *args, **kwargs):
        source = self.request.data.get('source')
        post_user = self.request.data.get('post_user')
        title = self.request.data.get('title')
        description = self.request.data.get('description')
        content = self.request.data.get('content')
        images = self.request.FILES.get('images')
        url = self.request.data.get('url')
        new_badwords = list(badwords)
        x = [x.lower() for x in new_badwords]
        print(x)

        for i in description.split(' '):
            print(i)

            if i in x:
                response_dict = {"Hate Speech Detected": "This text has content with hate "+i}
                return Response(response_dict)
        #data = request.data
        # response = Detoxify('unbiased').predict(description)
        # ordered_toxicity_scores = sorted(response.items(),key = lambda x: x[1],reverse = True)
        # response_dict = {}
        # for i in ordered_toxicity_scores:
        #     if i[1] > 0.9:
        #         response_dict = {"Hate Speech Detected": "This text has {hate} content with {value}".format(hate=i[0],value = i[1]), "hate":True}
        #         return Response(response_dict)
        # profanity.load_censor_words(badwords)
        # description1 = profanity.censor(description)
        # description_new = description1

        # params = {
        #   'models': 'nudity-2.0',
        #   'api_user': '377537108',
        #   'api_secret': 'sxCd4WhwiGeF85jykwU8'
        # }
        # print(images)
        # files = {'media': open(images,'rb')}
        # r = requests.post('https://api.sightengine.com/1.0/check.json', files=files, data=params)
        # output = json.loads(r.text)
        # print(output)

        create = createnews.objects.create(user_id = post_user,title=title,description=description,url=url,Image=images,content=content,source=source)

        create.save()
        serializer = newsserializer(create,read_only=True,context={'request':request})
        return Response(serializer.data)

    def retrieve(self,request,pk=None):
        like = createnews.objects.filter(pk=pk)
        data = newsserializer(like,many=True)
        return Response(data.data)

