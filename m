Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5998EF483C1
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyDRYwKRg6Tk9TAOV2pQYU3tEIlRKlRNlB2GDj9V/R0=; b=oqYYnXUqAu25G0
	VQJXSby/N6P2o6jnZtIsv7+KmsgWJ2Qwx25PFhhaR3aXAxELvLMIehguA1OP1xh50IWfnBQtGycvS
	dOIBSeq1H7t50DeFg2K36Ztnru5mZpHQ7dHIQandAVe0WsYrnF1YNp4XV/lqE3uWONSPZ8I2Me9Ol
	LD83uc3kHJFJpj5sDuRfCOCYv0lsoUbyQqGLgyFONtxcRTTVVb7zfjaa2uPBd5PgNIX8uPD6IQaXO
	2cENsggHK2BvrMuvEQpzM3vPIkvoS55ruEUoU1Wl/phkzGsnxm80hQHjo9IpD0JO+rtgEeEzHk4Ds
	N03dejIaLYALMSvV79cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hst-0000000H6L6-3HOq;
	Mon, 23 Mar 2026 16:12:07 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hss-0000000H6Jk-0Uek
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 16:12:07 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NG6xV6662623;
	Mon, 23 Mar 2026 12:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=gS8SR
	Pt9po2WvkI6r9W/I+1n1wFwW/teqZZo+DBfx40=; b=aBGmjGmELkYUHk1c3RsL8
	buVE3L33LG2JHMTjHCMfrNU3oliPPprSPHm2W4pA0D7XBsAbBPdn49sKBK3T7X+A
	lGPKExwsbvB/rMaZxQJN5XSNwov9e1eqcjjf4F3EpihQO/uXLiv5DXJtQmQNe7T6
	aukPGyJFjtWOj2sReEihaygpFHQjUj6Ilhn/xR0ISXmmSTLrxZZbTnxDdanui9z4
	Rj7LigDbLhedk/8cmwv/ul+thBU5iZYa8QMKufV8F9d0TqqAMZY6bfrBL7ka8HZg
	uFdQUxQfJXgQpoJAgeo/pW4WnKBvsDz5u+hTeKFzRXxjYGU4cq+cIE6iGTYkWsHF
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4d1n620cth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 12:11:55 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62NGBshg044718
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Mar 2026 12:11:54 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 23 Mar
 2026 12:11:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 23 Mar 2026 12:11:54 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.69] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62NGBYnv019356;
	Mon, 23 Mar 2026 12:11:50 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Mon, 23 Mar 2026 17:11:33 +0100
Subject: [PATCH v3 5/5] i3c: master: adi: Fix error propagation for CCCs
MIME-Version: 1.0
Message-ID: <20260323-ad4062-positive-error-fix-v3-5-30bdc68004be@analog.com>
References: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
In-Reply-To: <20260323-ad4062-positive-error-fix-v3-0-30bdc68004be@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>,
        Adrian Hunter
	<adrian.hunter@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774282294; l=1192;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=T44G3FpeQ67jXTuEpd994gu+9XxEQ/csi9RRiDp+9ec=;
 b=sPUo/LjRI/7lVjEBiR92N1/HJWLZYG5WhigxO7y0R2A1xCl3SYsFSFsxn4Fhu6cO+aeckjj/4
 DmDb+lQ1FpVD6yeU6yit6ILwuJuZRR8h6wrWR9+QiAQRHf2aJvn27aX
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMyBTYWx0ZWRfX1m56SYJ0g3AO
 9BqF1sw9d8v1x5Y1PDB25ms2HJ1OAOzAkCGO+DSPhmAWmI35OYBe/Lm9+tHhI1FuiRCIC85nmJ9
 ED1UYYEEAtidlF2GrjD3g2k09wAul4NnOi5Op44EXg/8Hf5iWCynYdmWFuiy2t+OGaLvQK25l4U
 4OU427xWkPsDFszUgUwMQ3eIzEMm2/1gmIR5nRV19Mgg1ylQfgVt2dnKHMFxJeU41AyMA9W74Qf
 TIj9mejOPMtpOtvCs6PCtzBZkSN4rJQn2TAEpkbV6V/nz/xLw6ZwXUcrX1T5y54PrQ+X2d6I0a3
 GsWH8ll60YmywVUdapSr7vgmByZUHC73yLTyAGm169AAXMAEWsjkpwxovkmdB3UM5kk/GQl124y
 VtsIR9gfpz2DWukH8BupJDkGh43IlPpMBgEI57N/+ldn8f6XpMBHv40LNjDGXaMy15bQGOuU1b7
 pDxMEjP6tKrikbtwT+A==
X-Proofpoint-ORIG-GUID: J4SqcB_nIMRGWSgms5JlVnCaSukrpaRK
X-Proofpoint-GUID: J4SqcB_nIMRGWSgms5JlVnCaSukrpaRK
X-Authority-Analysis: v=2.4 cv=D59K6/Rj c=1 sm=1 tr=0 ts=69c1664b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=QyXUC8HyAAAA:8
 a=8AirrxEcAAAA:8 a=gAnH3GRIAAAA:8 a=VNPTIpmBBdLJ-BnbUa8A:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091206_168452_92A59A4C 
X-CRM114-Status: GOOD (  12.42  )
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

adi_i3c_master_send_ccc_cmd() always returned 0, ignoring the transfer
result populated in the completion path. As a consequence, CCC command
errors were silently dropped, including the default -ETIMEDOUT and
later overwritten by adi_i3c_master_end_xfer_locked().

Fix this by returning xfer->ret so that callers correctly receive any
transfer error codes.

Fixes: a79ac2cdc91d ("i3c: master: Add driver for Analog Devices I3C Controller IP")
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master/adi-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index fb9a488304469..047081c9f0643 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -361,7 +361,7 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 
 	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
 
-	return 0;
+	return xfer->ret;
 }
 
 static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
