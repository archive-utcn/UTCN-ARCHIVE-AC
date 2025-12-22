public class MainClass {
    public static void main (String [] args) throws Exception{
        Tren tCalatori = new Tren(15);
        Tren tMarfa = new Tren(35);

        try{
            tCalatori.addVagon(new VagonCalatori("23143",120));
            tCalatori.addVagon(new VagonCalatori("87453",110));            
            tCalatori.addVagon(new VagonMarfa("45896",5468.5f,45.8f));
            tCalatori.addVagon(new VagonCalatori("34587",95));                
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }

        tMarfa.addVagon(new VagonMarfa("24896",5786,54));
        tMarfa.addVagon(new VagonMarfa("89942",4549,48));        
        tMarfa.addVagon(new VagonMarfa("14234",5667,53));        
        
        System.out.println(tCalatori);
        System.out.println(tMarfa);        
    }
}
