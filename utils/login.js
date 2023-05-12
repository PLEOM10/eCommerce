
const {userSchema} = require("../models/user");
const bcrypt=require("bcryptjs");

verifyAuth = async (username, password) => {
  
  let user = await userSchema.findOne({
    where:{
        username: username
    } 
  });
  if(user){
    passwordMatch= await bcrypt.compare(password,user.password);
    if(passwordMatch==true){
    return user.id
  }
  else{
    throw new Error("wrong password");
  }
}else{
  throw new Error("not a valid username");
}
};



module.exports = {
  verifyAuth
};
