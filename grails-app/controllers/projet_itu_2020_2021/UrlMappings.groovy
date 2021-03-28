package projet_itu_2020_2021

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller:'annonce')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
