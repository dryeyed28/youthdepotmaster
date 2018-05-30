package vo;

public class Admin {
   private String admin_id;
   private String admin_pwd;
   private String admin_name;
   public Admin() {
      super();
   }
   public Admin(String admin_id, String admin_pwd, String admin_name) {
      super();
      this.admin_id = admin_id;
      this.admin_pwd = admin_pwd;
      this.admin_name = admin_name;
   }
   public String getAdmin_id() {
      return admin_id;
   }
   public void setAdmin_id(String admin_id) {
      this.admin_id = admin_id;
   }
   public String getAdmin_pwd() {
      return admin_pwd;
   }
   public void setAdmin_pwd(String admin_pwd) {
      this.admin_pwd = admin_pwd;
   }
   public String getAdmin_name() {
      return admin_name;
   }
   public void setAdmin_name(String admin_name) {
      this.admin_name = admin_name;
   }
      
}