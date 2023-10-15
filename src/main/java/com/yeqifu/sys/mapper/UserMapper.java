package com.yeqifu.sys.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yeqifu.sys.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yeqifu.sys.vo.UserVo;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * InnoDB free: 9216 kB; (`deptid`) REFER `warehouse/sys_dept`(`id`) ON UPDATE CASC Mapper 接口
 * </p>
 *
 * @author luoyi-
 * @since 2019-11-21
 */
public interface UserMapper extends BaseMapper<User> {


    IPage<User> getList(Page page, UserVo userVo);
}
