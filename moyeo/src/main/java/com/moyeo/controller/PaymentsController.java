package com.moyeo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.moyeo.service.PaymentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/payment")
@RequiredArgsConstructor
public class PaymentsController {
	private final PaymentService paymentService;
}
