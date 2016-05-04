var Blog = function() {
		
	// Validação do form
	var validator = $('.blog-form').validate();

	if (validator.valid()) {
		console.log('postagem criada com sucesso');
  } else {
  	console.log('postagem invalida');
  }
}