/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package model;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Zakina
 */
public class GroupeIT {
    
    public GroupeIT() {
    }

    @org.junit.BeforeClass
    public static void setUpClass() throws Exception {
    }

    @org.junit.AfterClass
    public static void tearDownClass() throws Exception {
    }

    @org.junit.Before
    public void setUp() throws Exception {
    }

    @org.junit.After
    public void tearDown() throws Exception {
    }
    
   
    /**
     * Test of getId method, of class Groupe.
     */
    @org.junit.Test
    public void testGetId() {
        System.out.println("getId");
        Groupe instance = new Groupe();
        int expResult = 1;
        int result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class Groupe.
     */
    @org.junit.Test
    public void testSetId() {
        System.out.println("setId");
        int id = 1;
        Groupe instance = new Groupe();
        instance.setId(id);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getNom method, of class Groupe.
     */
    @org.junit.Test
    public void testGetNom() {
        System.out.println("getNom");
        Groupe instance = new Groupe();
        instance.setNom("Loir");
        String expResult = "Loir";
        String result = instance.getNom();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setNom method, of class Groupe.
     */
    @org.junit.Test
    public void testSetNom() {
        System.out.println("setNom");
        String nom = "Loir";
        Groupe instance = new Groupe();
        instance.setNom(nom);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getDateCreation method, of class Groupe.
     */
    @org.junit.Test
    public void testGetDateCreation() {
        System.out.println("getDateCreation");
        Groupe instance = new Groupe();
        instance.setDateCreation("2002-10-02");
        String expResult = "2002-10-02";
        String result = instance.getDateCreation();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of setDateCreation method, of class Groupe.
     */
    @org.junit.Test
    public void testSetDateCreation() {
        System.out.println("setDateCreation");
        String dateCreation = "2002-10-02";
        Groupe instance = new Groupe();
        instance.setDateCreation(dateCreation);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getGenre method, of class Groupe.
     */
    @org.junit.Test
    public void testGetGenre() {
        System.out.println("getGenre");
        Groupe instance = new Groupe();
        Genre expResult = null;
        Genre result = instance.getGenre();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setGenre method, of class Groupe.
     */
    //@org.junit.Test
    /*public void testSetGenre() {
        System.out.println("setGenre");
        Genre genre = null;
        Groupe instance = new Groupe();
        instance.setGenre(genre);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }*/
    
}
