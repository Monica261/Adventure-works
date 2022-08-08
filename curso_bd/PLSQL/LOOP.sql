/*LOOP FOR*/
declare
    v_tab int;
begin
    v_tab:=&v_digitado;
    for seq in 1..10 loop
      dbms_output.put_line (seq || 'x' || v_tab || ' = ' || seq*v_tab);
    end loop;
end;

-------------------------------------------
--loop para insert
create table teste_for(
	numero1 int,
  numero2 int
);


begin
  for valor in 1..10 loop
    insert into teste_for(numero1) values(valor);
  end loop;
  commit;
end;

select * from teste_for;

-------------------------------------------
--loop para update
begin
  for valor in 1..10 loop
    update teste_for set numero2=numero1*valor
    where numero1=valor;
  end loop;
  commit;
end;

-------------------------------------------
--loop crescente e descrecente
begin
  for x in 1..5 loop
    dbms_output.put_line('contador crescente ' || to_char(x));
  end loop;
  
  for x in reverse 1..5 loop
    dbms_output.put_line('contador decrescente ' || to_char(x));
  end loop;
end;


/*LOOP CONTINUE*/
declare
 p_valor number:=0;

begin
  loop
    dbms_output.put_line('dentro do loop o valor é igual a: ' || to_Char(p_valor));
    p_valor := p_valor + 1;
    continue when p_valor < 5;
    dbms_output.put_line('após a clausula continue, o valor é igual a: ' || to_Char(p_valor));
    exit when p_valor = 5;
  end loop;
  dbms_output.put_line('após o loop o valor é igual a: ' || to_Char(p_valor));
end;
