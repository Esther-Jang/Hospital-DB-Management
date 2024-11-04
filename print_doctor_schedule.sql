create or replace procedure print_doctor_schedule(p_h_name doctor.h_name%type)
is
    cursor doc_c is
    select d_dayoff, d_name from doctor
    where h_name=p_h_name;
    week char(21):='월화수목금토일';
    i number :=0;
begin
    dbms_output.put_line(p_h_name||' - 의사 근무일정');
    for i in 1..7 loop
        dbms_output.put('['||substr(week, i, 1)||']');
        for d_dayoff_list in doc_c loop
            if (substr(week, i, 1)||'요일')!=(d_dayoff_list.d_dayoff) then
                dbms_output.put(d_dayoff_list.d_name||' ');
            end if;
        end loop;
        dbms_output.put_line('');
    end loop;
end;