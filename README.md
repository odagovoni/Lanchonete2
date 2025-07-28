Documentação: 



o Instruções para instalação e execução da aplicação:

1. Projeto compilado foi dividido em 4 partes para que fosse possivel disponibilizar no repositorio.
2. Dentro da pasta "Lanchonete2/lanchonete", estão os arquivos com nome: "lanchonete.z01","lanchonete.z02","lanchonete.z03" e "lanchonete.zip".
3. Baixar esse 3 arquivos para que seja possivel descompactar.
4. Após, salvar o conteudo do pacote ".zip" em algum diretório de acesso permitido pelo sistema.
5. Executar o arquivo Lanchonete.exe.
6. Usa o e-mail "gerente@lanchonete.com" e senha: "12345" na tela de acessoa ao sistema.
7. Nos menos de Cadastros, Cadastrar alguns itens.
8. O Menu de cadastros foi divido duas rotinas, cadastro de lanches e cadastro de acompanhantes, apenas para melhor compreensão do usuario.
9. A operação é intuitiva.
10. Existe dados no banco enviado junto a solução, para melhor vizualização.



o Explicação das escolhas técnicas e de design.

1. Sobre escolhas:

   * Foi utilizado o Delphi 10.4.2 como ferramenta de desenvolvimento, pois possuo uma licença desta versão e
     motivo principal desta escolha foi o tempo de experiencia com desenvolvimento nesta ferramenta/linguagem (Delphi).
   * banco de dados SQLite, por ser um banco "portatil" que não demanda instalações e configurações.
   * Foi utilizado como padrão arquitetura (framework) VCL for Windows 32 e modo de desenvolvimento de projetos "RAD",
     meramente por se tratar de um projeto de teste sem aplicação real.
   * Para o relatorio "Cardapio" foi utilizado ReportBuilder.
   * Foi utilizado em algumas tela o componentes DevExpressVCL.

2. Sobre design, foi pensado numa solução que simule uma aplicação WEB com janelas modais e fundo branco.
   dado a complexidade do teste, trata-se de um sistema funcional e bem abrangente, foi pensado em não investir muito do tempo
   no design, priorizando funcionalidades.

   * Foi utilizado recursos padrões da VCL com menus laterais deslizantes e janelas não modais "docadas" em um container preservando o menu de nageção.

o Eventuais desafios enfrentados e/ou considerações.
	1. Tempo de projeto, foi o maior desafio pois ao analisar as funcionalidades e calcular o tempo investido em cada etapa do
	   desenvolvimento, cheguei a mais de 30 hr de desenvolvimento, considerando uma semana de prazo para conclusão, conidero o tempo
	   bem apertado.
	2. Desafios do projeto, usar um banco com muitas limitações, conciliar o tempo do desenvolvimento  teste com a conclusão de um
	   projeto que ainda estou finalizando.
	   

** Considerações: **
	- O Teste não foi totalmente concluido, não foram implementadas todas as funcionalidades descritas no documento, em função ao tempo que tive disponivel dorante a semana passada.
