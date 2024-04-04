package com.hana.app.data.dto;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminDto {
    private String id;
    private String pwd;
    private RoleDto role;
}
