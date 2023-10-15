package com.yeqifu.bus.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yeqifu.bus.entity.Salesback;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yeqifu.bus.vo.SalesbackVo;

import java.util.Map;

/**
 * <p>
 * InnoDB free: 9216 kB 服务类
 * </p>
 *
 * @author luoyi-
 * @since 2019-12-23
 */
public interface ISalesbackService extends IService<Salesback> {

    /**
     * 对商品销售进行退货处理
     * @param id    销售单ID
     * @param number    退货数量
     * @param remark    备注
     */
    void addSalesback(Integer id, Integer number, String remark);

    /**
     * 撤回销售退货信息操作
     * @param id 退货单ID
     */
    void revocationByid(Integer id);

}
