package com.ssm.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LayUiData {
    private Integer code;
    private String msg;
    private Integer count;
    private List<User> Data;
}
