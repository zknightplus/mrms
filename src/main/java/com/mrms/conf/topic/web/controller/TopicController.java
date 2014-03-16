package com.mrms.conf.topic.web.controller;

import com.mrms.conf.topic.domain.Topic;
import com.mrms.conf.topic.service.ITopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("conf/topic")
public class TopicController {

    @Autowired
    private ITopicService topicService;

    @RequestMapping("index")
    public ModelAndView index(){
        return new ModelAndView("conf/topic/index");
    }

    @RequestMapping(method= RequestMethod.POST)
    @ResponseBody
    public HttpStatus create(@RequestBody Topic topic){
        topicService.create(topic);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}",method= RequestMethod.DELETE)
    @ResponseBody
    public HttpStatus delete(@PathVariable String id){
        topicService.delete(id);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}",method= RequestMethod.PUT)
    @ResponseBody
    public HttpStatus update(@PathVariable String id, @RequestBody Topic topic){
        topic.setId(id);
        topicService.update(topic);

        return HttpStatus.OK;
    }

    @RequestMapping(value="{id}")
    @ResponseBody
    public Topic get(@PathVariable String id){

        return topicService.get(id);
    }

    @RequestMapping(value="query", method = RequestMethod.GET)
    @ResponseBody
    public List<Topic> query(){
        return topicService.list();
    }

}
