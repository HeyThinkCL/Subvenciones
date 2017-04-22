require 'net/http'
require 'uri'
require 'json'


def connect_innova(email,passwd)

  uri = URI.parse("https://api.innovacolegio.cl/authenticate")
  request = Net::HTTP::Post.new(uri)
  request.content_type = "application/json"
  request["Origin"] = "https://app.innovacolegio.cl"
  request["Accept-Language"] = "en-US,en;q=0.8,es;q=0.6"
  request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36"
  request["Accept"] = "*/*"
  request["Referer"] = "https://app.innovacolegio.cl/login"
  request["Authority"] = "api.innovacolegio.cl"
  request.body = JSON.dump({
                               "credentials" => {
                                   "email" => email,
                                   "password" => passwd
                               }
                           })

  req_options = {
      use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end


  data= response.body
  @usuario = usuario =  JSON.parse(data)


  url = "https://api.innovacolegio.cl/colegios?colegio_id=null&user_id=#{usuario['usuario']['id']}"


  uri = URI.parse(url)
  request = Net::HTTP::Get.new(uri)
  request.content_type = "application/json"
  request["Origin"] = "https://app.innovacolegio.cl"
  request["Accept-Language"] = "en-US,en;q=0.8,es;q=0.6"
  request["Authorization"] = @usuario['auth_token']
  request["Accept"] = "*/*"
  request["Referer"] = "https://app.innovacolegio.cl/after"
  request["Authority"] = "api.innovacolegio.cl"
  request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36"

  req_options = {
      use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

  data= response.body
  @colegios = colegios =  JSON.parse(data)

  @colegios_data=[]

  colegios.each do |colegio|

    p colegio




    uri = URI.parse("https://api.innovacolegio.cl/libro_clases/cursos?colegio_id=#{colegio['id']}")
    request = Net::HTTP::Get.new(uri)
    request.content_type = "application/json"
    request["Origin"] = "https://app.innovacolegio.cl"
    request["Accept-Language"] = "en-US,en;q=0.8,es;q=0.6"
    request["Authorization"] = @usuario['auth_token']
    request["Accept"] = "*/*"
    request["Referer"] = "https://app.innovacolegio.cl/app/libros/ver-cursos"
    request["Authority"] = "api.innovacolegio.cl"
    request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36"

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end


    data = response.body
    cursos =  JSON.parse(data)


    uri = URI.parse("https://api.innovacolegio.cl/configuraciones/calendario_academicos?id=1&colegio_id=#{colegio['id']}")
    request = Net::HTTP::Get.new(uri)
    request.content_type = "application/json"
    request["Origin"] = "https://app.innovacolegio.cl"
    request["Accept-Language"] = "es-419,es;q=0.8"
    request["Authorization"] = @usuario['auth_token']
    request["Accept"] = "*/*"
    request["Referer"] = "https://app.innovacolegio.cl/app/libros/ver-cursos/12/asistencia/ver"
    request["Authority"] = "api.innovacolegio.cl"
    request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36"

    req_options = {
        use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    data = response.body
    data =  JSON.parse(data)

    fechas_especiales =[]

    data['fechas_especiales'].each do |dia|
      fechas_especiales.push(Date.strptime(dia['fecha_inicio'],"%Y-%m-%d") )
    end

    p fechas_especiales

    dias = Date.today - Date.today.day+1

    dias_habiles = []

    xdia = dias
    dias.end_of_month.day.times.each do |dia|

      if xdia.wday >0 and xdia.wday<6 and fechas_especiales.include?(xdia) == false
        dias_habiles.push(xdia)
      end
      xdia = xdia+1
    end




    @colegios_data.push({:nombre=> colegio['nombre'],:cursos=>[],:dias_habiles=>dias_habiles.length})


    cursos.each do |curso|

      p curso['curso']['id'],colegio['id']


      uri = URI.parse("https://api.innovacolegio.cl/libro_clases/cursos/#{curso['curso']['id']}?colegio_id=#{colegio['id']}")
      request = Net::HTTP::Get.new(uri)
      request.content_type = "application/json"
      request["Origin"] = "https://app.innovacolegio.cl"
      request["Accept-Language"] = "es-419,es;q=0.8"
      request["Authorization"] = @usuario['auth_token']
      request["Accept"] = "*/*"
      request["Referer"] = "https://app.innovacolegio.cl/app/libros/ver-cursos/3/lista"
      request["Authority"] = "api.innovacolegio.cl"
      request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36"

      req_options = {
          use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      data = response.body
      data =  JSON.parse(data)

      cantidad =  data['alumnos'].length
      grado    =  data['curso']['curso']['grado']
      cursox    = data['curso']['curso']['curso']

      inasistencias = 0







      uri = URI.parse("https://api.innovacolegio.cl/libro_clases/cursos/asistencias?anno=2017&mes=4&curso_id=#{curso['curso']['id']}&colegio_id=#{colegio['id']}")
      request = Net::HTTP::Get.new(uri)
      request.content_type = "application/json"
      request["Origin"] = "https://app.innovacolegio.cl"
      request["Accept-Language"] = "en-US,en;q=0.8,es;q=0.6"
      request["Authorization"] = @usuario['auth_token']
      request["Accept"] = "*/*"
      request["Referer"] = "https://app.innovacolegio.cl/app/libros/ver-cursos/3/asistencia/ver"
      request["Authority"] = "api.innovacolegio.cl"
      request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36"

      req_options = {
          use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      data = response.body
      mes =  JSON.parse(data)['mes']

      mes.each do |dia|
        xdia = Date.strptime(dia['dia'],"%Y-%m-%d")

        if dias_habiles.include?(xdia)

          inasistencias = inasistencias +dia['alumnos'].length

        end

      end



      curso_data = {:cantidad=>cantidad,:grado=>grado,:curso=>cursox,:inasistencias=>inasistencias}

      @colegios_data.last[:cursos].push(curso_data)

    end

  end


  return  {:colegios=>@colegios_data,:usuario=>@usuario}
end

