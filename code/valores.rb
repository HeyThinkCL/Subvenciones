Grado.all().each do |grado|
  Subvencion.all().each() do |subvencion|

    valor = Valor.new()
    valor.subvenciones_id = subvencion.id.to_i
    #p subvencion.sigla<<subvencion.id
    valor.grado = grado
    valor.precio = 0

    valor.save()

  end
end


Grado.where("estado = 'media'").all().each do |grado|

  grado.valores.each do |valor|

    if valor.subvenciones_id ==1
      valor.precio = "8254631"
      valor.save()
    end

  end

end
Grado.where("estado = 'basico'  or estado = 'kinder' ").all().each do |grado|

  grado.valores.each do |valor|

    if valor.subvenciones_id ==1
      valor.precio = "6915150"
      valor.save()
    end
  end
end


Grado.where("estado = 'basico'  and (nivel = 8 or nivel = 7)").all().each do |grado|

  grado.valores.each do |valor|

    if valor.subvenciones_id ==1
      valor.precio = "6937212"
      valor.save()
    end
  end
end
