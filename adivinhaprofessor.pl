% Definição dos professores
% nome, especialização, nível de graduação, estado de graduacao, genero, departamento
professor(alan_kelon, software, doutorado, pb, masculino, informatica).
professor(alisson_vasconcelos, hardware, doutorado, pb, masculino, sistemas_de_computacao).
professor(anand_subramanian, software, doutorado, pb, masculino, sistemas_de_computacao).
professor(bruno_bruck, software, doutorado, mg, masculino, computacao_cientifica).
professor(camila_mara, hardware, doutorado, pb, feminino, sistemas_de_computacao).
professor(carlos_eduardo, software, doutorado, pb, masculino, informatica).
professor(clauirton_albuquerque, software, doutorado, pb, masculino, informatica).
professor(daniela_coelho, software, mestrado, pb, feminino, informatica).
professor(danielly_rousy, software, doutorado, pb, feminino, informatica).
professor(derzu_omaia, software, mestrado, pb, masculino, informatica).
professor(ed_porto, software, doutorado, pb, masculino, informatica).
professor(ewerton_salvador, hardware, doutorado, pb, masculino, sistemas_de_computacao).
professor(gledson_elias, software, mestrado, pb, masculino, informatica).
professor(gustavo_motta, software, doutorado, pb, masculino, informatica).
professor(jairo_rocha, software, mestrado, rj, masculino, sistemas_de_computacao).
professor(josilene_aires, hardware, doutorado, pb, feminino, sistemas_de_computacao).
professor(leandro_carlos, hardware, doutorado, pb, masculino, informatica).
professor(lincoln_david, software, mestrado, pb, masculino, informatica).
professor(lucidio_formiga, hardware, doutorado, pb, masculino, computacao_cientifica).
professor(liliane_santos, software, doutorado, sp, feminino, informatica).
professor(mardson_freitas, hardware, doutorado, rn, masculino, sistemas_de_computacao).
professor(marcelo_iury, software, mestrado, ce, masculino, informatica).
professor(raoni_kulesza, software, mestrado, pb, masculino, informatica).
professor(ruy_alberto, hardware, doutorado, sp, masculino, sistemas_de_computacao).
professor(tiago_maritan, software, doutorado, pb, masculino, informatica).
professor(tatiana_simoes, software, doutorado, pb, feminino, computacao_cientifica).
professor(thais_gaudencio, software, doutorado, pb, feminino, informatica).
professor(natasha_correia, software, mestrado, pb, feminino, informatica).
professor(valdecir_becker, software, doutorado, rs, masculino, sistemas_de_computacao).
professor(veronica_maria, hardware, doutorado, ce, feminino, sistemas_de_computacao).
professor(yuska_paola, software, doutorado, pb, feminino, informatica).

% Áreas de pesquisa
area_pesquisa(engenharia_software, alan_kelon).
area_pesquisa(sistemas_embarcados, alisson_vasconcelos).
area_pesquisa(pesquisa_operacional, anand_subramanian).
area_pesquisa(pesquisa_operacional, bruno_bruck).
area_pesquisa(sistemas_de_controle, camila_mara).
area_pesquisa(sistemas_multimidias, carlos_eduardo).
area_pesquisa(inteligencia_artificial, clauirton_albuquerque).
area_pesquisa(bioinformatica, daniela_coelho).
area_pesquisa(engenharia_software, danielly_rousy).
area_pesquisa(visao_computacional, derzu_omaia).
area_pesquisa(design_audiovisual, ed_porto).
area_pesquisa(sistemas_embarcados, ewerton_salvador).
area_pesquisa(distribuicao_de_software, gledson_elias).
area_pesquisa(seguranca_computacional, gustavo_motta).
area_pesquisa(derivada_tropologica, jairo_rocha).
area_pesquisa(redes_computadores, josilene_aires).
area_pesquisa(processamento_de_imagem, leandro_carlos).
area_pesquisa(programacao, lincoln_david).
area_pesquisa(metodos_exatos, lucidio_formiga).
area_pesquisa(realidade_virtual, liliane_santos).
area_pesquisa(processamento_de_sinal, mardson_freitas).
area_pesquisa(sistemas_peer_to_peer, marcelo_iury).
area_pesquisa(sistemas_multimidias, raoni_kulesza).
area_pesquisa(sinais_acusticos, ruy_alberto).
area_pesquisa(influencia_fluxo_hidraulico, tatiana_simoes).
area_pesquisa(qualidade_de_traducao, tiago_maritan).
area_pesquisa(inteligencia_artificial, natasha_correia).
area_pesquisa(inteligencia_artificial, thais_gaudencio).
area_pesquisa(interacao_humano_computador, valdecir_becker).
area_pesquisa(engenharia_software, veronica_maria).
area_pesquisa(nudges_digitais, yuska_paola).


