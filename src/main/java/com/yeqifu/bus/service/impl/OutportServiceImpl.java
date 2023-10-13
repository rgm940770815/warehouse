package com.yeqifu.bus.service.impl;

import com.yeqifu.bus.entity.Goods;
import com.yeqifu.bus.entity.Inport;
import com.yeqifu.bus.entity.Outport;
import com.yeqifu.bus.exception.CustomException;
import com.yeqifu.bus.mapper.GoodsMapper;
import com.yeqifu.bus.mapper.InportMapper;
import com.yeqifu.bus.mapper.OutportMapper;
import com.yeqifu.bus.service.IOutportService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yeqifu.sys.common.WebUtils;
import com.yeqifu.sys.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * <p>
 * InnoDB free: 9216 kB 服务实现类
 * </p>
 *
 * @author luoyi-
 * @since 2019-12-19
 */
@Service
public class OutportServiceImpl extends ServiceImpl<OutportMapper, Outport> implements IOutportService {

    @Autowired
    private InportMapper inportMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    /**
     * @param id    进货单ID
     * @param number    退货数量
     * @param remark    备注
     */
    @Override
    public void addOutport(Integer id, Integer number, String remark) {
        //1.通过进货单ID查询出进货单信息
        Inport inport = inportMapper.selectById(id);
        //2.根据商品ID查询商品信息
        Goods goods = goodsMapper.selectById(inport.getGoodsid());
        //判断商品库存够不够减
        if(goods.getNumber()<number){
            throw new CustomException("该商品库存不足，请核对库存数据！");
        }
        //3.修改商品的数量     商品的数量-退货的数量
        goods.setNumber(goods.getNumber()-number);

        //修改进货的数量
        inport.setNumber(inport.getNumber()-number);
        inportMapper.updateById(inport);

        //4.进行修改
        goodsMapper.updateById(goods);

        //5.添加退货单信息
        Outport outport = new Outport();
        outport.setGoodsid(inport.getGoodsid());
        outport.setNumber(number);
        User user = (User) WebUtils.getSession().getAttribute("user");
        outport.setOperateperson(user.getName());

        outport.setOutportprice(inport.getInportprice());

        outport.setPaytype(inport.getPaytype());
        outport.setOutputtime(new Date());
        outport.setRemark(remark);
        outport.setProviderid(inport.getProviderid());
        outport.setInportid(id);
        getBaseMapper().insert(outport);
    }

    /**
     * 退货撤回处理
     * @param id 退货单id
     */
    @Override
    @Transactional
    public void revocationByid(Integer id) {
        //根据退货单ID查询退货详情
        Outport outport = getBaseMapper().selectById(id);
        //根据商品ID修改商品库存
        goodsMapper.updateNumberByid(outport.getGoodsid(),outport.getNumber());
        //根据进货单ID修改进货订单数量
        inportMapper.updateNumberByid(outport.getInportid(),outport.getNumber());
        //删除退货记录
        getBaseMapper().deleteById(id);
    }
}
