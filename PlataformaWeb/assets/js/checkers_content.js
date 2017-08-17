// función para cambiar el contenido si es texto o video.
$(document).ready(function() {
    $('input[type=radio][name=contenido_original]').change(function() {
        if (this.value == 'texto') {
            document.getElementById('tipo_contenido').innerHTML = tipo_original_texto();
            document.getElementById('subir_contenido').innerHTML = form_contenido("texto");
        } else if (this.value == 'video') {
            document.getElementById('tipo_contenido').innerHTML = tipo_original_video();
            document.getElementById('subir_contenido').innerHTML = form_contenido("video");
        }
        add_handler_contenido();
    });
});

function add_handler_contenido() {
  $(document).ready(function() {
    $('input[type=radio][name=tipo_contenido]').change(function() {
        document.getElementById('subir_contenido').innerHTML = form_contenido(this.value);
    });
  });
}

function tipo_original_texto() {
  return '<p style="">Seleccione el tipo de contenido:</p>' +
  '<label class="control-label" style="margin-right: 5%">' +
      '<input type="radio" name="tipo_contenido" value="texto" checked> Texto' +
  '</label>' +
  '<label class="control-label" data-pg-collapsed="" style="margin-right: 5%">' +
      '<input type="radio" name="tipo_contenido" value="sign" > Lenguaje de signos' +
  '</label>' +
  '<label class="control-label" data-pg-collapsed="">' +
      '<input type="radio" name="tipo_contenido" value="audio" > Audio descripción' +
  '</label>';
}

function tipo_original_video() {
  return '<p style="">Seleccione el tipo de contenido:</p>' +
  '<label class="control-label" data-pg-collapsed="" style="margin-right: 5%">' +
      '<input type="radio" name="tipo_contenido" value="video" checked> Vídeo' +
  '</label>' +
  '<label class="control-label" data-pg-collapsed="" style="margin-right: 5%">' +
      '<input type="radio" name="tipo_contenido" value="sub" > Subtítulos' +
  '</label>' +
  '<label class="control-label" data-pg-collapsed="" style="margin-right: 5%">' +
      '<input type="radio" name="tipo_contenido" value="sign" > Lenguaje de signos' +
  '</label>' +
  '<label class="control-label" data-pg-collapsed="">' +
      '<input type="radio" name="tipo_contenido" value="audio" > Audio descripción' +
  '</label>';
}

function form_contenido(tipo) {
  var contenido = '<p>Idioma del contenido:<br><input type="text" name="idioma" value=""></p>' +
  '<p>Descripción del contenido:<br><input type="text" value="" name="descripcioncontenido" size="50"></p>' +
  '<p>Ubicación del contenido:<br><input type="text" name="ubicacion" value=""></p>' +
  '<p>Sala:<br><input type="text" name="nsala" value=""></p>' +
  '<p>Código:<br><input type="text" name="idcontenido" value=""></p>';



  if (tipo == 'texto') {
       return contenido + form_texto_contenido();
  } else {
      return contenido + form_file_contenido();
  }
}

function form_file_contenido() {
  return '<p>Fichero:<br><input class="btn btn-default" type="file" name="file" id="file" value=""></p>';
}

function form_texto_contenido() {
  return '<p>Texto:<br><input type="text" name="texto" size="50" value=""></p>';
}
