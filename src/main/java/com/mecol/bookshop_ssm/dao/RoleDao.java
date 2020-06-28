package com.mecol.bookshop_ssm.dao;

import com.mecol.bookshop_ssm.entity.Role;

import java.util.List;

public interface RoleDao
{
    List<Role> selRoles();
    void delRole(Long roleId);
    Role getRoleById(Long id);
    Role getRoleByRoleName(String roleName);

    void updateByKey(Role role);

    void insertRole(Role role);

    Role selectRoleByRoleName(String roleName);
}
