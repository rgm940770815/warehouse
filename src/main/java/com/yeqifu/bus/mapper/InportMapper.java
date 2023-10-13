package com.yeqifu.bus.mapper;

import com.yeqifu.bus.entity.Inport;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * InnoDB free: 9216 kB; (`providerid`) REFER `warehouse/bus_provider`(`id`); (`goo Mapper 接口
 * </p>
 *
 * @author luoyi-
 * @since 2019-12-18
 */
public interface InportMapper extends BaseMapper<Inport> {

    /**
     * 根据进货单ID累加进货数量（一般在撤回退货时使用）
     * @param inportid 进货单ID
     * @param number 撤回数量
     */
    void updateNumberByid(@Param("inportid") Integer inportid, @Param("number") Integer number);
}
