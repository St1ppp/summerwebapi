from django.urls import path, include

from rest_framework import routers

from .views import CartViewSet

router = routers.SimpleRouter()
router.register(r"carts" , CartViewSet, basename="carts")


urlpatterns = [
    path('', include(router.urls)),
]
