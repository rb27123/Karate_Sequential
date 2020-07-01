function fn() {
  var config = {
	base_url: 'https://api.themoviedb.org/3',
    request_token_path: 'authentication/token/new',
    validate_token_path: 'authentication/token/validate_with_login',
    create_session_id_path: 'authentication/session/new',
    create_list_path: 'list'
  }
  return config;
}