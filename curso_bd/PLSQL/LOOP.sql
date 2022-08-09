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

-------------------------------------------

declare
  valor number := 0;
begin
  loop
    dbms_output.put_line('Valor apresentado no interior do loop é igual a: ' || to_char(valor));
    valor := valor + 1;
    if valor < 15 then
      continue;
    end if;
    dbms_output.put_line('No interior do loop, após a clausula continue, o valor é igual a:  ' || to_char(valor));
    exit when valor > 15;
  end loop;
    dbms_output.put_line('Após o loop o valor é de: ' || to_char(valor));
end;
-------------------------------------------

select cp.cd_con_pag, cp.vl_bruto_conta from dbamv.con_pag cp order by cd_con_pag desc

--caso real
declare
  valor_cheio number;
begin
  select cp.vl_bruto_conta into valor_cheio from dbamv.con_pag cp where cp.cd_con_pag = 162736;
  loop
      dbms_output.put_line('Valor apresentado no interior do loop é igual a: ' || to_char(valor_cheio));
      if valor_cheio > 90740 then
        dbms_output.put_line('Valor apresentado alto: ' || to_char(valor_cheio));
        continue;
      end if;
      exit when valor_cheio between 10000 and 15000;
  end loop;
end;
