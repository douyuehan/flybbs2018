package com.neusoft.mapper;

import com.neusoft.domain.PageInfo;
import com.neusoft.domain.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByEmail(String email);
    User selectByEmailAndPass(User user);
    User selectByNickname(String nickname);
    int getTotalCounts();
    List<User> getPagedUser(PageInfo pageInfo);

    List<Map<String,Object>> getTopUsers();

    User selectByActiveCode(String activecode);
}