/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manejador;

import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import javax.swing.JTextArea;
import jflex.CounterLexer;
import ventanas.MainFrame;

/**
 *
 * @author luis
 */
public class ManejadorMainFrame {
    
    MainFrame ventana;
    
    public ManejadorMainFrame(MainFrame ventana) {
        this.ventana=ventana;
    }
    
    public void recorridoText(){
        Reader reader = new StringReader(ventana.getInputText().getText());
        CounterLexer lexer = new CounterLexer(reader);
        try {
            int output = lexer.yylex();
            //Lectura del texto de entrada
            while(output!= CounterLexer.YYEOF){
                lexer.yylex();
            }
            //Reinicio de las variables de entrada
            ventana.getOutputText().setText("");
            //Representación datos encontrados en base a las vocales solicitadas
            ventana.getOutputText().append("Palabras con una vocal: "+ lexer.getCountWordsOneVowel()+"\n");
            ventana.getOutputText().append("Palabras con dos vocales: " + lexer.getCountWordsTwoVowels()+"\n");
            ventana.getOutputText().append("Palabras con tres vocales: " + lexer.getCountWordsThreeVowels()+"\n");
            ventana.getOutputText().append("Palabras con cuatro vocales: " + lexer.getCountWordsFourVowels()+"\n");
            ventana.getOutputText().append("Palabras con cinco vocales: " + lexer.getCountWordsFiveVowels()+"\n");
            ventana.getOutputText().append("\n");
            //Representacion datos de valores en base a los números enteros
            for (int i = 0; i < lexer.getWholes().size(); i++) {
                ventana.getOutputText().append(lexer.getWholes().get(i) + "\n");
            }
        } catch (Exception e) {
            System.out.println("Atrape un error y lo maneje de manera correcta :-)" + e);
        }
    }   

    
}
