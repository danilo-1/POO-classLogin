/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleAcesso;

import java.util.ArrayList;

/**
 *
 * @author usuário
 */
public class Database {
    private static ArrayList<User> users;
    
    public static ArrayList<User> getUsers() {
        if (users == null) {
            users = new ArrayList<>();
            users.add(
                    new User(
                                "Fulano da Silva",
                                "fulano@domain.com",
                                "1234".hashCode()
                )
            );
              users.add(
                    new User(
                                "Administrador",
                                "admin@domain.com",
                                "1234".hashCode()
                )
            );
        }
        return users;
    }
   
    public static User getUser(String email){
        if(email == null) return null;
        for(User user: getUsers()){
            if(user.getEmail().equals(email)){
                return user;
            }
        }
        return null;
    }
    
    public static void addUsers(User newUser){
        users.add(newUser);
    }
    public static void removeUsers(String email){
         if(email == null) return;
        for(int i=0;i< users.size();i++){
            if(users.get(i).getEmail().equals(email)){
                users.remove(i);
            }
        }
    }
    
    private static ArrayList<Cont> contatos;

    public static ArrayList<Cont> getConts() {
        if (contatos == null) {
            contatos = new ArrayList<>();
            contatos.add(
                    new Cont (
                            "Danilo Novaes",
                            "13912345678",
                            "Dan@domain.com"
                    )
            );
            contatos.add(
                    new Cont (
                            "Maria Debê",
                            "13912335578",
                            "maria@domain.com"
                    )
            );


        }
        return contatos;
    }

     public static void addConts(Cont newCont){
       contatos.add(newCont);
   }
     public static void removeConts( String emails){
          if(emails == null) return;
       for(int i=0;i< contatos.size();i++){
           if(contatos.get(i).getEmails().equals(emails)){
               contatos.remove(i);
           }
       }
     }
}
