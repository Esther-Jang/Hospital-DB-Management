create or replace function search_protector_name(s_p_id patient.p_id%type)
return number
is
    protector_name protector.p_name%type;
begin
    select p_name into protector_name from protector where p_id=s_p_id;
    return protector_name;
end;