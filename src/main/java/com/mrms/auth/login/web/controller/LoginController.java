package com.mrms.auth.login.web.controller;

import com.mrms.common.util.MD5Util;
import com.mrms.sys.user.domain.User;
import com.mrms.sys.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("auth/login")
public class LoginController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value="index", method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("auth/login/index", "user", new User());
    }

    @RequestMapping(value="login", method = RequestMethod.POST)
    public ModelAndView login(User aUser, BindingResult result){
        String account = aUser.getAccount();
        String pwd = aUser.getPwd();
        if(pwd == null || account == null){
            result.addError(new ObjectError("account","用户名和密码不能为空."));
            return new ModelAndView("auth/login/index", "model", aUser);
        }
        User user = userService.findByAccount(aUser.getAccount());
        if(user == null){
            result.addError(new ObjectError("account","此用户不存在."));
            return new ModelAndView("auth/login/index", "model", aUser);
        }
        String inputPwd = MD5Util.toMD5(pwd);
        if(!user.getPwd().equals(inputPwd)){
            result.addError(new ObjectError("account","密码和用户名不匹配."));
            return new ModelAndView("auth/login/index", "model", aUser);
        }

        return new ModelAndView("redirect:index");
    }
}
