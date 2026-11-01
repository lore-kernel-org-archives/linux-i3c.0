Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C520606A31C
	for <linux-i3c@archiver.kernel.org>; Sun,  1 Nov 2026 00:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CbsZhiKt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=Wx0Dx6yd;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=ihuwy2Ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=45PY+SOpFWhlL2pAAyd7eKFSkUdHEkbqdyNw3ZjRNnU=; b=CbsZhiKt1GkbYLiXwuxx6qtcZ3
	WqojDyc0XpjPw8diaczywqgPvItVfCfqvoiGht+k4oHcoul93bDmvFw+18776NcfT+vziOfP2q2HK
	bbauaxNaHIU2HO9r3uCUXuH9HENtNv5Pc9DXFWuD8OMh/9rKMRUlcr73sg/PtibTYnXKMvnPqc7OI
	b4w5itsJhNpFQHQVyDS/CFCL276F3rAhQPIC/PisSOmIwBlO3OMuqvf4rR2brN5Gi7go+lj4KAEe/
	80z3Gj9XTGfFn+ohcWk589J/27CzU9cxJu5aRsqTohKzEdUV6CY/HFtuiZ6oVUPytdAbFbc/4erkb
	dPmyfPew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNJoo-0000000DmXV-3JqI;
	Sun, 01 Nov 2026 00:53:06 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNJol-0000000DmX0-2Dem
	for linux-i3c@lists.infradead.org;
	Sun, 01 Nov 2026 00:53:04 +0000
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A10HbWM4041072;
	Sat, 31 Oct 2026 17:52:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pfptdkimsnps; bh=I/VW0hIY
	yl4/TarqUGGuYkjQQcLgdcefuPFvQyfb5Ow=; b=Wx0Dx6yd71vBcSuF+ssnYZ64
	DQr4Lfq1+TuPZhptkkhjEBDhYZwSp2qphzG8prw9eDcOHkbbZ9DpVpSUaFHuoMBX
	JY9/s+cOF908H8HZ96pHyHt1jRSPKZTTbtWPgt1LhN9WfpdrTnAL1NZ49Y7/uMGg
	e1ZVSIE7W8nySOfLTM2cjbuDKKsqagjDtanf9MvnZYsDhiAIKZv2KTR6KxNbAuAq
	AInREOFA6OmgUNb2WqXui4IcXfuzwec1LYjDvTloeTPSARz9boIjWPaj5Kz2tuJa
	046Er6hXPo2AsUJ2OR9p3chtprtv8MF2fceWXURaUFZT/761EdtOPE2gEOjggw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hnf8ujb6u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 31 Oct 2026 17:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793494372; bh=JJ+tm9BW/dkgc9icICG2+TYbPu47TXoYLdenqgK6v18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ihuwy2Ru8Ab7Azz3ch3ubSxg3WbHqSSusBjfF2MerBkbloSlDNY48D+drdnOM7p47
	 d7qrnhhPxSQPiS2dj0YPCmEoQsluedyxh/uuSYtyosgbYBMnn7Q5iAWbdN4ABaOgY0
	 W0VNPLK4qyNa2LUVy1T9NBuXrFgPNs0xg2YaP/QBH//AM4gPB+Oi3RbwyKudBBkUBz
	 0mqK4Fi+p543f8NzjhNe/9vMO5hitwocq06NjWNxIgFyC9rFPK5sDk9tXT8yHgt3FP
	 K4ijHDxxkeMID4gzLHUK8rbDA6e7LJfbzatyng6rbO5pzpRsXwCy6cLY9JZbZRbHMC
	 s1KuTekUrG3gA==
