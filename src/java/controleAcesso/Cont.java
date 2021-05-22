/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controleAcesso;

/**
 *
 * @author usuário
 */
public class Cont {
    private String name;
    private String num;
    private String emails;

    public Cont(String name, String num, String emails) {
        this.name = name;
        this.num = num;
        this.emails = emails;
    }

    public String getEmails() {
        return emails;
    }

    public void setEmail(String email) {
        this.emails = emails;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }
    
    
}
