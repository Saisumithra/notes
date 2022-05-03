
package debuggingarrays;
import java.util.Scanner;
/**
 *
 * @author Carol Spradling
 */
public class DebuggingArrays {

    public static void main(String[] args) { 
        // TODO code application logic here
        int[] myArray = new int[3];
        DebuggingArrays.getValues(myArray);
        System.out.println( "The largest value is: " + findMax(myArray));
    }
    public static void getValues(int[] array){
        Scanner myScanner = new Scanner(System.in);
        for (int index = 0; index < array.length; index++) {
            System.out.print("Enter a number: ");
            array[index] = myScanner.nextInt();
        }
            
    }
    
    public static int findMax( int[] array){
        int max = array[0];
        for (int index = 0; index < array.length; index++) {
            if (array[index] > max) {
                max = array[index];
            }
        }
        return max;
    }
}
