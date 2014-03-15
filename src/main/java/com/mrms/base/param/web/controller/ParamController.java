package com.mrms.base.param.web.controller;

import com.mrms.base.param.domain.ParamCategory;
import com.mrms.base.param.domain.ParamItem;
import com.mrms.base.param.service.IParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("base/param")
public class ParamController {

    @Autowired
    private IParamService paramService;

    @RequestMapping("index")
    public ModelAndView index(){
        return new ModelAndView("base/param/index");
    }

    @RequestMapping(value="category/list", method=RequestMethod.GET)
    @ResponseBody
    public List<ParamCategory> listCategory(){
        return paramService.findAllCategory();
    }

    @RequestMapping(value="item/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    public HttpStatus deleteItem(@PathVariable(value="id") String id){
        paramService.deleteParamItem(id);

        return HttpStatus.OK;
    }

	@RequestMapping(value="item",method=RequestMethod.POST)
    @ResponseBody
    public HttpStatus createItem(@RequestBody ParamItem item){
		paramService.createItem(item);

        return HttpStatus.OK;
    }
	
	@RequestMapping(value="item/{id}",method=RequestMethod.PUT)
    @ResponseBody
    public HttpStatus createItem(@PathVariable() String id, @RequestBody ParamItem item){
		item.setId(id);
		paramService.updateItem(item);

        return HttpStatus.OK;
    }
	
    @RequestMapping(value="category/{categoryId}/list", method=RequestMethod.GET)
    @ResponseBody
    public List<ParamItem> listItems(@PathVariable(value="categoryId") String categoryId){
        List<ParamItem> items = paramService.findCategoryItems(categoryId);

        return items;
    }
}
