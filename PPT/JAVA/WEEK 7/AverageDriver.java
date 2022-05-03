/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package averagedriver;
import java.util.Scanner;
/**
 *
 * @author Carol Spradling
 */
public class AverageDriver {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
         //declare variables
          int number;

          //declare and intialize total to 0
          int total = 0;

          //declare and intialize count to 0
          int count = 0;

          //declare and intialize average
          double average = 0;

          //Instantiate a Scanner object 
          Scanner keyboardInput = new Scanner( System.in ); 

          //Priming read
          System.out.print( "Enter a number or 0 to quit: " );
          number = keyboardInput.nextInt();

          //Sentinel loop with condition of 0 to exit
          while ( number != 0 )
          {
               //add number to total
               total += number;

               //add 1 to count
               count++;

               //Gather more input
               System.out.print( "Enter a number or 0 to quit: " );
               number = keyboardInput.nextInt();
          }

          //calculate the average
          average = (double) total / count;

          if (average > 0)
              System.out.println( "The average of the numbers is " + average );
          else
              System.out.println("No numbers were entered");
    }
    
}
