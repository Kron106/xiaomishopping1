package com.my.controller;

import com.my.pojo.ProductInfo;
import com.my.pojo.ProductType;
import com.my.pojo.vo.ProductVo;
import com.my.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/producttype")
public class ProductTypeController {

    @Autowired
    private ProductTypeService productTypeService;

    // 显示全部信息（不分页）
    @RequestMapping(value = "/getAll.do")
    public String getAll(HttpServletRequest request){
        List<ProductType> list= productTypeService.getAll();
        request.setAttribute("list",list);
        return "producttype";
    }

    //    增添
    @RequestMapping(value="/save.do")
    public String save(HttpServletRequest request, ProductType productType){
        int num=-1;
        try {
            num=productTypeService.save(productType);

        }catch (Exception exception){
            exception.printStackTrace();
        }
        if(num > 0)
        {
            request.setAttribute("msg", "增加成功！");
        }
        else
        {
            request.setAttribute("msg", "增加失败！");
        }
        return "forward:/producttype/getAll.do";
    }


    @RequestMapping(value = "/one.do")
    public String one(HttpSession session, int typeId, Model model)
    {

        ProductType productType=productTypeService.getById(typeId);
        model.addAttribute("productType", productType);
//        System.out.printf("11");
        return "updatetype";
    }
    //    修改
    @RequestMapping(value = "/update.do")
    public String update(HttpServletRequest request,ProductType productType){
        int num=-1;
        try {
            num=productTypeService.update(productType);

        }catch (Exception exception){
            exception.printStackTrace();
        }
        if(num > 0)
        {
            request.setAttribute("msg", "更新成功！");
        }
        else
        {
            request.setAttribute("msg", "更新失敗！");
        }
        return "forward:/producttype/getAll.do";
    }

    //    删除
    @RequestMapping(value = "/delete.do")
    public String delete(HttpServletRequest request,int typeId){
        int num=-1;
        try {
            num=productTypeService.delete(typeId);

        }catch (Exception exception){
            exception.printStackTrace();
        }
        if(num > 0)
        {
            request.setAttribute("msg", "删除成功！");
        }
        else
        {
            request.setAttribute("msg", "删除失败");
        }
        return "forward:/producttype/getAll.do";
    }
}
