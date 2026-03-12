Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA609106ACD0
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9AjuAKQxkbWef3YUNa0QqfANJ9HoMIhjRkqkwc7zvP4=; b=fvBHn/zX0WxCgo
	aePwPso+U3e62/47FTmgpH/gOWmmfkO0g1BUog/X3q+SEkUyTyhRayjItAO/ckGZ+Lw8aeO1tniGf
	c3ucVaN3zhZlsAP9dv5mpA3/BbMHnQmXX2t3y9vmtGHefvnvWzSvjpQeAzJ7M39utz2KOaVLpO7bU
	Ii/3o3qdtRPQzcd9AJ1SflsWqvL/U1ACGNGgTFBkiJpco7RKxgZTC9sQqX1zrh7OpWJlzO9h5p7V7
	/4LAuRgAeqkig6wZgLS4ua6pYDEDtOcFnrowRxX9hDT1Dk8fa8AmxR+kPGa31caDH/mal/Jh2DOTQ
	JGvK+GdAH5Opax577tZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3c-0000000Eak8-2lL8;
	Thu, 12 Mar 2026 16:38:44 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3Y-0000000EaeL-0Zpq
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 16:38:42 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CGGOUs030689;
	Thu, 12 Mar 2026 12:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=y+BT6
	TAuklgJXAUP/fDRc1GEidKMvj7bQXggoi5xqto=; b=w+iugGLsLce04v5JO5xQn
	JHeYvQZhPjATzFgO1AnwkIKzpVJPFFD7uMGjVNO3PmpmoGrdF5ne2GlGm3901ZIZ
	cizvnAWzRaPVvp22WlQ4Dw5C22ZAXRvWqR2WVUQPrN/vpM2GkfTnNtvNFDKmWka4
	68UUZZYc9d3mXHx3iJkUjKyT2P+ZtiNnY7VoTb61LtAWhqc2ylv9gAwcKp+jkCy3
	hV4wDlk3Ssoj0Pq47JUj+ji46LY8S92nUifk81UHV1g+4S4nYleQ8EDXnLpdS+k/
	HVWVnmOyeFuTWVF6ojzuzdi29sQuGCO9SdnG0HrsCKQR/ekSt94uUvemqX/d++lA
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4cuh763ehd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 12:38:26 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62CGcPxV009188
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Mar 2026 12:38:25 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 12 Mar
 2026 12:38:25 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 12 Mar 2026 12:38:25 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.82] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62CGc8GZ021063;
	Thu, 12 Mar 2026 12:38:19 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Thu, 12 Mar 2026 17:38:05 +0100
Subject: [PATCH v2 2/5] i3c: master: Move entdaa error suppression
MIME-Version: 1.0
Message-ID: <20260312-ad4062-positive-error-fix-v2-2-1c933b5c7ed8@analog.com>
References: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
In-Reply-To: <20260312-ad4062-positive-error-fix-v2-0-1c933b5c7ed8@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Dan
 Carpenter <dan.carpenter@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773333488; l=2374;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=hG2W/aFtJxekjzsBKdzkHHLs+V6Bq3L3amu7nbgetjg=;
 b=mASspbZmJfa283vsiPI97kggqxqBC7pLF/qoiWfXtKp/gG+cfKb0sHjhQxZXPPLz7yYHnaanT
 HXsDavPr/mCALSXpQSWbLiUIReXlUednEM6X60dkh+6db8Ni5SCa+0l
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: VwMxFwmhvvQP9WLznFsvgFqdy8GmAt0y
X-Authority-Analysis: v=2.4 cv=AI0/m/Lt c=1 sm=1 tr=0 ts=69b2ec02 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=lW4FyyzJGg7ItnWL1goA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VwMxFwmhvvQP9WLznFsvgFqdy8GmAt0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzNCBTYWx0ZWRfX8XEjzBe5/wyF
 Gn+mRRH/QJAvLxcxSz7KBDB9jUFV0KHQVdGv7AWbmIbfEFYqAe/wWarQVwY4hORQ+Df3D9wpKP2
 Z8djefGnaQf/gTzsu//6D0O+vWFqiJZ98rxLnTAqi5q0Uq0dgJrg5n7zlxF0Vy7Fd3TxMK1GvWb
 0/J4oCGW5bjdhpzG2SLTrI7FA2wIW3dMuT3CIJbo/R3s7nLfUqvCzi9/ethqQeC7DkU2B/xwIdY
 bN69lZKi7Vq8TYmmoNmpQOKFY/tXs3O8/gQgK+neKlXjAUc7+s8iLv5+gTVyX0WB7Dp5PJlxgc1
 3BFQSHX651tmswzWx9lEeMHgDffB//cUB7Iv2UoDQpgI0AHEfKR/cfCYOWxXtEORAbGme7f7aiC
 L0WEh1HiUML7gfnpTZI4pFwZnsJMvbXH/Yd8FzWzocmqDh1xLKoOfZlZezOSsbvP4qBnEZo5Hoa
 qPum82xymHrvygBaXQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093840_819059_74F63498 
X-CRM114-Status: GOOD (  15.12  )
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

Prepares to fix improper Mx positive error propagation in later commits
by handling Mx error codes where the i3c_ccc_cmd command is allocated.
The CCC ENTDAA is invoked with i3c_master_entdaa_locked() and yields
error I3C_ERROR_M2 if there are no devices active on the bus. Some
controllers may also yield if there are no more devices need an dynamic
address, since the sequence do always end in a NACK. Handle inside
i3c_master_entdaa_locked(), checking cmd->err directly. Both call sites
are updated, adi_i3c_master_do_daa() and cdns_i3c_master_do_daa().

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c                 | 4 ++++
 drivers/i3c/master/adi-i3c-master.c  | 3 +--
 drivers/i3c/master/i3c-master-cdns.c | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index c66f2655eb404..d4f9e7df4adc5 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1050,6 +1050,10 @@ int i3c_master_entdaa_locked(struct i3c_master_controller *master)
 	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
 	i3c_ccc_cmd_dest_cleanup(&dest);
 
+	/* No active devices need an address. */
+	if (ret && cmd.err == I3C_ERROR_M2)
+		ret = 0;
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(i3c_master_entdaa_locked);
diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 6616f751075ae..fb9a488304469 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -655,8 +655,7 @@ static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
 
 	writel(irq_mask, master->regs + REG_IRQ_MASK);
 
-	/* DAA always finishes with CE2_ERROR or NACK_RESP */
-	if (ret && ret != I3C_ERROR_M2)
+	if (ret)
 		return ret;
 
 	/* Add I3C devices discovered */
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index b78aebf6b2ca4..5cfec6761494d 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1143,7 +1143,7 @@ static int cdns_i3c_master_do_daa(struct i3c_master_controller *m)
 	}
 
 	ret = i3c_master_entdaa_locked(&master->base);
-	if (ret && ret != I3C_ERROR_M2)
+	if (ret)
 		return ret;
 
 	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;

-- 
2.51.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
