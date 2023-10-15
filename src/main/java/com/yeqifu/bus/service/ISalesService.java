package com.yeqifu.bus.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.yeqifu.bus.entity.Sales;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yeqifu.bus.vo.SalesVo;

/**
 * <p>
 * InnoDB free: 9216 kB 服务类
 * </p>
 *
 * @author luoyi-
 * @since 2019-12-21
 */
public interface ISalesService extends IService<Sales> {

    /**
     * 查询商品销售列表
     * @param salesVo
     * @return
     */
    IPage<Sales> getList(SalesVo salesVo);
}
