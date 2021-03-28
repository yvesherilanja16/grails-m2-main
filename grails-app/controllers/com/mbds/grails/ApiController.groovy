package com.mbds.grails

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.rest.token.storage.TokenStorageService
import groovy.json.JsonSlurper
import org.grails.datastore.mapping.validation.ValidationException

import javax.servlet.http.HttpServletResponse


@Secured('ROLE_ADMIN')
class ApiController {
    AnnonceService annonceService
    UserService userService
    SpringSecurityService springSecurityService
    TokenStorageService tokenStorageService

//  GET / PUT / PATCH / DELETE
    def annonce() {
        switch (request.getMethod()) {

            case "GET":
                if(!params.id || !request.getHeader("Accept"))
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.get(params.id)
                if (!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                serializeData(annonceInstance, request.getHeader("Accept"))
                break
/*--------------------------------------------------------------------------------------------------------*/
            case "PUT":
                if(!params.id || !request.getHeader("Accept"))
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.read(params.id)
                if(!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND

                def jsonString = request.getJSON().toString()
                try {
                    def changes = new JsonSlurper().parseText(jsonString) as Map

                    annonceInstance.author          = changes.get("author")? User.read(changes.get("author").id) : null
                    annonceInstance.description     = changes.get("description")
                    annonceInstance.price           = changes.get("price").toString() as Double
                    annonceInstance.title           = changes.title
                    def illustrationList            = (changes.get("illustrations") as List).collect{it -> new Illustration(filename: it.filename)}

                    def olds = annonceInstance.illustrations.toList()

                    olds.each {
                        annonceInstance.removeFromIllustrations(it)
                        it.delete()
                    }
                    illustrationList.each {
                        annonceInstance.addToIllustrations(it)
                        it.save()
                    }
                    if(!annonceInstance.validate())
                        return response.status = HttpServletResponse.SC_BAD_REQUEST

                    annonceInstance.author.addToAnnonces(annonceInstance)
                    annonceInstance.save()
                    annonceInstance.author.save(flush: true)

                    return response.status = HttpServletResponse.SC_OK
                }
                catch (ValidationException e) {
                    e.printStackTrace()
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                }
                catch (Exception e) {
                    e.printStackTrace()
                    break
                }
/*--------------------------------------------------------------------------------------------------------*/
            case "PATCH":
                if(!params.id || !request.getHeader("Accept"))
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def jsonString = request.getJSON().toString()
                try {
                    def annonceInstance = Annonce.get(params.id)
                    if(!annonceInstance)
                        return response.status = HttpServletResponse.SC_NOT_FOUND

                    def changesMap = new JsonSlurper().parseText(jsonString) as Map

                    annonceInstance.title           = changesMap.get("title", annonceInstance.title)
                    annonceInstance.author          = User.get(changesMap.get("author", annonceInstance.author).id)
                    annonceInstance.description     = changesMap.get("description", annonceInstance.description)
                    annonceInstance.price           = changesMap.get("price", annonceInstance.price)
                    def illustrationList            = (changesMap.get("illustrations") as List).collect{it -> new Illustration(filename: it.filename)}

                    def olds =  annonceInstance.illustrations.toList()

                    illustrationList.each {
                        if(!olds.remove(it)) {
                            annonceInstance.addToIllustrations(it)
                            it.save()
                        }
                    }
                    annonceInstance.author.addToAnnonces(annonceInstance)
                    annonceInstance.save()
                    annonceInstance.author.save(flush: true)

                    return response.status = HttpServletResponse.SC_OK
                }
                catch (ValidationException e) {
                    e.printStackTrace()
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                }
                catch (Exception e) {
                    e.printStackTrace()
                    break
                }
/*--------------------------------------------------------------------------------------------------------*/
            case "DELETE":
                if(!params.id || !request.getHeader("Accept"))
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def annonceInstance = Annonce.read(params.id)
                if(!annonceInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                try{
                    annonceService.delete(params.id)
                    return response.status = HttpServletResponse.SC_OK
                }
                catch (Exception e) {
                    e.printStackTrace()
                   break
                }
/*--------------------------------------------------------------------------------------------------------*/
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
        }
        return response.status = HttpServletResponse.SC_NOT_IMPLEMENTED
    }

//    GET / POST
    def annonces() {
        switch (request.getMethod()) {

            case "GET":
                def annoncesList = Annonce.getAll();
                serializeData(annoncesList, request.getHeader("Accept"))
                break
 /*--------------------------------------------------------------------------------------------------------*/
            case "POST":
                try{
                    annonceService.save(request.getJSON() as Annonce)
                    return response.status = HttpServletResponse.SC_CREATED
                }
                catch (ValidationException e) {
                    e.printStackTrace()
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                }
 /*--------------------------------------------------------------------------------------------------------*/
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
        }
        return response.status = HttpServletResponse.SC_BAD_REQUEST
    }

//  GET / PUT / PATCH / DELETE
    def user() {
        switch(request.getMethod()){
            case "GET":
               if(!params.id || !request.getHeader("Accept"))
                   return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = User.get(params.id)
                if(!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND
                serializeData(userInstance, request.getHeader("Accept"))
                break
/*--------------------------------------------------------------------------------------------------------*/
            case "PUT":
                if(!params.id || !request.getHeader("Accept"))
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance =  User.get(params.id)
                if(!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND

                def currentLoggedUser   = springSecurityService.getCurrentUser() as User
                def  loggedRole         = UserRole.findByUser(currentLoggedUser)
                if(userInstance.id != currentLoggedUser.id || loggedRole.role.authority != "ROLE_ADMIN")
                    return response.status = HttpServletResponse.SC_FORBIDDEN

                def jsonString = request.getJSON().toString()
                try {
                    def changes = new JsonSlurper().parseText(jsonString) as Map

                    userInstance.username = changes.get("username", null)
                    userInstance.password = changes.get("password", null)

                    if(!userInstance.validate())
                        return response.status = HttpServletResponse.SC_BAD_REQUEST

                    userInstance.save(flush: true)

                    def tokenValue = (request.getHeader("Authorization").toString().split(" "))[1]
                    tokenStorageService.removeToken(tokenValue)

                    return response.status = HttpServletResponse.SC_OK
                }
                catch (ValidationException e) {
                    e.printStackTrace()
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                }
                catch(Exception e) {
                    e.printStackTrace()
                    break
                }
/*--------------------------------------------------------------------------------------------------------*/
            case "PATCH":
                if(!params.id || !request.getHeader("Accept"))
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance =  User.get(params.id)
                if(!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND

                def currentLoggedUser   = springSecurityService.getCurrentUser() as User
                def  loggedRole         = UserRole.findByUser(currentLoggedUser)
                if(userInstance.id != currentLoggedUser.id || loggedRole.role.authority != "ROLE_ADMIN")
                    return response.status = HttpServletResponse.SC_FORBIDDEN

                def jsonString = request.getJSON().toString()
                try {
                    def changes = new JsonSlurper().parseText(jsonString) as Map

                    userInstance.username = changes.get("username", userInstance.username)
                    userInstance.password = changes.get("password", userInstance.password)

                    if(!userInstance.validate())
                        return response.status = HttpServletResponse.SC_BAD_REQUEST

                    userInstance.save(flush: true)

                    def tokenValue = (request.getHeader("Authorization").toString().split(" "))[1]
                    tokenStorageService.removeToken(tokenValue)

                    return response.status = HttpServletResponse.SC_OK
                }
                catch (ValidationException e) {
                    e.printStackTrace()
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                }
                catch(Exception e) {
                    e.printStackTrace()
                    break
                }
/*--------------------------------------------------------------------------------------------------------*/
            case "DELETE":
                if(!params.id || !request.getHeader("Accept"))
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                def userInstance = User.get(params.id)
                if(!userInstance)
                    return response.status = HttpServletResponse.SC_NOT_FOUND

                def currentLoggedUser   = springSecurityService.getCurrentUser() as User
                def  loggedRole         =  UserRole.findByUser(currentLoggedUser)
                if(userInstance.id != currentLoggedUser.id || loggedRole.role.authority != "ROLE_ADMIN")
                    return response.status = HttpServletResponse.SC_FORBIDDEN

                try{
                   if(userInstance.id == currentLoggedUser.id){
                       def tokenValue = (request.getHeader("Authorization").toString().split(" "))[1]
                       tokenStorageService.removeToken(tokenValue)
                   }
                    UserRole.removeAll(userInstance)
                    userService.delete(params.id)

                    return response.status = HttpServletResponse.SC_OK
                }
                catch (Exception e) {
                    e.printStackTrace()
                    break
                }
/*--------------------------------------------------------------------------------------------------------*/
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
        }
        return response.status = HttpServletResponse.SC_NOT_IMPLEMENTED
    }

//  GET / POST
    def users() {
        switch (request.getMethod()) {
            case "GET":
                def userList = User.getAll()
                serializeData(userList, request.getHeader("Accept"))
                break
/*--------------------------------------------------------------------------------------------------------*/
            case "POST":
                try {
                    userService.save(request.getJSON() as User)
                    return response.status = HttpServletResponse.SC_CREATED
                }
                catch (ValidationException e) {
                    e.printStackTrace()
                    return response.status = HttpServletResponse.SC_BAD_REQUEST
                }
/*--------------------------------------------------------------------------------------------------------*/
            default:
                return response.status = HttpServletResponse.SC_METHOD_NOT_ALLOWED
        }
        return response.status = HttpServletResponse.SC_BAD_REQUEST
    }

    def serializeData(object, format)
    {
        switch (format)
        {
            case 'json':
            case 'application/json':
            case 'text/json':
                render object as JSON
                break
            case 'xml':
            case 'application/xml':
            case 'text/xml':
                render object as XML
                break
            default:
                return response.status = HttpServletResponse.SC_BAD_REQUEST
        }
    }
}
