--numero de conexões existentes simultaneamente
select count(*) from pg_stat_activity;

--listar todas as conexões ativas e seus respectivos processos relacionados
select * from pg_stat_activity;
