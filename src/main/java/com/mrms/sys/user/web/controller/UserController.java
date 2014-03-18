package com.mrms.sys.user.web.controller;

import com.mrms.common.restful.ResultResponseObject;
import com.mrms.sys.user.domain.User;
import com.mrms.sys.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("sys/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping("index")
    public ModelAndView index() {
        return new ModelAndView("sys/user/index");
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    @ResponseBody
    public List<User> list() {
        return userService.findAll();
    }

    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public ResultResponseObject create(@RequestBody User user) {
        String result = userService.create(user);
        ResultResponseObject returnObj = new ResultResponseObject();

        if (result.equals("0")) {
            returnObj.setStatus(HttpStatus.OK);
            returnObj.setCode(result);
        } else if (result.equals("1")) {
            returnObj.setStatus(HttpStatus.NOT_ACCEPTABLE);
            returnObj.setCode(result);
            returnObj.setMsg("账号已经存在！");
        } else if (result.equals("2")) {
            returnObj.setStatus(HttpStatus.NOT_ACCEPTABLE);
            returnObj.setCode(result);
            returnObj.setMsg("邮箱已经存在！");

        }
        return returnObj;
    }


    @RequestMapping(value = "{id}", method = RequestMethod.PUT)
    @ResponseBody
    public HttpStatus update(@PathVariable String id, @RequestBody User user) {
        user.setId(id);
        userService.update(user);
        return HttpStatus.OK;
    }

    @RequestMapping(value = "{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public HttpStatus delete(@PathVariable("id") String id) {
        if (id != null && id.contains(",")) {
            return deleteBatch(id);

        }
        userService.delete(id);
        return HttpStatus.OK;
    }

    private HttpStatus deleteBatch(String ids) {
        userService.deleteBatch(ids);
        return HttpStatus.OK;
    }
}
