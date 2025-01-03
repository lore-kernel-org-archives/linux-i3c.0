Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC43E77188
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8m5VLEZ8AmIcUYisIUFoEBk+r4WgrLcZCrtfNwGPANI=; b=Kyufb+/E6ka7UJ
	wZmQPK5YkG0J5OpXDnvr9j9VuL9VcYVmFfZvxnfXfSDCdyp77A+caHsG4S8N4LPIgMskfl5VaOPg7
	3IV2AQ4uo+M1TITTOocNdY+HJjFvqbK6OQs2Fusohm3Um0Yoy1Cq48oEEzvX1WEdQSQCzYmyZtZ75
	7tEfmf8zItrVCam7hpepqzmfGXfLh9tTmzZdTYswOQbdgYmHYLnOGy0eNDHwXARaaopYejYf4RxTH
	l4t/FBNYEvzP1uLbRWMEPiyZkQrLU2k0uzOdE23aJTMHa1rSscEwMnL8a9vu6/3fhRf1WeFw/fvEO
	ttOGsei3TmJHPzQlkAKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD30-0000000F5VI-0iYb;
	Fri, 10 Jan 2025 11:19:26 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTbjS-0000000CIDP-39gF
	for linux-i3c@lists.infradead.org;
	Fri, 03 Jan 2025 07:04:32 +0000
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036uarg007523;
	Thu, 2 Jan 2025 23:04:23 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq4mu4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 02 Jan 2025 23:04:23 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 2 Jan 2025 23:04:22 -0800
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 2 Jan 2025 23:04:20 -0800
From: <jianqi.ren.cn@windriver.com>
To: <stable@vger.kernel.org>
CC: <kxwang23@m.fudan.edu.cn>, <alexandre.belloni@bootlin.com>,
        <patches@lists.linux.dev>, <pgaj@cadence.com>,
        <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <gregkh@linuxfoundation.org>
Subject: [PATCH 6.1.y] i3c: master: cdns: Fix use after free vulnerability in cdns_i3c_master Driver Due to Race Condition
Date: Fri, 3 Jan 2025 15:04:20 +0800
Message-ID: <20250103070420.64714-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=67778bf7 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=7vRtop612t4TABFKEpQA:9 a=d3PnA9EDa4IxuAV0gXij:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MrQQXBkYJNEOx04U5bT8dgVwxB6WF01K
X-Proofpoint-ORIG-GUID: MrQQXBkYJNEOx04U5bT8dgVwxB6WF01K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=789 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_230430_803718_12FBA782 
X-CRM114-Status: GOOD (  11.15  )
X-Mailman-Approved-At: Fri, 10 Jan 2025 03:19:21 -0800
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

From: Kaixin Wang <kxwang23@m.fudan.edu.cn>

[ Upstream commit 609366e7a06d035990df78f1562291c3bf0d4a12 ]

In the cdns_i3c_master_probe function, &master->hj_work is bound with
cdns_i3c_master_hj. And cdns_i3c_master_interrupt can call
cnds_i3c_master_demux_ibis function to start the work.

If we remove the module which will call cdns_i3c_master_remove to
make cleanup, it will free master->base through i3c_master_unregister
while the work mentioned above will be used. The sequence of operations
that may lead to a UAF bug is as follows:

CPU0                                      CPU1

                                     | cdns_i3c_master_hj
cdns_i3c_master_remove               |
i3c_master_unregister(&master->base) |
device_unregister(&master->dev)      |
device_release                       |
//free master->base                  |
                                     | i3c_master_do_daa(&master->base)
                                     | //use master->base

Fix it by ensuring that the work is canceled before proceeding with
the cleanup in cdns_i3c_master_remove.

Signed-off-by: Kaixin Wang <kxwang23@m.fudan.edu.cn>
Link: https://lore.kernel.org/r/20240911153544.848398-1-kxwang23@m.fudan.edu.cn
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index b9cfda6ae9ae..4473c0b1ae2e 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1668,6 +1668,7 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
 	struct cdns_i3c_master *master = platform_get_drvdata(pdev);
 	int ret;
 
+	cancel_work_sync(&master->hj_work);
 	ret = i3c_master_unregister(&master->base);
 	if (ret)
 		return ret;
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
