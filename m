Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3E0C282EC
	for <linux-i3c@archiver.kernel.org>; Sat,  8 Mar 2025 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/gT7aibN4xdymQqhaLqNsxRmASieZ8fouZ8qd3T+bE0=; b=1wDhEalu2/hd9t
	N/UoQqM2Ghwj+iPm8hQEs2m7/lyHe3RUVuhy9Vxrq+/723ZacIPecZ6GKRN+qwNP2WwUikHmEXAIb
	+1UguQw/8EZJTxw0gjHHcbuxC3YsKZJhg6kTxBHXUGugJ2GMWsGTsDr/Xcz+g4xEGNcRVV9MgVkx3
	jf3h5hidG6zTki22XCk5hb5eGuKlwiCWXg0+dVnzilmYR/WS5isMCSpQjazOWgxL25Exg2iVZxXh5
	kW5IUHjjpL/ilvSLvc7IGFdEtkl5XBccQpPl/DM2F+noq03UfIPUJavd6+g+CaoDww7qZC+XtJwZv
	BcfdIF2g6r/myc4/zd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqsAt-0000000GXfy-0TLB;
	Sat, 08 Mar 2025 11:16:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqsAq-0000000GXfY-3dTm
	for linux-i3c@lists.infradead.org;
	Sat, 08 Mar 2025 11:16:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3913d45a148so315337f8f.3
        for <linux-i3c@lists.infradead.org>; Sat, 08 Mar 2025 03:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741432615; x=1742037415; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=odTe+QCpdgzS7pZYMqfnj3e7lRiCe9qDfEzk0N/TmTU=;
        b=L1ttbGLejA7+nOj15pch0LPLRwb1eYk9gtNOKxJYhg7WMsQE0uco18ME1YvoASoByK
         mdA18oSThPQ1gh4zmRAuKCPOapJCV1umebwV6tJgIFt4SCQ6S7yZWWLpHswMU586xxpq
         Wy/KXKv24kLhqDv1ahLs5pCGpwtQmS2Xe78LOapy9YfkoMkrd6TESgVEpfHdKRUbp/XB
         UreZJMbUebpXpXvTS1xa4yaSuChlwYwgt0D/dzW5ghHjBPJzjiSEjBaanX3OUl9US9RP
         5i3mAtNMPAZw1UG97saVNDWqdvHPRT58VWvnZ50duk2nNspymou9oDZAb4KLuso2G7Nm
         UXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741432615; x=1742037415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odTe+QCpdgzS7pZYMqfnj3e7lRiCe9qDfEzk0N/TmTU=;
        b=Y8eDP3QlB+LhA3jkRFTq8UL35EpEPaTquX0Q8uVIOxTsll37rtkdd6FUlUWBqvuzL7
         CNx7m2npCVsU3J19R9ORf3BEPcqRzaNM2+lAiZJcw6CJFRDNQjp7O59hY88tbPXRw+LM
         ifVqwi7eD+BcTOtOOTUHOSi3ZYyr6lpMiI5irvfrYno4LfRUdPwmN2KpTnPK4vKEqujq
         pQO9oGuGv0RPD8sROcy101VeI6bfKrT+bObOlG6z0yLCtAttJeuPFytSM7ZtzHwpveAe
         gtRL5HtxphewecYYZ3l1cn5mfOn0d3s6REK4Y+LAeuvWhIsIr6DzdFvkj3Dqq/qSf5aP
         XIZQ==
X-Gm-Message-State: AOJu0YyGkjRC2OuBzqD9Cjt8r883QdFJHYaHky6TGPb4R6G5fMZV5Ojr
	3NztCBkT9NUEV4YeFFMsBssk7udSSR++WQR5kHQF648AdIO8/gvRhsYryoCj9/E=
X-Gm-Gg: ASbGncskyrx7nfTVuGHX5PWPy5vMODFaBUfiyTlWbSY3OKpXQ9U8F3mkym51yX75e0E
	jY31DTOtHDL2mejbYSPI2zkJKPbt/V7ZvO/Ih7JwU42dRvFrLIHuoaIq0k1sOC/ROauobq6iJHT
	bJ7iBUWQDgbNp+SVFmdqFUTWWPuOWuLpyDN5p3oEWhHZFHK14hKILJNZ7UkiYL/OcoQlB6epMOF
	+RgB24gHS2Mkmnf8zy6Snm4UZ0KA3+cx7N9XzN1TzP2QyPZp7tqnPkoa2c/iQuLGcW6LDvj/17c
	Od+9Edrs1K72hyE9pfZiMs8c9t7y/bgcC+AghpiFBgqPMnKvgQ==
