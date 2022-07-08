INSERT INTO usuario(id_usuario, senha, email, tipo_sanguineo, sexo, genero, login, cpf, dt_nascimento, id_endereco)
	  VALUES  ('1234','joao.carlo@gmail.com' , 'O+' , 'Masculino', 'Neutro', 'joao.carlo', '10063541865', '10-04-1986'),
	          ('1235','ricado.salles@gmail.com' , 'A-' , 'Masculino', 'Neutro', 'ricado.salles', '789.635.412-95', '23-09-1986' ),
	          ('1236','maria.maria@gmail.com' , 'A+' , 'Feminino', 'Neutro', 'maria.maria', '100.000.412-67', '27-04-1986'),
	          ('1237','fernanda.telles@gmail.com' , 'O+' , 'Feminino', 'Neutro', 'fernanda.telles', '100.635.412-65', '30-03-1986'),
	          ('1238','carlos.monte@gmail.com' , 'O+' , 'Masculino', 'Neutro', 'carlos.monte', '100.635.456-05', '15-07-1986' ),
	          ('1239','federico.santos@gmail.com' , 'A-' , 'Masculino', 'Neutro', 'federico.santos', '103.698.412-75', '08-04-1756' ),
	          ('1231','rita.silva@gmail.com' , 'O+' , 'Feminino', 'Neutro', 'rita.silva', '100.635.896-60', '10-10-2021' ),
	          ('1232','pedro.carlos@gmail.com' , 'A-' , 'Masculino', 'Neutro', 'pedro.carlos', '178.600.412-65', '05-01-2000' ),
	          ('1233','carla.neves@gmail.com' , 'O+' , 'Feminino', 'Neutro', 'carla.neves', '130.035.492-65', '10-09-1887' ),
	          ('1234','carlo.jorge@gmail.com' , 'A+' , 'Masculino', 'Neutro', 'carlo.jorge', '100.635.000-35', '20-09-1990');
	          
INSERT INTO  usuario(id_usuario, senha, email, tipo_sanguineo, sexo, genero, login, cpf, dt_nascimento, id_endereco)
  select p.id_endereco ,'1234','joao.carlo@gmail.com' , 'O+' , 'Masculino', 'Neutro', 'joao.carlo', '10063541865', '10-04-1986' from Endereco p;
	          
 select *from usuario;
 delete from Usuario;
