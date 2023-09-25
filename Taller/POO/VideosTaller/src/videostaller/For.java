/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package videostaller;

/**
 *
 * @author Gonzalo
 */
public class For {
    
    @SuppressWarnings("empty-statement")
    public static void main(String[] args) {
        int i;
    
        for (i = 1; i <= 10; i++)
            System.out.println("");
        
        System.out.println("--------");
        
        for (i = 10; i > 0; i--)
            System.out.println(i);
        
        i = 100;
        while (i > 0) {
            if (i % 2 == 0)
                System.out.println(i + " es par");
            i -= 2;
        }
    }
    
}