% Regras para adivinhação
adivinhar_professor :-
    pergunta_genero.

pergunta_genero :-
    write('Qual o gênero do professor? (masculino/feminino)'),
    read(Genero),
    pergunta_area_pesquisa(Genero).

pergunta_area_pesquisa(Genero) :-
    write('Qual é a área de pesquisa do professor? '),
    read(AreaPesquisa),
    pergunta_area(Genero, AreaPesquisa).

pergunta_area(Genero, AreaPesquisa) :-
    write('Qual a área de especialização do professor(a)? (software/hardware)'),
    read(Area),
    pergunta_graduacao(Genero, AreaPesquisa, Area).

pergunta_graduacao(Genero, AreaPesquisa, Area) :-
    write('Qual é o nível de graduação do professor em '), write(Area), write('? (mestrado/doutorado) '),
    read(Graduacao),
    pergunta_estado(Genero, AreaPesquisa, Area, Graduacao).

pergunta_estado(Genero, AreaPesquisa, Area, Graduacao) :-
    write('Em qual estado o professor se formou? '),
    read(Estado),
    pergunta_departamento(Genero, AreaPesquisa, Area, Graduacao, Estado).

pergunta_departamento(Genero, AreaPesquisa, Area, Graduacao, Estado) :-
    write('Qual é o departamento do professor? '),
    read(Departamento),
    (
        professor(Professor, Area, Graduacao, Estado, Genero, Departamento),
        area_pesquisa(AreaPesquisa, Professor),
        nl,
        write('O professor que você está pensando é: '), write(Professor), nl,
        pergunta_correto
    ;
        nl,
        write('Desculpe, não foi possível encontrar um professor com essas características.'), nl,
        write('Por favor, pense em outro professor.'), nl,
        jogar_novamente
    ).

pergunta_correto :-
    write('Esse é o professor correto? (s/n) '),
    read(Resposta),
    (
        Resposta == 's' ->
            write('Legal! Eu acertei o professor!'), nl, jogar_novamente;
            write('Que pena! Vamos tentar novamente.'), nl, nl, jogar
    ).

jogar :-
    write('Bem-vindo ao jogo de adivinhação de professores!'),
    nl,
    write('Pense em algum professor do centro de informática'),
    nl,
    nl,
    adivinhar_professor.

jogar_novamente :-
    write('Deseja jogar novamente? (s/n) '),
    read(Resposta),
    (
        Resposta == 's' ->
            nl, jogar;
            write('Obrigado por jogar! Até a próxima.')
    ).
exibir_professores :-
    professor(Professor, _, _, _, _, _),
    write(Professor), nl,
    fail.
exibir_professores.

exibir_caracteristicas_professor(Professor) :-
    professor(Professor, Especializacao, Graduacao, Estado, Genero, Departamento),
    write('Nome: '), write(Professor), nl,
    write('Especialização: '), write(Especializacao), nl,
    write('Nível de Graduação: '), write(Graduacao), nl,
    write('Estado de Graduação: '), write(Estado), nl,
    write('Gênero: '), write(Genero), nl,
    write('Departamento: '), write(Departamento), nl.
