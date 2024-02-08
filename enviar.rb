require 'net/smtp'

# Configurações do SMTP
host = 'smtp.zoho.eu'
port = 587
username = 'contato@matheusqa.eu' # Substitua por seu email
password = '020921M@ria' # Substitua por sua senha

# Dados do email
remetente = 'contato@matheusqa.eu' # Substitua por seu email
destinatario = 'contato@matheusqa.eu' # Substitua pelo email de destino
assunto = 'Contato pelo site'

# Leitura dos dados do formulário
nome = params[:nome]
email = params[:email]
mensagem = params[:mensagem]

# Conteúdo do email
corpo_email = <<~HTML
  Nome: #{nome}
  Email: #{email}
  Mensagem: #{mensagem}
HTML

# Conexão com o servidor SMTP
smtp = Net::SMTP.new(host, port)
smtp.start(username, password, :plain) do |smtp|
  smtp.send_message(corpo_email, remetente, destinatario, assunto)
end

# Mensagem de sucesso
puts 'Email enviado com sucesso!'
