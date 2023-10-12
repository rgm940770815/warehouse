package com.yeqifu.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.yeqifu.sys.entity.Dept;
import com.yeqifu.sys.mapper.DeptMapper;
import com.yeqifu.sys.mapper.UserMapper;
import com.yeqifu.sys.service.IDeptService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * InnoDB free: 9216 kB 服务实现类
 * </p>
 *
 * @author luoyi-
 * @since 2019-11-26
 */
@Service
@Transactional
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept> implements IDeptService {

    @Resource
    private UserMapper userMapper;

    @Override
    public Dept getById(Serializable id) {
        return super.getById(id);
    }

    @Override
    public boolean update(Dept entity, Wrapper<Dept> updateWrapper){
        return super.update(entity,updateWrapper);
    }

    @Override
    public boolean updateById(Dept entity){
        return super.updateById(entity);
    }

    @Override
    public boolean removeById(Serializable id){
        //查询该部门下是否有用户
        Map userMap = new HashMap();
        userMap.put("deptid",id);
        userMap.put("isdelete",0);
        List list = userMapper.selectByMap(userMap);
        if (list.size()>0){
            throw new RuntimeException("该部门下存在用户，暂时无法删除！");
        }
        return super.removeById(id);
    }

    @Override
    public boolean save(Dept entity) {
        return super.save(entity);
    }


}
