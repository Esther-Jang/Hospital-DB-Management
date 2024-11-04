create or replace procedure print_nurse_schedule(p_h_name nurse.h_name%type)
is
    cursor nur_c is
    select worktime, n_name from nurse
    where h_name=p_h_name;
    i number :=0;
begin
    dbms_output.put_line(p_h_name||' - 간호사 근무일정');
    
    dbms_output.put('[Day] ');
    for n_s_list in nur_c loop
        if 'Day'=(n_s_list.worktime) then
            dbms_output.put(n_s_list.n_name||' ');
        end if;
    end loop;
    dbms_output.put_line('');
        
    dbms_output.put('[Night] ');
    for n_s_list in nur_c loop
        if 'Night'=(n_s_list.worktime) then
            dbms_output.put(n_s_list.n_name||' ');
        end if;
    end loop;
    dbms_output.put_line('');
end;