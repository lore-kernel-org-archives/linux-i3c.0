Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255C3106ACCB
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 16:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVeQxlse4zJSHrltWJNEMxlH9m+pHXj4IQ5WgQmbtoI=; b=XzWbXYqnRk1VmR
	tdOogddTsVGvuPEhCtAooB/1p6QNWMid5wjHO2ZsYpLrZqgcb0hD+PBp6DK381eWxj0N0203duwEZ
	C8Ny3KhT/ikGI30sgjswgP5fI1h/lFcxeD4wi0lsdpHU76T2xRis2rkErmwf8cuS2BgJHIqA8LRht
	SmgLnqIyJexPpM1cOknWSxquuO3N0PZ2mo3cZBIYAUKcRsnGJ/HIZboWIZF1mG3Fam4LmBXqZOV8u
	9bZUNqbHO6BaYPlF1wR/vMS6ShzrRYuLf5AJoA6GZZIsVSGT3ugzdEqN9+7kyCmaYV6CJgWsB8TWS
	glzFHFQ4/lXRIgipInsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3e-0000000EanM-3V5K;
	Thu, 12 Mar 2026 16:38:46 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0j3Z-0000000EahI-2qdp
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 16:38:45 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CGUQNm3650902;
	Thu, 12 Mar 2026 12:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=9BAzV
	jlyOIht2AO3dGsg7xUVnZURb2lN/HKsxfjg3cY=; b=qmnzVjtFVkD50KLt61K+i
	OT+PwzaXlL4LhXDftUlNhcx/PekpvnUPCXMo3afUt2qWYvCmwOnbQllrjyzUgy20
	Pgywg3Z+34y7HJ8s/zWPJvshVNP34322dG9duzk3LhAxbMQQk/EBcADHrEHekAKL
	XdlR5c//vOW3RZY9MqhM/i2ofP1z45mfK4UX3NONQ2ZTKNOPTPFE5QWmvdcjjPjx
	ayLrARDKFMD+lGzkmsJwaa08YgMrh405TQ8aVeO3gA1QEYt8Nzi4e9eLFvjBGX4W
	Mcrpq50ZCoQNbsSeyOjjKZeOWtTpAYTqhw4ZXIBR8GSD2kXBm775/LHNQZpzStSj
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4cuh6bbhtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Mar 2026 12:38:29 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 62CGcSGf009200
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Mar 2026 12:38:28 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Thu, 12 Mar
 2026 12:38:27 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Thu, 12 Mar 2026 12:38:27 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.82] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 62CGc8Gc021063;
	Thu, 12 Mar 2026 12:38:22 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Thu, 12 Mar 2026 17:38:08 +0100
Subject: [PATCH v2 5/5] i3c: master: adi: Fix error propagation for CCCs
MIME-Version: 1.0
Message-ID: <20260312-ad4062-positive-error-fix-v2-5-1c933b5c7ed8@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773333488; l=1096;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=qEFyTt1s5nJZMUCvr3Lag+e/OgjP4gX0IckUJ4wTtR0=;
 b=8+oDOltklseTgRmNd/iTQ53Wp/iKwe9BINooYOg0NAIhPyPOk6Yc1SsReo+npBL/E5cdTTzp6
 58jyMJFml4rDzHXwnDQgvXPRdwBtDYHgoFCm0Jpldsyzp0uToQ2UD73
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: upVA2Nl15sm7Dr9DFm547bemW83Ul9GC
X-Authority-Analysis: v=2.4 cv=c6amgB9l c=1 sm=1 tr=0 ts=69b2ec05 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=xdR8xYJEzGsg0H7vZJUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: upVA2Nl15sm7Dr9DFm547bemW83Ul9GC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEzNCBTYWx0ZWRfX96NXpV8U8M/6
 F+eWJT+Q7TdH4KNghUmWdNq9WXdVh03WkfY7o6h8moQYHkp9Nz5aT0Rh2/r3W1IiTIIIeCoOpQX
 DelQtl01ciaIgmP+x/Zdc6E5v/Iw4zQE9AzeUU867rveeXRRMOWJIkuu2gyBMpsDpsWWM12Es8V
 1bmaCHGYg1IUXwl9BML57V7WMDxi3zZsSCCfiExav+WubX+FJXex2yKCVMeb6M4HhppiL52VoqC
 4oMz91cTiKPrME2QIt7ihYBBNki8kcGKW/vTM5GrvlkuumUWWUyR5IVmGdWUwC7bZfpn1anHhyd
 b6bk6DQjeZCs/PUiOnB1e6V5Y+LaCxNwzIIpU4a/giOBBNnlL0O+m6yukSrpMb2DfSlC/eIma9B
 9FhdH1sSi7OMRT0kGumt+fjnFR3wiCRykPUqs62Cq3PR/p2zsuX0hw796wOtdHlxkmjUn1fiUfo
 fayRfZ1HDLWxPyguMKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_093841_739506_B74E537B 
X-CRM114-Status: GOOD (  12.52  )
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
