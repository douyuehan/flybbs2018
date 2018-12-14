package com.neusoft.mapper;

import com.neusoft.domain.UserCommentAgree;

public interface UserCommentAgreeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserCommentAgree record);

    int insertSelective(UserCommentAgree record);

    UserCommentAgree selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserCommentAgree record);

    int updateByPrimaryKey(UserCommentAgree record);
}