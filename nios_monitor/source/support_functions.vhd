
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package support_functions is
    
    -- functions to facilitate logic vector manipulations
    -- bits - converts integers to suitable type/length logic vectors
    -- divs - divides by shifting (strips off bits from the right)    
    function bits (L : integer; S : natural) return std_logic_vector;
    function bits (L : integer; S : natural) return unsigned;
    function bits (L : integer; S : natural) return signed;

    function divs (L : std_logic_vector; R : integer) return std_logic_vector;
    function divs (L : unsigned; R : integer) return unsigned;
    function divs (L : signed; R : integer) return signed; 
    
    function ceil_log2 (val : natural)
        return natural;

    -- scale functions
    function scale1000 (d : signed)
        return signed;
    function scale1000 (d : unsigned)
        return unsigned;
    function scale231 (d : signed)
        return signed;
    function scale100 (d : signed)
        return signed;
    function scale100 (d : unsigned)
        return unsigned;
    function scale13 (d : signed)
        return signed;
    function scale25 (d : signed)
        return signed;
    function scale400 (d : signed)
        return signed;
    function scale10 (d : signed)
        return signed;
    function scale10 (d : unsigned)
        return unsigned;
    function scale60 (d : unsigned)
        return unsigned;
    function scale41 (d : signed)
        return signed;
    function scale59 (d : signed)
        return signed;
    function scale27 (d : signed)
        return signed;
    function scale131 (d : signed)
        return signed;

    function average (s0, s1, s2 : unsigned(15 downto 0))
        return unsigned;

    -- min/max functions
    function get_min(L, R : integer)
        return integer;
    function get_max(L, R : integer)
        return integer;
    function get_min(L, R : signed)
        return signed;
    function get_max(L, R : signed)
        return signed;
    function get_min(L, R : unsigned)
        return unsigned;
    function get_max(L, R : unsigned)
        return unsigned;
  
    function sl2b (v : std_logic)
        return boolean;
    function b2sl (v : boolean)
        return std_logic;

    function to_umag (v : signed; l : integer := 0)
        return unsigned;
    function to_spos (v : unsigned; l : integer := 0)
        return signed;
    function to_spos (v : std_logic_vector; l : integer := 0)
        return signed;   

    -- reduction functions (and/or)    
    function or_reduce (vec : std_logic_vector)
        return std_logic;
    function or_reduce (vec : boolean_vector)
        return std_logic;
    function or_reduce (vec : std_logic_vector)
        return boolean;
    function or_reduce (vec : boolean_vector)
        return boolean;
    
    function and_reduce (vec : std_logic_vector)
        return std_logic;
    --function and_reduce (vec : boolean_vector)
    --    return std_logic;
    function and_reduce (vec : std_logic_vector)
        return boolean;
    --function and_reduce (vec : boolean_vector)
    --    return boolean;
    
    -- utility sign/polarity/magnitude functions
    -- mag: only working on signed/slv, won't accept unsigned,
    -- since by def unsigned is already a magnitude
    function mag (v : signed)
        return signed;
    function mag (v : std_logic_vector)
        return std_logic_vector;  

    -- sign: return sign bit as std_logic value, won't accept
    -- unsigned, since by def unsigned has no sign bit
    function sign (v : signed)
        return std_logic;
    function sign (v : std_logic_vector)
        return std_logic;

    -- boolean conditional functions, checking if negative or positive,
    -- won't accept unsigned, since by def unsigned is always positive.
    function is_pos (v : signed)
        return boolean;
    function is_pos (v : std_logic_vector)
        return boolean;
    function is_neg (v : signed)
        return boolean;
    function is_neg (v : std_logic_vector)
        return boolean;

    function reverse (v : std_logic_vector)
        return std_logic_vector;

    -- unsigned division
    function uDivResult (a, b : unsigned; s : integer)
        return unsigned;
    function uRemResult (a, b : unsigned)
        return unsigned;

    --function cordic_sqrt (a : unsigned; c : integer; n : integer)
    --    return unsigned;

    function sqrt(d : unsigned)
        return unsigned;

    
