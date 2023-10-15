package com.yeqifu.bus.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yeqifu.bus.entity.Sales;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yeqifu.bus.vo.SalesVo;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * InnoDB free: 9216 kB Mapper 接口
 * </p>
 *
 * @author luoyi-
 * @since 2019-12-21
 */
public interface SalesMapper extends BaseMapper<Sales> {

    /**
     * 根据销售单ID修改销售数量（一般在撤回退货时使用）
     * @param salesid 销售单ID
     * @param number 撤回数量
     */
    void updateNumberByid(@Param("salesid") Integer salesid, @Param("number") Integer number);

    IPage<Sales> getList(Page page, SalesVo salesVo);
}
