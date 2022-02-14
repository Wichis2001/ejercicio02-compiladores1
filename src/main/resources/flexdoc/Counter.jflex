/*primer seccion: codigo de usuario*/
package jflex;
import java.util.ArrayList;

%%

/*segunda seccion: configuracion*/
%class CounterLexer
%unicode
%line
%column
%int
%public

 /* Declaracion de regex para los tokens */
 WhiteSpace = [\r|\n|\r\n] | [ |\t\f]
 Vowels= [(a|A)|(e|E)|(i|I)|(o|O)|(u|U)]
 Numbers = [0-9]

%{
    private int countVowels = 0;
    private int countWordsOneVowel = 0;
    private int countWordsTwoVowels = 0;
    private int countWordsThreeVowels = 0;
    private int countWordsFourVowels = 0;
    private int countWordsFiveVowels = 0;
    private ArrayList<String> wholes = new ArrayList<>();

    private void increaseCountVowels() {
        countVowels++;
    }

    private void increaseCountWordsOneVowel() {
        countWordsOneVowel++;
    }

    private void increaseCountWordsTwoVowels() {
        countWordsTwoVowels++;
    }

    private void increaseCountWordsThreeVowels() {
        countWordsThreeVowels++;
    }

    private void increaseCountWordsFourVowels() {
        countWordsFourVowels++;
    }

    private void increaseCountWordsFiveVowels() {
        countWordsFiveVowels++;
    }

    private void checkVowels(){
        if(getCountVowels()>0){
            switch (getCountVowels()){

                case 1:{

                    increaseCountWordsOneVowel();
                    setCountVowels(0);
                    break;

                }       

                case 2:{

                    increaseCountWordsTwoVowels();
                    setCountVowels(0);
                    break;

                }
                            
                case 3:{
                            
                    increaseCountWordsThreeVowels();
                    setCountVowels(0);
                    break;
                            
                }
                case 4:{
                            
                    increaseCountWordsFourVowels();
                    setCountVowels(0);
                    break;
            
                }
                case 5:{
                            
                    increaseCountWordsFiveVowels();
                    setCountVowels(0);
                    break;
                            
                }
            }   
        }     
    }

    public int getCountVowels() {
        return countVowels;
    }

    public int getCountWordsOneVowel() {
        return countWordsOneVowel;
    }

    public int getCountWordsTwoVowels() {
        return countWordsTwoVowels;
    }

    public int getCountWordsThreeVowels() {
        return countWordsThreeVowels;
    }

    public int getCountWordsFourVowels() {
        return countWordsFourVowels;
    }

    public int getCountWordsFiveVowels() {
        return countWordsFiveVowels;
    }
    
    public void setCountVowels(int countVowels){
        this.countVowels = countVowels;
    }

    private void writeUbication(String valor){
        int linea= yyline + 1;
        int columna= yycolumn+1;
        wholes.add("El número entero " + valor + " esta en la linea " + linea + ", y en la columna " + columna);
    }     

    public ArrayList<String> getWholes() {
        return wholes;
    }  

    public void returnWords(){
        System.out.println("Palabras con una vocal: " + getCountWordsOneVowel());
        System.out.println("Palabras con dos vocales: " + getCountWordsTwoVowels());
        System.out.println("Palabras con tres vocales: " + getCountWordsThreeVowels());
        System.out.println("Palabras con cuatro vocales: " + getCountWordsFourVowels());
        System.out.println("Palabras con cinco vocales: " + getCountWordsFiveVowels());
    } 
%}


%eof{
    checkVowels();
    returnWords();
%eof}

%%


/*tercer seccion: reglase lexicas*/

<YYINITIAL>{
    {Vowels} { increaseCountVowels(); }
    {WhiteSpace} {checkVowels();}
    {Numbers}   {writeUbication(yytext());}
}


[^] {}