end package support_functions;


package body support_functions is

    ------------------------------------------------------------------
    -- implementation of "bits" function
    
    function bits (L : integer; S : natural) return std_logic_vector is
        variable result : std_logic_vector(S-1 downto 0);
    begin
        if (L >= 0) then
            result := std_logic_vector(TO_UNSIGNED(L, S));
        else
            result := std_logic_vector(TO_SIGNED(L, S));
        end if;
        return result;
    end;

    function bits (L : integer; S : natural) return unsigned is
        variable result : unsigned(S-1 downto 0);
    begin
        if (L >= 0) then
            result := TO_UNSIGNED(L, S);
        else
            result := unsigned(TO_SIGNED(L, S));
        end if;
        return result;
    end;

    function bits (L : integer; S : natural) return signed is
        variable result : signed(S-1 downto 0);
    begin
        if (L >= 0) then
            result := signed(TO_UNSIGNED(L, S));
        else
            result := TO_SIGNED(L, S);
        end if;
        return result;
    end;

    ---------------------------------------------------------------------
    -- implmentation of "divs" function

    function divs (L : std_logic_vector; R : integer) return std_logic_vector is
        variable result : std_logic_vector(L'length-R-1 downto 0);
    begin
        result := L(L'length-1 downto R);
        return result;
    end;

    function divs (L : unsigned; R : integer) return unsigned is
        variable result : unsigned(L'length-R-1 downto 0);
    begin
        result := L(L'length-1 downto R);
        return result;
    end;

    function divs (L : signed; R : integer) return signed is
        variable result : signed(L'length-R-1 downto 0);
    begin
        result := L(L'length-1 downto R);
        return result;
    end;   

    ---------------------------------------------------------------
    -- other misc useful functions   

    function ceil_log2 (val : natural)
        return natural is
        variable res_v    : natural;    -- Result
        variable remain_v : natural;    -- Remainder used in iteration
    begin
        res_v    := 0;
        remain_v := val-1;
        while remain_v > 0 loop         -- Iteration for each bit required
            res_v    := res_v + 1;
            remain_v := remain_v / 2;
        end loop;
        return res_v;
    end function ceil_log2;

    ---------------------------------------------------------------
    -- scale functions
    function scale1000 (d : signed)
        return signed is
        variable v : signed(d'length+10-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 9) +
             shift_left(v, 8) +
             shift_left(v, 7) +
             shift_left(v, 6) +
             shift_left(v, 5) +
             shift_left(v, 3);
        return v;
    end function scale1000;

    function scale1000 (d : unsigned)
        return unsigned is
        variable v : unsigned(d'length+10-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 9) +
             shift_left(v, 8) +
             shift_left(v, 7) +
             shift_left(v, 6) +
             shift_left(v, 5) +
             shift_left(v, 3);
        return v;
    end function scale1000;

    function scale231 (d : signed)
        return signed is
        variable v : signed(d'length+8-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 7) +
             shift_left(v, 6) +
             shift_left(v, 5) +
             shift_left(v, 2) +
             shift_left(v, 1) +
             v;
        return v;
    end function scale231;
    
    function scale100 (d : signed)
        return signed is
        variable v : signed(d'length+7-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 6) +
             shift_left(v, 5) +
             shift_left(v, 2);
        return v;
    end function scale100;

    function scale100 (d : unsigned)
        return unsigned is
        variable v : unsigned(d'length+7-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 6) +
             shift_left(v, 5) +
             shift_left(v, 2);
        return v;
    end function scale100;

    function scale13 (d : signed)
        return signed is
        variable v : signed(d'length+4-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 3) +
             shift_left(v, 2) +
             v;
        return v;
    end function scale13;

    function scale25 (d : signed)
        return signed is
        variable v : signed(d'length+5-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 4) +
             shift_left(v, 3) +
             v;
        return v;
    end function scale25;

    function scale400 (d : signed)
        return signed is
        variable v : signed(d'length+9-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 4) +
             shift_left(v, 7) +
             shift_left(v, 8);
        return v;
    end function scale400;

    function scale41 (d : signed)
        return signed is
        variable v : signed(d'length+7-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 5) +
             shift_left(v, 3) +
             v;
        return v;
    end function scale41;

    function scale59 (d : signed)
        return signed is
        variable v : signed(d'length+7-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 5) +
             shift_left(v, 4) +
             shift_left(v, 3) +
             shift_left(v, 1) + 
             v;
        return v;
    end function scale59;

    function scale27 (d : signed)
        return signed is
        variable v : signed(d'length+6-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 4) +
             shift_left(v, 3) +
             shift_left(v, 1) + 
             v;
        return v;
    end function scale27;

    function scale131 (d : signed)
        return signed is
        variable v : signed(d'length+9-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 7) +
             shift_left(v, 1) + 
             v;
        return v;
    end function scale131;
    
    function scale10 (d : signed)
        return signed is
        variable v : signed(d'length+4-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 3) +
             shift_left(v, 1);
        return v;
    end function scale10;

    function scale10 (d : unsigned)
        return unsigned is
        variable v : unsigned(d'length+4-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 3) +
             shift_left(v, 1);
        return v;
    end function scale10;

    function scale60 (d : unsigned)
        return unsigned is
        variable v : unsigned(d'length+6-1 downto 0);
    begin
        v := resize(d, v'length);
        v := shift_left(v, 5) +
             shift_left(v, 4) +
             shift_left(v, 3) +
             shift_left(v, 2);
        return v;
    end function scale60;

    ----------------------------------
    -- Average compute
    function average (s0, s1, s2 : unsigned(15 downto 0))
        return unsigned is
        variable s : unsigned(17 downto 0);
        variable a : unsigned(15 downto 0);
    begin
        -- AVG ~= (A + B + C) * 0.332
        s := resize(s0, 18) + resize(s1, 18) + resize(s2, 18);
        a := resize(shift_right(s * to_unsigned(85, 8), 8), 16);
        return a;
    end function average;

    -----------------------------------------------------------
    -- Min/Max functions
    function get_min(L, R : integer)
        return integer is
    begin
        if L < R then
            return L;
        else
            return R;
        end if;
    end function get_min;

    function get_max(L, R : integer)
        return integer is
    begin
        if L > R then
            return L;
        else
            return R;
        end if;
    end function get_max;

    function get_min(L, R : signed)
        return signed is
    begin
        if L < R then
            return L;
        else
            return R;
        end if;
    end function get_min;

    function get_max(L, R : signed)
        return signed is
    begin
        if L > R then
            return L;
        else
            return R;
        end if;
    end function get_max;
	
    function get_min(L, R : unsigned)
        return unsigned is
    begin
        if L < R then
            return L;
        else
            return R;
        end if;
    end function get_min;

    function get_max(L, R : unsigned)
        return unsigned is
    begin
        if L > R then
            return L;
        else
            return R;
        end if;
    end function get_max;

    ------------------------------------------------------------
    -- conversion functions
    function to_umag (v : signed; l : integer := 0)
        return unsigned is
    begin
        if l = 0 then
            return unsigned(abs(v));
        else
            return resize(unsigned(abs(v)), l);
        end if;        
    end function to_umag;

    function to_spos (v : unsigned; l : integer := 0)
        return signed is
    begin
        if l = 0 then
            return signed('0' & v);
        else
            return resize(signed('0' & v), l);
        end if;
    end function to_spos;

    function to_spos (v : std_logic_vector; l : integer := 0)
        return signed is
    begin
        if l = 0 then
            return signed('0' & v);
        else
            return resize(signed('0' & v), l);
        end if;
    end function to_spos;
    
    -----------------------------------------------------------------
    -- reduction functions
    function or_reduce (vec : std_logic_vector)
        return std_logic is
        constant all_zeros : std_logic_vector(vec'range) := (others => '0');
    begin
        if vec = all_zeros then
            return '0';
        else
            return '1';
        end if;
    end function or_reduce;

    function or_reduce (vec : boolean_vector)
        return std_logic is
        constant all_false : boolean_vector(vec'range) := (others => false);
    begin
        if vec = all_false then
            return '0';
        else
            return '1';
        end if;
    end function or_reduce;

    function or_reduce (vec : std_logic_vector)
        return boolean is
        constant all_zeros : std_logic_vector(vec'range) := (others => '0');
    begin
        if vec = all_zeros then
            return false;
        else
            return true;
        end if;
    end function or_reduce;

    function or_reduce (vec : boolean_vector)
        return boolean is
        constant all_false : boolean_vector(vec'range) := (others => false);
    begin
        if vec = all_false then
            return false;
        else
            return true;
        end if;
    end function or_reduce;

    function and_reduce (vec : std_logic_vector)
        return std_logic is
        constant all_ones : std_logic_vector(vec'range) := (others => '1');
    begin
        if vec = all_ones then
            return '1';
        else
            return '0';
        end if;
    end function and_reduce;

    --function and_reduce (vec : boolean_vector)
    --    return std_logic is
    --    constant all_true : boolean_vector(vec'range) := (others => true);
    --begin
    --    if vec = all_true then
    --        return '1';
    --    else
    --        return '0';
    --    end if;
    --end function and_reduce;

    function and_reduce (vec : std_logic_vector)
        return boolean is
        constant all_ones : std_logic_vector(vec'range) := (others => '1');
    begin
        if vec = all_ones then
            return true;
        else
            return false;
        end if;
    end function and_reduce;

    --function and_reduce (vec : boolean_vector)
    --    return boolean is
    --    constant all_true : boolean_vector(vec'range) := (others => true);
    --begin
    --    if vec = all_true then
    --        return true;
    --    else
    --        return false;
    --    end if;
    --end function and_reduce;

    function sl2b (v : std_logic)
        return boolean is
    begin
        if v = '1' then
            return true;
        else
            return false;
        end if;
    end function sl2b;

    function b2sl (v : boolean)
        return std_logic is
    begin
        if v then
            return '1';
        else
            return '0';
        end if;
    end function b2sl;

    -----------------------------------------------------------------
    -- sign/polarity/magnitude functions  

    function mag (v : signed)
        return signed is
        variable tmp : signed(v'length-1 downto 0);
        variable sb  : std_logic;
    begin
        sb := v(v'left);
        for i in v'range loop
            tmp(i) := sb xor v(i);
        end loop;
        return tmp;
    end function mag;

    function mag (v : std_logic_vector)
        return std_logic_vector is
        variable tmp : std_logic_vector(v'length-1 downto 0);
        variable sb  : std_logic;
    begin
        sb := v(v'left);
        for i in v'range loop
            tmp(i) := sb xor v(i);
        end loop;
        return tmp;
    end function mag;
    
    -----------------------------------------------------------------
    -- sign/polarity/magnitude functions    

    function sign (v : signed)
        return std_logic is
    begin
        return v(v'left);
    end function sign;

    function sign (v : std_logic_vector)
        return std_logic is
    begin
        return v(v'left);
    end function sign;

    --------------------------

    function is_pos (v : signed)
        return boolean is
    begin
        if v(v'left) = '0' then
            return true;
        else
            return false;
        end if;
    end function is_pos;

    function is_pos (v : std_logic_vector)
        return boolean is
    begin
        if v(v'left) = '0' then
            return true;
        else
            return false;
        end if;
    end function is_pos;

    function is_neg (v : signed)
        return boolean is
    begin
        if v(v'left) = '1' then
            return true;
        else
            return false;
        end if;
    end function is_neg;

    function is_neg (v : std_logic_vector)
        return boolean is
    begin
        if v(v'left) = '1' then
            return true;
        else
            return false;
        end if;
    end function is_neg;

    --------------------------------------
    
    -- unsigned division
    -- performs unsigned division
    function uDivResult (a, b : unsigned; s : integer)
        return unsigned is
        variable temp1 : unsigned(a'length+s-1 downto 0);
        variable temp2 : unsigned(b'length+s-1 downto 0);
        variable y     : unsigned(s-1 downto 0);
    begin
        -- a / b = q        
        -- if s = 0: a > b, a/b=q is multiple of 1
        -- if s > 0: a < b, a/b=q is fraction of 1      
        temp1 := shift_left(resize(a, a'length+s), s);
        temp2 := resize(b, b'length+s);
        -- perform compare and build quotient vector
        for i in y'range loop
            if (temp1 >= shift_left(temp2, i)) then
                y(i)  := '1';
                temp1 := temp1 - shift_left(temp2, i);
            else
                y(i) := '0';
            end if;
        end loop;
        return y;
    end function uDivResult;

    -- performs unsigned division returning remainder
    function uRemResult (a, b : unsigned)
        return unsigned is
        variable temp1 : unsigned(a'length-1 downto 0);
        variable temp2 : unsigned(a'length-1 downto 0);
        variable a_l : integer range 0 to 64;
        variable b_l : integer range 0 to 64;        
    begin
        a_l := a'length;
        b_l := b'length;
        -- a / b = q, return remainder
        temp1 := a;
        temp2 := resize(b, a_l);
        -- perform compare and build quotient vector
        for i in (a_l-b_l) downto 0 loop
            if (temp1 >= shift_left(temp2, i)) then
                temp1 := temp1 - shift_left(temp2, i);
            end if;
        end loop;
        return temp1(b_l-1 downto 0);
    end function uRemResult;

    ----------------------------------------------------------------

    -- CORDIC square root kernel algorithm
    --function cordic_sqrt (a : unsigned; c : integer; n : integer)
    --    return unsigned is
    --    variable xtmp : unsigned(a'range);
    --    variable ytmp : unsigned(a'range);
    --    variable x  : unsigned(a'range);
    --    variable y  : unsigned(a'range);
    --    variable k  : integer := 4;
    --begin
    --    x := a + c;
    --    y := a - c;
    --    for i in 1 to n loop
    --        xtmp := shift_right(x, i);      -- multiply by 2^-i
    --        ytmp := shift_right(b_b, i);      -- multiply by 2^-i
    --        if y < 0 then
    --            x := x + ytmp;
    --            y := y + xtmp;
    --        else
    --            x := x - ytmp;
    --            y := y - xtmp;
    --        end if;
    --        if i = k then
    --            xtmp := shift_right(x, i);  -- multiply by 2^-i
    --            ytmp := shift_right(y, i);  -- multiply by 2^-i
    --            if y < 0 then
    --                x := x + ytmp;
    --                y := y + xtmp;
    --            else
    --                x := x - ytmp;
    --                y := y - xtmp;
    --            end if;
    --            k := 3*k + 1;
    --        end if;
    --    end loop;
    --    return;
    --end function cordic_sqrt;

    function sqrt(d : unsigned) return unsigned is
        variable a              : unsigned(31 downto 0) := d;                --original input.
        variable q              : unsigned(15 downto 0) := (others => '0');  --result.
        variable left, right, r : unsigned(17 downto 0) := (others => '0');  --input to adder/sub.r-remainder.
        variable i              : integer               := 0;
    begin
        for i in 0 to 15 loop
            right(0)           := '1';
            right(1)           := r(17);
            right(17 downto 2) := q;
            left(1 downto 0)   := a(31 downto 30);
            left(17 downto 2)  := r(15 downto 0);
            a(31 downto 2)     := a(29 downto 0);  --shifting by 2 bit.
            if (r(17) = '1') then
                r := left + right;
            else
                r := left - right;
            end if;
            q(15 downto 1) := q(14 downto 0);
            q(0)           := not r(17);
        end loop;
        return q;
    end function sqrt;

    ---------------------------------------------------------------

    function reverse (v : std_logic_vector)
        return std_logic_vector is
        variable u : std_logic_vector(v'reverse_range);
    begin
        for i in v'range loop
            u(i) := v(i);
        end loop;
        return u;
    end function reverse;


end package body;



