from rest_framework import permissions

class IsAdminOrReadOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        if bool(request.method in permissions.SAFE_METHODS):
            return True

        return bool(request.user and request.user.is_staff)