X-Google-Smtp-Source: AGHT+IES9A/DM5q9+xpQ/azO1/CCZOZDGbLMXDiSNwMFzi323GWfkzfORaMdcK4cgfYh0S+U1GwP6g==
X-Received: by 2002:a05:6000:188d:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-3913d129dffmr1275139f8f.21.1741432614998;
        Sat, 08 Mar 2025 03:16:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfb799fsm8396239f8f.2.2025.03.08.03.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 03:16:54 -0800 (PST)
Date: Sat, 8 Mar 2025 14:16:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stanley Chu <yschu@nuvoton.com>
Cc: linux-i3c@lists.infradead.org, imx@lists.linux.dev
Subject: [bug report] i3c: master: svc: Fix npcm845 FIFO empty issue
Message-ID: <029e5ac0-5444-4a8e-bca4-cec55950d2b9@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_031656_918342_B9A6BA11 
X-CRM114-Status: GOOD (  15.38  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hello Stanley Chu,

Commit 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty
issue") from Mar 6, 2025 (linux-next), leads to the following Smatch
static checker warning:

drivers/i3c/master/svc-i3c-master.c:1002 svc_i3c_master_do_daa_locked() warn: error code type promoted to positive: 'dyn_addr'
drivers/i3c/master/svc-i3c-master.c:1085 svc_i3c_master_do_daa_locked() error: uninitialized symbol 'dyn_addr'.

drivers/i3c/master/svc-i3c-master.c
   939  static int svc_i3c_master_do_daa_locked(struct svc_i3c_master *master,
   940                                          u8 *addrs, unsigned int *count)
   941  {
   942          u64 prov_id[SVC_I3C_MAX_DEVS] = {}, nacking_prov_id = 0;
   943          unsigned int dev_nb = 0, last_addr = 0, dyn_addr;
   944          u32 reg;
   945          int ret, i;
   946  
   947          svc_i3c_master_flush_fifo(master);
   948  
   949          while (true) {
   950                  /* clean SVC_I3C_MINT_IBIWON w1c bits */
   951                  writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
   952  
   953                  /* SVC_I3C_MCTRL_REQUEST_PROC_DAA have two mode, ENTER DAA or PROCESS DAA.
   954                   *
   955                   * ENTER DAA:
   956                   *   1 will issue START, 7E, ENTDAA, and then emits 7E/R to process first target.
   957                   *   2 Stops just before the new Dynamic Address (DA) is to be emitted.
   958                   *
   959                   * PROCESS DAA:
   960                   *   1 The DA is written using MWDATAB or ADDR bits 6:0.
   961                   *   2 ProcessDAA is requested again to write the new address, and then starts the
   962                   *     next (START, 7E, ENTDAA)  unless marked to STOP; an MSTATUS indicating NACK
   963                   *     means DA was not accepted (e.g. parity error). If PROCESSDAA is NACKed on the
   964                   *     7E/R, which means no more Slaves need a DA, then a COMPLETE will be signaled
   965                   *     (along with DONE), and a STOP issued automatically.
   966                   */
   967                  writel(SVC_I3C_MCTRL_REQUEST_PROC_DAA |
   968                         SVC_I3C_MCTRL_TYPE_I3C |
   969                         SVC_I3C_MCTRL_IBIRESP_NACK |
   970                         SVC_I3C_MCTRL_DIR(SVC_I3C_MCTRL_DIR_WRITE),
   971                         master->regs + SVC_I3C_MCTRL);
   972  
   973                  /*
   974                   * Either one slave will send its ID, or the assignment process
   975                   * is done.
   976                   */
   977                  ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
   978                                                  reg,
   979                                                  SVC_I3C_MSTATUS_RXPEND(reg) |
   980                                                  SVC_I3C_MSTATUS_MCTRLDONE(reg),
   981                                                  1, 1000);
   982                  if (ret)
   983                          break;
   984  
   985                  if (SVC_I3C_MSTATUS_RXPEND(reg)) {
   986                          u8 data[6];
   987  
   988                          /*
   989                           * One slave sends its ID to request for address assignment,
   990                           * prefilling the dynamic address can reduce SCL clock stalls
   991                           * and also fix the SVC_I3C_QUIRK_FIFO_EMPTY quirk.
   992                           *
   993                           * Ideally, prefilling before the processDAA command is better.
   994                           * However, it requires an additional check to write the dyn_addr
   995                           * at the right time because the driver needs to write the processDAA
   996                           * command twice for one assignment.
   997                           * Prefilling here is safe and efficient because the FIFO starts
   998                           * filling within a few hundred nanoseconds, which is significantly
   999                           * faster compared to the 64 SCL clock cycles.
  1000                           */
  1001                          dyn_addr = i3c_master_get_free_addr(&master->base, last_addr + 1);
  1002                          if (dyn_addr < 0)
  1003                                  return -ENOSPC;

dyn_addr is unsigned so it can't be negative.  Also why return -ENOSPC
instead of propagating the error code?


  1004  
  1005                          writel(dyn_addr, master->regs + SVC_I3C_MWDATAB);
  1006  
  1007                          /*
  1008                           * We only care about the 48-bit provisioned ID yet to
  1009                           * be sure a device does not nack an address twice.
  1010                           * Otherwise, we would just need to flush the RX FIFO.
  1011                           */
  1012                          ret = svc_i3c_master_readb(master, data, 6);
  1013                          if (ret)
  1014                                  break;
  1015  
  1016                          for (i = 0; i < 6; i++)
  1017                                  prov_id[dev_nb] |= (u64)(data[i]) << (8 * (5 - i));
  1018  
  1019                          /* We do not care about the BCR and DCR yet */
  1020                          ret = svc_i3c_master_readb(master, data, 2);
  1021                          if (ret)
  1022                                  break;
  1023                  } else if (SVC_I3C_MSTATUS_IBIWON(reg)) {
  1024                          ret = svc_i3c_master_handle_ibi_won(master, reg);
  1025                          if (ret)
  1026                                  break;
  1027                          continue;
  1028                  } else if (SVC_I3C_MSTATUS_MCTRLDONE(reg)) {
  1029                          if (SVC_I3C_MSTATUS_STATE_IDLE(reg) &&
  1030                              SVC_I3C_MSTATUS_COMPLETE(reg)) {
  1031                                  /*
  1032                                   * All devices received and acked they dynamic
  1033                                   * address, this is the natural end of the DAA
  1034                                   * procedure.
  1035                                   *
  1036                                   * Hardware will auto emit STOP at this case.
  1037                                   */
  1038                                  *count = dev_nb;
  1039                                  return 0;
  1040  
  1041                          } else if (SVC_I3C_MSTATUS_NACKED(reg)) {
  1042                                  /* No I3C devices attached */
  1043                                  if (dev_nb == 0) {
  1044                                          /*
  1045                                           * Hardware can't treat first NACK for ENTAA as normal
  1046                                           * COMPLETE. So need manual emit STOP.
  1047                                           */
  1048                                          ret = 0;
  1049                                          *count = 0;
  1050                                          break;
  1051                                  }
  1052  
  1053                                  /*
  1054                                   * A slave device nacked the address, this is
  1055                                   * allowed only once, DAA will be stopped and
  1056                                   * then resumed. The same device is supposed to
  1057                                   * answer again immediately and shall ack the
  1058                                   * address this time.
  1059                                   */
  1060                                  if (prov_id[dev_nb] == nacking_prov_id) {
  1061                                          ret = -EIO;
  1062                                          break;
  1063                                  }
  1064  
  1065                                  dev_nb--;
  1066                                  nacking_prov_id = prov_id[dev_nb];
  1067                                  svc_i3c_master_emit_stop(master);
  1068  
  1069                                  continue;
  1070                          } else {
  1071                                  break;
  1072                          }
  1073                  }

There isn't an else statement here.  dyn_addr could be uninitialized on
else.

  1074  
  1075                  /* Wait for the slave to be ready to receive its address */
  1076                  ret = readl_poll_timeout_atomic(master->regs + SVC_I3C_MSTATUS,
  1077                                                  reg,
  1078                                                  SVC_I3C_MSTATUS_MCTRLDONE(reg) &&
  1079                                                  SVC_I3C_MSTATUS_STATE_DAA(reg) &&
  1080                                                  SVC_I3C_MSTATUS_BETWEEN(reg),
  1081                                                  0, 1000);
  1082                  if (ret)
  1083                          break;
  1084  
  1085                  addrs[dev_nb] = dyn_addr;
                                        ^^^^^^^^

  1086                  dev_dbg(master->dev, "DAA: device %d assigned to 0x%02x\n",
  1086                  dev_dbg(master->dev, "DAA: device %d assigned to 0x%02x\n",
  1087                          dev_nb, addrs[dev_nb]);
  1088                  last_addr = addrs[dev_nb++];
  1089          }
  1090  
  1091          /* Need manual issue STOP except for Complete condition */
  1092          svc_i3c_master_emit_stop(master);
  1093          svc_i3c_master_flush_fifo(master);
  1094  
  1095          return ret;
  1096  }

regards,
dan carpenter

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
