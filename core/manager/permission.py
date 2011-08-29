# -*- coding: utf-8 -*-

__FNAME__ = 'permission.py'
__MNAME__ = 'Core/Manager'  # nazwa modulu

import md5 as md5mod
import re
from copy import deepcopy
from datetime import datetime
from django.core.mail import EmailMultiAlternatives
from django.conf import settings
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from core.debug.debug import Debugger
from core.models import PermisionGroup, UserProfile, UserProfileData


class PermissionManager(object):
    """ Permission
    """

    def __init__(self, *args, **kwargs):
        """Init
        """
        self.user = None
        self.panel = False
        self.user_permissions = None
        self.permissions = { 'public': True, 'read': False, 'write': False, 'delete': False, 'add': False, 'own': False }
        self.admin_permissions = { 'public': False, 'read': False, 'write': False, 'delete': False, 'add': False, 'own': False }
        self.all_user_permissions = dict()
        self.debugger = Debugger(__MNAME__,__FNAME__)
        self.context = dict()
        #self.options = None

    def fetch_user(self, request):
        if request.method == 'POST':
            if request.POST.has_key('uname'):
                if request.POST.has_key('upasswd'):
                    self.check_login(request)

    def check_login(self, request):
        self.user = None
        self.panel = False
        uname = request.POST['uname']
        upasswd = request.POST['upasswd']

        if request.POST.has_key('panel'):
            options = { 'username': uname, 'password': upasswd, 'confirmed': '1' }
            try:
                users = UserProfile.objects.optfilter(options)
            except Exception,e:
                self.debugger.catch_error('fetch_user: ',e)
        else:
            options = { 'site': settings.SITE_ID, 'username': uname, 'password': upasswd, 'confirmed': '1' }
            try:
                users = UserProfile.objects.optfilter(options)
            except Exception,e:
                self.debugger.catch_error('fetch_user: ',e)
        if users:
            if len(users) == 1:
                user = users[0]
                loginhash = md5mod.new(str(user.username) + str(user.userhash))
                ltuple = (user.id, loginhash.hexdigest())
                for sesskey in request.session.keys():
                    del request.session[sesskey]
                request.session['logint'] = ltuple
                user.lastlogin = datetime.now()
                user.lastip = request.META['REMOTE_ADDR']
                user.save()
                self.user = user
                if request.POST.has_key('panel'):
                    self.panel = True

    def check_logged_user(self, request, admin=False):
        self.user = None
        self.user_permissions = None
        self.all_user_permissions = dict()
        try:
            ltuple = request.session['logint']
            userId = ltuple[0]
            loginHash = ltuple[1]
            user = UserProfile.objects.get(id=userId)
            baseLoginHash = md5mod.new(str(user.username) + str(user.userhash))
            if str(baseLoginHash.hexdigest()) == loginHash:
                self.user = user
                self.user_permissions = self.user.get_permissions()
                self.prepare_all_user_permissions()
        except Exception,e:
            self.debugger.catch_error('check_logged_user: ', e)
        """
        print self.user, admin

        if self.user is None:
            if admin is True:
                pass
        else:
            return None
        """

    def logout(self, request):
        try:
            del request.session['logint']
        except Exception,e:
            self.debugger.catch_error('logout: ',e)
        self.user = None
        self.user_permissions = None
        self.all_user_permissions = dict()

    def compare_permissions(self, item, modelname, admin):
        permissions = None
        user_permissions = None
        op = None
        user_perm_dict = { 'public': False, 'read': False, 'write': False, 'delete': False, 'add': False, 'own': False }

        if item is not None:
            op = item.get_permissions()
        if op is None:
            try:
                if admin is True:
                    permissions = PermisionGroup.objects.filter(model=modelname).exclude(parent=1)
                else:
                    permissions = PermisionGroup.objects.filter(model=modelname).exclude(parent=2)
            except Exception,e:
                self.debugger.catch_error('compare_permissions: ',e)
            if permissions is not None:
                if len(permissions) == 1:
                    permissions = permissions[0]
                    try:
                        user_permissions = self.user_permissions.filter(parent=permissions)
                    except Exception,e:
                        self.debugger.catch_error('compare_permissions: ',e)

                    if user_permissions is not None:
                        for perm in user_permissions:
                            if perm.public is True:
                                if permissions.public is True:
                                    user_perm_dict['public'] = True
                            if perm.read is True:
                                if permissions.read is True:
                                    user_perm_dict['read'] = True
                            if perm.write is True:
                                if permissions.write is True:
                                    user_perm_dict['write'] = True
                            if perm.delete is True:
                                if permissions.delete is True:
                                    user_perm_dict['delete'] = True
                            if perm.add is True:
                                if permissions.add is True:
                                    user_perm_dict['add'] = True
                            if perm.own_only is True:
                                if permissions.own_only is True:
                                    user_perm_dict['own'] = True

            if admin is True:
                self.admin_permissions = user_perm_dict
            else:
                self.permissions = user_perm_dict

    def prepare_all_user_permissions(self):
        perm_dict = dict()
        if self.user_permissions is not None:
            for perm in self.user_permissions.all():
                if perm_dict.has_key(perm.parent.model):
                    pass
                else:
                    perm_dict.update({ perm.parent.model: { 'public': perm.public, 'read': perm.read, 'write': perm.write, 'delete': perm.delete, 'add': perm.add, 'own': perm.own_only } })

                if perm.public is True:
                    perm_dict[perm.parent.model]['public'] = True
                if perm.read is True:
                    perm_dict[perm.parent.model]['read'] = True
                if perm.write is True:
                    perm_dict[perm.parent.model]['write'] = True
                if perm.delete is True:
                    perm_dict[perm.parent.model]['delete'] = True
                if perm.add is True:
                    perm_dict[perm.parent.model]['add'] = True
                if perm.own_only is True:
                    perm_dict[perm.parent.model]['own'] = True

        self.all_user_permissions = perm_dict

    def prepare_permissions(self, permissions):
        perm_dict = dict()
        if permissions is not None:
            for perm in permissions.all():
                if perm_dict.has_key(perm.parent.model):
                    pass
                else:
                    perm_dict.update({ perm.parent.model: { 'public': perm.public, 'read': perm.read, 'write': perm.write, 'delete': perm.delete, 'add': perm.add, 'own': perm.own_only } })

                if perm.public is True:
                    perm_dict[perm.parent.model]['public'] = True
                if perm.read is True:
                    perm_dict[perm.parent.model]['read'] = True
                if perm.write is True:
                    perm_dict[perm.parent.model]['write'] = True
                if perm.delete is True:
                    perm_dict[perm.parent.model]['delete'] = True
                if perm.add is True:
                    perm_dict[perm.parent.model]['add'] = True
                if perm.own_only is True:
                    perm_dict[perm.parent.model]['own'] = True

        return perm_dict

    def get_context(self):
        self.context.update({ 'all_permissions': self.all_user_permissions, 'permissions': self.permissions, 'admin_permissions': self.admin_permissions })
        self.context.update({ 'profileuser': self.user })
        return self.context

    def checkEmail(self, data):
        try:
            if len(data) > 5:
                if re.match("^.+\\@(\\[?)[a-zA-Z0-9\\-\\.]+\\.([a-zA-Z]{2,3}|[0-9]{1,3})(\\]?)$", data) == None:
                    return True
            else:
                return True
            email = ProfileUsers.objects.get(email=data)
            if(email):
                return True
            return False
        except:
            return False

    def checkLoginName(self, login):
        try:
            username = ProfileUsers.objects.get(username=login)
            if(username):
                return True
            return False
        except:
            return False
