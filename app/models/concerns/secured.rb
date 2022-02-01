module Secured

    def authenticate_user!
        #leer Header de auth
        token_regex = /Bearer (\w+)/
        headers = request.headers
        #verificar que sea valido
        if headers['Authorization'].present? && headers['Authorization'].match(token_regex)
            token = headers['Authorization'].match(token_regex)[1]
            if(Current.user = User.find_by_auth_token(token))
                return 
            end
        end
        #debemos verificar que el token corresponda a un user
        render json:{ error: 'Unauthorized'}, status: :unauthorized
    end
end