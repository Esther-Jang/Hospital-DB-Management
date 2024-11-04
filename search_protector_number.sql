create or replace function search_protector_number(s_p_id patient.p_id%type)
return number
is
    protector_n number:=0;
begin
    select count(*) into protector_n from protector where p_id=s_p_id;
    return protector_n;
end;