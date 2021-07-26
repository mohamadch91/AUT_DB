import redis.clients.jedis.Jedis;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        //define jedis data base
        Jedis DB =new Jedis("localhost");
        //getting input
        Scanner scan=new Scanner(System.in);
        String input;
        //boolean to know complete the input
        boolean success=false;
        Scanner sc = null;
        try {
            //read from excel file
            sc = new Scanner(new File("NYSE_20210301.csv"));
        } catch (FileNotFoundException e) {
            //file not found
            e.printStackTrace();
        }
        //read all excel file
        while (sc.hasNext())
        {
           String line=sc.nextLine();
            String [] all=line.split(",");
            DB.set(all[0],all[1]);

        }
        sc.close();
        input=scan.next();
        while (true){
            //check input
            //create input
            if(input.equals("create")){
                String key=scan.next();
                String value=scan.next();
                //if key exist
                String test =DB.get(key);
                //key is in list
                if(test!=null){
                    success=false;
                    System.out.println(success);
                }
                //key is not in list
                else{
                    success=true;
                    DB.set(key,value);
                    System.out.println(success);
                }
            }
            //fetch
            else if(input.equals("fetch")){
                String key=scan.next();
                //check key value exist
                String value=DB.get(key);
                if(value==null){
                    success=false;
                    System.out.println(success);
                }
                else{
                    success=true;
                    System.out.println(success);
                    System.out.println(value);
                }
            }
            else if (input.equals("update")){
                String key=scan.next();
                String value=scan.next();
                //check key exist
                String available =DB.get(key);
               // can use string keys set
                if(available!=null){
                    DB.set(key,value);
                    success=true;
                    System.out.println(success);
                }
                else{
                    success=false;
                    System.out.println(success);
                }
            }
            else if(input.equals("delete")){
                String key=scan.next();
                String available =DB.get(key);
                if(available!=null){
                    DB.del(key);
                    success=true;
                    System.out.println(success);
                }
                else{
                    success=false;
                    System.out.println(success);
                }
            }
            //read next input
            input= scan.next();
            }
        }
    }

