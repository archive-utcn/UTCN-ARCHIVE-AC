LIBRARY ieee;
USE ieee.std_logic_1164.ALL;  --ieee standard library
USE WORK.voice_pkg.ALL;
--
ENTITY voice IS            -- declares the ENTITY, note entity name is same as FILE name.
	PORT(clk,rst : IN std_logic;
		  key_entered : IN std_logic_vector(3 downto 0);
		  play,rec,erase,save,addr : OUT std_logic
		  );
END voice;
--
ARCHITECTURE flow OF voice IS 
SIGNAL current_state, next_state : state; -- declares state variables to be type state
BEGIN

	PROC1 : PROCESS(current_state,key_entered)
	BEGIN
		play <= '0';      -- Initialize the outputs
		rec <= '0';
		erase <='0';
		save <='0';
		addr <='0';

      CASE current_state IS   -- state selection and assignment
      WHEN main =>
         IF (key_entered = one) THEN
            next_state <= review;
         ELSIF (key_entered = two) THEN
            next_state <= send;
            ELSE
            next_state <= main;
         END IF;
         
          
     WHEN review =>
        IF (key_entered = one) THEN
           next_state <= repeat;
        ELSIF (key_entered = two) THEN
           next_state <= save_msg;
        ELSIF (key_entered = three) THEN
           next_state <= erase_msg;
        ELSIF (key_entered=pound) THEN
           next_state <= main;
        ELSE
           next_state <= review;
        END IF;
        
      WHEN repeat =>
         play<='1';
         next_state<=review;
      
      WHEN save_msg =>
         save<='1';
         next_state <= review;
      
      WHEN erase_msg =>
         erase <= '1';
         next_state <= review;
         
      WHEN send =>
         IF (key_entered = pound) THEN
            next_state <= main;
         ELSE
            next_state <= address;   
         END IF;

      WHEN address =>
         addr <= '1';
         IF (key_entered = pound) THEN
            next_state <= record_msg;
         ELSE
            next_state <= address;
         END IF;

      WHEN record_msg =>
         IF (key_entered = five) THEN
            next_state <= begin_rec;
         ELSE
            next_state <= record_msg;
         END IF;

      WHEN begin_rec =>
         rec <= '1';
         next_state <= message;

      WHEN message =>
         IF (key_entered = pound) THEN
            next_state <= main;
         ELSE
            next_state <= message;
         END IF;

      WHEN OTHERS =>             -- assigns don't care states to main;
            next_state <= main;  
   END CASE;
   END PROCESS;
      
   PROC2 : PROCESS(rst,clk)    -- This process will assign the state bits to register
   BEGIN
      IF (rst = '1') THEN      -- asynchronus reset;     
         current_state <= main;
      ELSIF (clk'EVENT) AND (clk='1') THEN   -- specifies rising edge of clock;
         current_state <= next_state;
      END IF;
   END PROCESS;

END flow;


