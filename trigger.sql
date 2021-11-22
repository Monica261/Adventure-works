/*TRIGGERS - gatilhos*/
use db_Biblioteca

create table tblsaldos(
	produto varchar(10),
	saldo_inicial numeric(10),
	saldo_final numeric(10),
	data_ult_mov datetime
)

drop table tbsaldos

insert into tblsaldos values('celular', 0, 100.00, getdate())

create table tblVendas(
	ID_vendas int,
	produto varchar(20),
	quantidade int,
	data datetime
)

drop table tbVendas

--sequence
create sequence seq_tbVendas
as numeric
start with 1
increment by 1

drop sequence seq_tbVendas

create table tblhistoricoVendas(
	produto varchar(20),
	quantidade int,
	data_venda datetime
)

drop table tblhistoricoVendas

--trigger ajuste de saldo - após feita a venda na tabela tbVendas
create trigger trg_ajusteSaldos
on tblVendas
for insert
as
begin
	declare @quantidade int,
			@data datetime,
			@produto varchar(20)
	select @data = data, @quantidade = quantidade, @produto = produto from inserted

	update tblsaldos
		set saldo_final = saldo_final - @quantidade,
			data_ult_mov = @data
		where produto = @produto

	insert into tblhistoricoVendas(produto, quantidade, data_venda)
	values(@produto, @quantidade, @data)
end;

drop trigger trg_ajusteSaldos


--

insert into tblVendas(produto, quantidade, data)
values('TV', 30, getdate());


select * from tblVendas
select * from tblsaldos
select * from tblhistoricoVendas

delete from tblVendas
where produto = 'celular'