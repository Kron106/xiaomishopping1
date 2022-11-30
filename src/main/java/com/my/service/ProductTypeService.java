package com.my.service;

import com.github.pagehelper.PageInfo;
import com.my.pojo.ProductInfo;
import com.my.pojo.ProductType;
import com.my.pojo.vo.ProductTypeVo;
import com.my.pojo.vo.ProductVo;

import java.util.List;

public interface ProductTypeService
{
    //获得所有产品类型
    List<ProductType> getAll();
    // 分页功能实现
    PageInfo splitPage(int pageNum, int pageSize);

    // 添加商品类型功能
    int save(ProductType productType);

    // 根据主键查询商品类型
    ProductType getById(int id);

    // 更新商品类型
    int update(ProductType productType);

    // 删除商品类型
    int delete(int typeId);

    // 删除多个商品类型
    int deleteBatch(String[] pids);

    // 多条件查询分页
    PageInfo splitPageVo(ProductTypeVo vo, int pageSize);
}
