package com.mrms.conf.summary.web.controller;

import com.mrms.conf.summary.domain.ConfSummary;
import com.mrms.conf.summary.service.IConfSummaryService;
import com.mrms.conf.summary.vo.ConfSummaryQueryObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("conf/summary")
public class ConfSummaryController {

    @Autowired
    private IConfSummaryService summaryService;

    @RequestMapping("index")
    public ModelAndView index(){
        return new ModelAndView("conf/summay/index");
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public HttpStatus create(@RequestBody ConfSummary summary){
        summaryService.create(summary);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}", method= RequestMethod.DELETE)
    @ResponseBody
    public HttpStatus delete(@PathVariable String id){
        summaryService.delete(id);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}", method= RequestMethod.PUT)
    @ResponseBody
    public HttpStatus update(@PathVariable String id, @RequestBody ConfSummary summary){
        summary.setId(id);
        summaryService.update(summary);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}", method= RequestMethod.GET)
    @ResponseBody
    public ConfSummary get(@PathVariable String id){
        return summaryService.get(id);

    }

    @RequestMapping(value="query",method = RequestMethod.GET)
    public List<ConfSummary> query(@RequestBody(required = false) ConfSummaryQueryObject queryObject){
        if(queryObject == null){
            return summaryService.list();
        }

        return null;
    }
}
