package com.my.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.my.mapper.ProductTypeMapper;
import com.my.pojo.ProductType;
import com.my.pojo.ProductTypeExample;
import com.my.pojo.vo.ProductTypeVo;
import com.my.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ProductTypeServiceImpl")
public class ProductTypeServiceImpl implements ProductTypeService
{
    @Autowired
    private ProductTypeMapper productTypeMapper;


    @Override
    public List<ProductType> getAll()
    {
        return productTypeMapper.selectByExample(new ProductTypeExample());
    }

    @Override
    public PageInfo splitPage(int pageNum, int pageSize) {
        return null;
    }


    @Override
//    新添
    public int save(ProductType productType){
        return productTypeMapper.insert(productType);
    }

    @Override
    public ProductType getById(int id) {
        return productTypeMapper.selectByPrimaryKey(id);
    }

    @Override
//    修改
    public int update(ProductType productType){
        return productTypeMapper.updateByPrimaryKeySelective(productType);
    }

    @Override
//    删除
    public int delete(int typeId){
        return productTypeMapper.deleteByPrimaryKey(typeId);
    }

    @Override
    public int deleteBatch(String[] pids) {
        return 0;
    }

    @Override
    public PageInfo splitPageVo(ProductTypeVo vo, int pageSize) {
        return null;
    }

}
