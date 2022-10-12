/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package model;

import java.util.ArrayList;
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
public class GenreIT {
    
    public GenreIT() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Genre.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        Genre instance = new Genre();
        int expResult = 0;
        int result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class Genre.
     */
    @Test
    public void testSetId() {
        System.out.println("setId");
        int id = 0;
        Genre instance = new Genre();
        instance.setId(id);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getLibelle method, of class Genre.
     */
    @Test
    public void testGetLibelle() {
        System.out.println("getLibelle");
        Genre instance = new Genre();
        String expResult = "";
        String result = instance.getLibelle();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setLibelle method, of class Genre.
     */
    @Test
    public void testSetLibelle() {
        System.out.println("setLibelle");
        String libelle = "";
        Genre instance = new Genre();
        instance.setLibelle(libelle);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getLesGroupes method, of class Genre.
     */
    @Test
    public void testGetLesGroupes() {
        System.out.println("getLesGroupes");
        Genre instance = new Genre();
        ArrayList<Groupe> expResult = null;
        ArrayList<Groupe> result = instance.getLesGroupes();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setLesGroupes method, of class Genre.
     */
    @Test
    public void testSetLesGroupes() {
        System.out.println("setLesGroupes");
        ArrayList<Groupe> lesGroupes = null;
        Genre instance = new Genre();
        instance.setLesGroupes(lesGroupes);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addUngroupe method, of class Genre.
     */
    @Test
    public void testAddUngroupe() {
        System.out.println("addUngroupe");
        Groupe unGroupe = null;
        Genre instance = new Genre();
        instance.addUngroupe(unGroupe);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