Received: from mailhost.synopsys.com (eudc-mailhost2.synopsys.com [10.213.161.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B7D6E40158;
	Sun,  1 Nov 2026 00:52:51 +0000 (UTC)
Received: from Ubuntu.internal.synopsys.com (unknown [10.150.8.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 392F2C0EFA;
	Sun,  1 Nov 2026 00:52:48 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: Dineshkumar.Parameswaran@synopsys.com
Cc: Frank.Li@nxp.com, alexandre.belloni@bootlin.com,
        linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
Subject: [PATCH v2] i3c: master: dw-i3c-master: Add HDR-DDR support to Designware Controller.
Date: Sun,  1 Nov 2026 06:22:43 +0530
Message-Id: <20261101005243.4739-1-parame@synopsys.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013073126.5948-1-parame@synopsys.com>
References: <20261013073126.5948-1-parame@synopsys.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: yTTDwN7Xl9OMoISNIJwktHBFtbGlCrFC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAwMyBTYWx0ZWRfX74DK3KdyacFc
 ASqnnVbiJGDjAAaeOPL6fjp4Tx6+nBpe+TAJrRjWZLdYAXjoQHukZZ2OjrA4lIOHRxqYLaEInc4
 WLYsizgeEsEgUgkwbH6ntIRSHn/UEFg=
X-Proofpoint-GUID: yTTDwN7Xl9OMoISNIJwktHBFtbGlCrFC
X-Authority-Analysis: v=2.4 cv=Uvr2pOwB c=1 sm=1 tr=0 ts=6ae68d65 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22 a=jIQo8A4GAAAA:8
 a=6SBVZJJJ0Vs975MvW8gA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAwMyBTYWx0ZWRfX3a0qdxR1N341
 inzI39Sne8YwQQSXaWN8wueKO6K+AcQbfesKiPNh2eIf+RsSuPLFsa1ryvywxVsHILS+dSh9mRK
 dsu6IUXzMjiPpObsVFeR9Ai+D9uSBV1LuUyLVmBmcp5YZ27Mu5V5tHruRU0ahFuJ5f/uwzJoFbd
 IySdDSo3w/kJZL1NtTfEPtDR2cf6sWik50nPHC6bwJWszfUIja3n6s8xIQ01TJ1pxMB7n/lTRbi
 +nf5RgdfKzksN/DPXC0517UYikY2qiOZq92Y2dD3FyRTKKkNc24Xorn8c1FiWZrX9D+NQttiaKr
 0HcYrOcsb/vI/s2vDuMNTmk+Ce1vVMRrMdwQRVQzaWXZTMYZy/tgTm7UJrZI2MOE1RWUR5X7c+8
 N65sqAzWUtwEMVaIsDFf+snxXwcDd+DShO5kUI0HjhvzW8vatuv6oW8KjlvieYpiJ0ZpSQpru9L
 pplGTjsSg1SskRHQQVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611010003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_175303_723611_C1F8371B 
X-CRM114-Status: GOOD (  14.66  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement HDR-DDR transfer support for the DesignWare Controller.
Only support for private transfers and does not support sending CCC
commands in HDR mode.

Key differences:
- Sends ENTHDR CCC for entering to HDR-DDR mode before sending data.
To do that we are setting the ENTHDR in controller cmd. Sets the speed
to HDR_DDR_SPEED(6) to do data transfer in HDR-DDR mode.
- HDR exit pattern must be sent instead of send a stop after transfer
completion.

Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>

---
changes in v2:
- Add HDR-DDR capability advertisement in dw_i3c_master_bus_init()
- ENTHDR0 CCC is generated by the hardware. No need to put that in the
  command.
- Fix the speed field corruption in COMMAND_PORT_SPEED.

 drivers/i3c/master/dw-i3c-master.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 05584ddaf104..149982a05477 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -232,6 +232,8 @@
 #define I3C_BUS_I2C_FMP_TLOW_MIN_NS	500
 #define I3C_BUS_THIGH_MAX_NS		41
 
+#define DW_I3C_HDR_DDR_SPEED	6
+
 #define XFER_TIMEOUT (msecs_to_jiffies(1000))
 #define RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
 
@@ -726,6 +728,8 @@ static int dw_i3c_master_bus_init(struct i3c_master_controller *m)
 	memset(&info, 0, sizeof(info));
 	info.dyn_addr = ret;
 
+	info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
+
 	ret = i3c_master_set_info(&master->base, &info);
 	if (ret)
 		goto rpm_out;
@@ -1003,20 +1007,25 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 		if (i3c_xfers[i].rnw) {
 			cmd->rx_buf = i3c_xfers[i].data.in;
 			cmd->rx_len = i3c_xfers[i].len;
-			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
-				      COMMAND_PORT_SPEED(dev->info.max_read_ds);
+			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER;
 
 		} else {
 			cmd->tx_buf = i3c_xfers[i].data.out;
 			cmd->tx_len = i3c_xfers[i].len;
-			cmd->cmd_lo =
-				COMMAND_PORT_SPEED(dev->info.max_write_ds);
 		}
 
 		cmd->cmd_lo |= COMMAND_PORT_TID(i) |
 			       COMMAND_PORT_DEV_INDEX(data->index) |
 			       COMMAND_PORT_ROC;
 
+		if (mode == I3C_HDR_DDR)
+			cmd->cmd_lo |= COMMAND_PORT_CP |
+				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
+		else
+			cmd->cmd_lo |= (i3c_xfers[i].rnw) ?
+				COMMAND_PORT_SPEED(dev->info.max_read_ds) :
+				COMMAND_PORT_SPEED(dev->info.max_write_ds);
+
 		if (i == (i3c_nxfers - 1))
 			cmd->cmd_lo |= COMMAND_PORT_TOC;
 	}
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
