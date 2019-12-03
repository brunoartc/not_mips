-- Design de Computadores
-- file: mips.vhd
-- date: 18/10/2019

library ieee;
use ieee.std_logic_1164.all;
use work.constantesMIPS.all;

entity mips is
	port
    (
        clk			            : IN  STD_LOGIC;
		  oo            : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
		  saida_ula : out std_logic_vector(32-1 downto 0)

    );
end entity;

architecture estrutural of mips is

	-- Declaração de sinais auxiliares
    signal pontosDeControle     : STD_LOGIC_VECTOR(CONTROLWORD_WIDTH-1 DOWNTO 0);
    signal instrucao            : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
    signal ALUop                : STD_LOGIC_VECTOR(ALU_OP_WIDTH-1 DOWNTO 0);
    signal ALUctr               : STD_LOGIC_VECTOR(CTRL_ALU_WIDTH-1 DOWNTO 0);

    -- Sinal de clock auxiliar para simulação
    -- signal clk  : STD_LOGIC;

    alias opcode : std_logic_vector(OPCODE_WIDTH-1 downto 0) is instrucao(31 DOWNTO 26);
	 alias funct     : std_logic_vector(FUNCT_WIDTH-1 downto 0) is  instrucao(5 DOWNTO 0);
begin
oo <= instrucao;

    -- CLOCK generator auxiliar para simulação
    -- CG : entity work.clock_generator port map (clk	=> clk);
	--saida_ula <= saida_ula_out;
    FD : entity work.fluxo_dados 
	port map
	(
        clk	                    => clk,
        pontosDeControle        => pontosDeControle,
        instrucao               => instrucao,
		  saida_ula_out 				  => saida_ula
    );

    UC : entity work.uc 
	port map
	(
        opcode              	=> opcode,
		  funct						=> funct,
        pontosDeControle    	=> pontosDeControle
    );
	 
		
		  
		  

end architecture;
