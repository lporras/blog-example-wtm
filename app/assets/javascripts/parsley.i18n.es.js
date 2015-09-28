window.ParsleyConfig = window.ParsleyConfig || {};
window.ParsleyConfig.i18n = window.ParsleyConfig.i18n || {};

window.ParsleyConfig.i18n.es = $.extend(window.ParsleyConfig.i18n.es || {}, {
  defaultMessage: "no es válido",
  type: {
    email:        "debe ser un correo válido",
    url:          "debe ser una URL válida",
    number:       "debe ser un número válido",
    integer:      "debe ser un entero",
    digits:       "debe ser un digito",
    alphanum:     "debe ser alfanumérico"
  },
  notblank:       "no puede estar en blanco",
  required:       "no puede estar en blanco",
  pattern:        "Este valor es incorrecto",
  min:            "debe ser menor que %s",
  max:            "debe ser mayor que %s",
  range:          "debe estar entre %s y %s",
  minlength:      "Este valor es muy corto. La longitud mínima es de %s caracteres",
  maxlength:      "Este valor es muy largo. La longitud máxima es de %s caracteres",
  length:         "La longitud de este valor debe estar entre %s y %s caracteres",
  mincheck:       "Debe seleccionar al menos %s opciones",
  maxcheck:       "Debe seleccionar %s opciones o menos",
  check:          "Debe seleccionar entre %s y %s opciones",
  equalto:        "Este valor debe ser idéntico"
});

// If file is loaded after Parsley main file, auto-load locale
if ('undefined' !== typeof window.ParsleyValidator)
  window.ParsleyValidator.addCatalog('es', window.ParsleyConfig.i18n.es, true);