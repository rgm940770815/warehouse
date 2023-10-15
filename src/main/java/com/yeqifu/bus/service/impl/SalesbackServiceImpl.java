package com.yeqifu.bus.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yeqifu.bus.entity.Goods;
import com.yeqifu.bus.entity.Sales;
import com.yeqifu.bus.entity.Salesback;
import com.yeqifu.bus.exception.CustomException;
import com.yeqifu.bus.mapper.GoodsMapper;
import com.yeqifu.bus.mapper.SalesMapper;
import com.yeqifu.bus.mapper.SalesbackMapper;
import com.yeqifu.bus.service.ISalesbackService;
import com.yeqifu.bus.vo.SalesbackVo;
import com.yeqifu.sys.common.WebUtils;
import com.yeqifu.sys.entity.User;
import com.yeqifu.sys.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Map;

/**
 * <p>
 * InnoDB free: 9216 kB 服务实现类
 * </p>
 *
 * @author luoyi-
 * @since 2019-12-23
 */
@Service
public class SalesbackServiceImpl extends ServiceImpl<SalesbackMapper, Salesback> implements ISalesbackService {

    @Autowired
    private SalesMapper salesMapper;

    @Autowired SalesbackMapper salesbackMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    @Autowired
    private UserMapper userMapper;

    /**
     * @param id    销售单ID
     * @param number    退货数量
     * @param remark    备注
     */
    @Override
    public void addSalesback(Integer id, Integer number, String remark) {
        //1.通过销售单ID查询出销售单信息
        Sales sales = salesMapper.selectById(id);
        //2.根据商品ID查询商品信息
        Goods goods = goodsMapper.selectById(sales.getGoodsid());
        //3.修改商品的数量     商品的数量-退货的数量
        goods.setNumber(goods.getNumber()+number);

        //修改进货的数量
        sales.setNumber(sales.getNumber()-number);
        salesMapper.updateById(sales);

        //4.进行修改
        goodsMapper.updateById(goods);

        //5.添加退货单信息
        Salesback salesback = new Salesback();
        salesback.setGoodsid(sales.getGoodsid());

        salesback.setNumber(number);
        User user = (User) WebUtils.getSession().getAttribute("user");
        salesback.setOperateperson(user.getName());


        salesback.setSalebackprice(sales.getSaleprice());
        salesback.setPaytype(sales.getPaytype());

        salesback.setSalesbacktime(new Date());
        salesback.setRemark(remark);


        salesback.setCustomerid(sales.getCustomerid());
        salesback.setSalesid(id);

        salesback.setUserid(sales.getUserid());
        salesback.setUsername(userMapper.selectById(salesback.getUserid()).getName());


        getBaseMapper().insert(salesback);
    }

    /**
     * 撤回销售退货操作
     * @param id 退货单ID
     */
    @Override
    @Transactional
    public void revocationByid(Integer id) {
        //根据退货单ID查询退货详情
        Salesback salesback = getBaseMapper().selectById(id);
        //根据商品ID获取商品详情
        Goods goods = goodsMapper.selectById(salesback.getGoodsid());
        //因为销售出去的商品撤回退货操作是一个减库存的操作，所以先判断当前库存是否够减
        if(goods.getNumber()<salesback.getNumber()){
            throw new CustomException("当前商品库存不足，请核对库存数据");
        }
        //根据商品ID修改商品库存
        goodsMapper.updateNumberByid(salesback.getGoodsid(),-salesback.getNumber());
        //根据销售单ID修改销售数量
        salesMapper.updateNumberByid(salesback.getSalesid(),salesback.getNumber());
        //根据退货单ID删除退货信息
        getBaseMapper().deleteById(id);

    }



}
