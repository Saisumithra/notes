package testinputdriver;

/**
 *
 * @author C_SPRAD
 */

import java.util.Scanner;

public class TestInputDriver {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
       Scanner keyboardInput = new Scanner (System.in);
       int intNumber;
       double doubleNumber;
       String shortString;
       
       System.out.print("Enter an integer: ");
       intNumber = keyboardInput.nextInt();
       System.out.println( "This is my intNumber: " + intNumber);
       
       System.out.print( "Enter a double number: ");
       doubleNumber = keyboardInput.nextDouble();
       System.out.println("This is my double number: " + doubleNumber);
       
       System.out.print("Enter a string: ");
       shortString = keyboardInput.nextLine();
       System.out.println("This is my string" + shortString);
            
    }
    
}
