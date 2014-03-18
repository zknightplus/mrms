package com.mrms.conf.matter.web.controller;

import com.mrms.conf.matter.doamin.Matter;
import com.mrms.conf.matter.service.IMatterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("conf/matter")
public class MatterController {

    @Autowired
    private IMatterService matterService;

    @RequestMapping("index")
    public ModelAndView index(){
        return new ModelAndView("conf/matter/index");
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public HttpStatus create(@RequestBody Matter matter){
        matterService.create(matter);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}", method= RequestMethod.PUT)
    @ResponseBody
    public HttpStatus create(@PathVariable String id, @RequestBody Matter matter){
        matterService.update(matter);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}", method= RequestMethod.DELETE)
    @ResponseBody
    public HttpStatus delete(@PathVariable String id){
        matterService.delete(id);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}", method= RequestMethod.GET)
    @ResponseBody
    public Matter get(@PathVariable String id){
        return matterService.get(id);
    }

    @RequestMapping(value="query", method= RequestMethod.GET)
    @ResponseBody
    public List<Matter> query(){
        return matterService.list();
    }

}
