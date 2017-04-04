# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
   inflect.irregular 'dashboard', 'dashboard'
   inflect.irregular 'profesor', 'profesores'
   inflect.irregular 'alumno', 'alumnos'
   inflect.irregular 'asistencia', 'asistencias'
   inflect.irregular 'curso', 'cursos'
   inflect.irregular 'grado', 'grados'
   inflect.irregular 'valor', 'valores'
   inflect.irregular 'login', 'login'
   inflect.irregular 'subvencion', 'subvenciones'
   inflect.irregular 'estimador', 'estimadores'
   inflect.irregular 'hora', 'horas'
   inflect.irregular 'asignatura', 'asignaturas'
   inflect.irregular 'otras_hora', 'otras_horas'
   inflect.irregular 'colegio', 'colegios'
   inflect.irregular 'sostenedor', 'sostenedores'
   inflect.irregular 'usuario', 'usuarios'
   inflect.irregular 'rol', 'roles'
   inflect.irregular 'inhabil', 'inhabiles'


#   inflect.uncountable %w( fish sheep )
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
