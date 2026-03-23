Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CC7F483C1
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Mar 2026 16:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02C5KvG6NAGEfJnTJB8D61uC7k6hfzUtbbGZGwMbOs8=; b=Y8+gpCixJTee80
	KV4C4FkYYLvo3AH4in8Gxw/aEnu10XYU/q+cvy1Lqa2Pg4vNPXLEHHAXVAg3nxyBmNyIErdNjY++1
	6rHAlsCgc/USFZ6Ej24EVFVQurk4mposP7Ki0+L8/E3G8q3UQ15e11uw/dnxg10ILBYZm+W46CmIK
	6tkPhhOInxufdr28I65VaX+sY97GX167oXxR1WsNphZY6o0AP0YOjd4XMMRpzNc1I5hbAp08CGbJi
	n54DQPbMZgztYzVtwUn+0XeJ066oyJ8bp2Mq3Epvuoje37NhC9SeKfnt4T3EoIiiIjYZrY+PHmEy+
	w01IJNI6G7Zv3jb/Ek+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hsq-0000000H6IO-0JrX;
	Mon, 23 Mar 2026 16:12:04 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hsn-0000000H6GO-19IP
	for linux-i3c@lists.infradead.org;
	Mon, 23 Mar 2026 16:12:02 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NBE4HM4072644;
	Mon, 23 Mar 2026 12:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=4fpDi
	uqkRGna7MMzVmnbYT3i/AqwEU5qiAradGGvOJ4=; b=xdZi6Yk2bOWS3sLpgteu0
	lxWJ6aGuM9F1rSBoZ51so3ef3eAx5bg9ca5VOJdRS1OHZ/dglgUbT9i+2++86syF
	hFfNPhRU/J/+idSNgcQaAjj3yYztdH/JN54Fpehajn9vT94jxR9FfDzW22raAkhi
	ZI4CuWQsIoDkpcE4Rc4+nL7APnMR+qDePYJT1Itq8M65JYuErxnhSdwbHBgE2UNH
	65Ln6wL2Gc4IHAf8Xydi6hXrfFmqegnibfWHFQZfYKVLh3NEJNTsN7HEer7jetay
	iFVn3R5+IgbVJg1VFjuJ149bGA2aXYGWWrJn3BW5h3eAgE3gwjE9Tsn3m7Pxrr6S
	g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4d2pxqbvd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 12:11:51 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62NGBoNf044706
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Mar 2026 12:11:50 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Mon, 23 Mar
 2026 12:11:50 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Mon, 23 Mar 2026 12:11:50 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.69] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62NGBYns019356;
	Mon, 23 Mar 2026 12:11:47 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Mon, 23 Mar 2026 17:11:30 +0100
Subject: [PATCH v3 2/5] i3c: master: Move entdaa error suppression
MIME-Version: 1.0
Message-ID: <20260323-ad4062-positive-error-fix-v3-2-30bdc68004be@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774282294; l=2469;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=ccXa3/KY5qLJj4TgciT2buI5BrqCzsF3ggv3lfciV/U=;
 b=zoTi5Gh9i4O3Wn29I460AgFHWtJ2dqfp79dnPBmgGVR1jTGeaAVCqSrrAZOpUZFlfj4FLdZqa
 rP3uRUYBOtQADmoeatxOXKzUDixgxK7Vn+j4oZa+7EIjF0NBBjFj8e9
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=ALPFdfBd c=1 sm=1 tr=0 ts=69c16647 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=8AirrxEcAAAA:8
 a=QyXUC8HyAAAA:8 a=gAnH3GRIAAAA:8 a=lW4FyyzJGg7ItnWL1goA:9 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: FKsn_9g92PWClqcxxAFE614kZpo-oGGF
X-Proofpoint-GUID: FKsn_9g92PWClqcxxAFE614kZpo-oGGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEyMyBTYWx0ZWRfX7U6odw56nuFO
 xb73x66WvbcdfaYz5jBz4E4a1dMpcuv0+WTr/VCGjDsMQZQJfc2UMEDx3n+NMLTs4WJj++eRb3o
 VVVUwY/Ym9bEocPk154uhbp4SkozoEv8UO0ju1AgKXawGHElRwkJWMOFKYZfLWV1y8yVAYhhhjH
 KdJ0IRW5NkSdb4sQWNyyP4pKNq9clL30vvAnLz3ivHsMYVEZgLiKj0XsSFp2sF0sAr1ClowstPZ
 XlHzd4ErlNwwacJJvLbGwSLg2AEsos9FZT/A6kccx6GuX/KFR9fTnvotcItJzn25w2x4mzGLtKX
 MCpX8IgbotXtGG8MNAG1ppZOQrJXrGlu6GzigOcqFCxcVxMETPkaAbCVGaMZjP6QioWe/e2kWgt
 SRCPcpxSUnwGQ12R09qmdibWnlkyfky02WA3yNQ6AvyBuxfcDocnZDYe5BJnF0pAnRzVQ98QZk4
 Fypg4dPcVP6nztUfG8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091201_315520_53F845A1 
X-CRM114-Status: GOOD (  15.47  )
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

Prepare to fix improper Mx positive error propagation in later commits
by handling Mx error codes where the i3c_ccc_cmd command is allocated.
The CCC ENTDAA is invoked with i3c_master_entdaa_locked() and yields
error I3C_ERROR_M2 if there are no devices active on the bus. Some
controllers may also yield if there are no more devices need an dynamic
address, since the sequence do always end in a NACK. Handle inside
i3c_master_entdaa_locked(), checking cmd->err directly. Both call sites
are updated, adi_i3c_master_do_daa() and cdns_i3c_master_do_daa().

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 drivers/i3c/master.c                 | 4 ++++
 drivers/i3c/master/adi-i3c-master.c  | 3 +--
 drivers/i3c/master/i3c-master-cdns.c | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 7f4630ac8f0bc..1e2c086a24ac2 100644
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
