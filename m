Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD2CC54E55
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Mar 2024 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Luc33fXLvI0gMd03C+UFSIhkjosZvQ+2AJMajaOmAyM=; b=ca9cKJK2DZlT30
	M8i3OHWUJhIA4fU7/1lxmQtLCrFppGHAMLlRTvabXDXVONVfaP8C8unqjj9co1vZP7gVN3dGWlCg7
	YwSEGecdYMX1xQj6hO3fSv9fUWg5eejOulBUlvnNrFIrMRrySL6eNAv3qbIOxhLXyhmsILVEiPtEV
	K+18TvI2NAo0iChZo7eDxJFya48/DAgLcAUU0S71UBD5G3muR/pSuT0XE943brv4N2SZg/vFFelZ6
	lM44jklQGfwg8GmnnPBcF1ENKdBeht8ZBdEZevhcQ5AAh3293QwO0c7D0KyIV0NNTuMH0km02mNK9
	7rwDmEiJTMwF1QrDJcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEAo-0000000ATGB-1HTE;
	Mon, 04 Mar 2024 19:40:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGKu-00000008h6U-1rGi
	for linux-i3c@lists.infradead.org;
	Wed, 28 Feb 2024 09:34:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41S5jrJv016379;
	Wed, 28 Feb 2024 09:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=mC1TlTHZ8OiOtXr093yL
	IlnoHBATtQ3OA9nN4jcVblw=; b=g1i/ND/sZO/H2i6FS46xY1bww0ZvGUKstbVl
	volNPgdvfaeQyRA3ztISsnloUuMfRScZXDL69ZYjyXByMau4LqE5MueVqjR0YDeh
	L1KLhSMBsy33wsnMrr/Af1F3GJfe/mB3AmUQdgxkhqsnXSq1Ujt8S2Vp7aBnoJp6
	jSwxWp53PumrX9HdbpQYuXMazuUWstIace17BZEqkMpFgBG2nYmaHa1XwebOOSni
	sUU+w6yv4g5aCw4L7SXSF7HBYGyDyZ6FqwU0VzXy0OK96eFdA6yN7/aHV0Pwwi+p
	uzy1/uGBXAcekIGmCo87G+C6a+UZEcB4QjOrLmtrHLFMTPQmqA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whp65sepy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:34:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 41S9YaQQ018749;
	Wed, 28 Feb 2024 09:34:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3wf9hkux7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:34:36 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41S9YaRR018744;
	Wed, 28 Feb 2024 09:34:36 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41S9YZFH018743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 09:34:36 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 9729524176; Wed, 28 Feb 2024 15:04:34 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, vkoul@kernel.org, manivannan.sadhasivam@linaro.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1] i3c: master: Enable runtime PM for master controller
Date: Wed, 28 Feb 2024 15:04:07 +0530
Message-Id: <20240228093407.4038399-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JLMJw9ph6eLPqoAJlm04ymWsw6_J4r7L
X-Proofpoint-ORIG-GUID: JLMJw9ph6eLPqoAJlm04ymWsw6_J4r7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_04,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_013448_644280_6949699F 
X-CRM114-Status: GOOD (  14.52  )
X-Mailman-Approved-At: Mon, 04 Mar 2024 11:40:27 -0800
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

Enable runtime PM for i3c master node during master registration time.

Sometimes i3c client device driver may want to control the PM of the
parent (master) to perform the transactions and save the power in an
efficient way by controlling the session. Hence device can call PM
APIs by passing the parent node.

Here, I3C target device when calls pm_runtime_get_sync(dev->parent)
couldn't invoke master drivers runtime PM callback registered by
the master driver because parent's PM status was disabled in the
Master node.

Also call pm_runtime_no_callbacks() and pm_suspend_ignore_children()
for the master node to not have any callback addition and ignore the
children to have runtime PM work just locally in the driver. This
should be generic and common change for all i3c devices and should
not have any other impact.

With these changes, I3C client device works and able to invoke
master driver registered runtime PM callbacks.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 drivers/i3c/master.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 3afa530c5e32..a3dc88974f92 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/list.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
@@ -2812,6 +2813,10 @@ int i3c_master_register(struct i3c_master_controller *master,
 
 	i3c_bus_notify(i3cbus, I3C_NOTIFY_BUS_ADD);
 
+	pm_runtime_no_callbacks(&master->dev);
+	pm_suspend_ignore_children(&master->dev, true);
+	pm_runtime_enable(&master->dev);
+
 	/*
 	 * We're done initializing the bus and the controller, we can now
 	 * register I3C devices discovered during the initial DAA.
@@ -2849,6 +2854,7 @@ void i3c_master_unregister(struct i3c_master_controller *master)
 	i3c_master_i2c_adapter_cleanup(master);
 	i3c_master_unregister_i3c_devs(master);
 	i3c_master_bus_cleanup(master);
+	pm_runtime_disable(&master->dev);
 	device_unregister(&master->dev);
 }
 EXPORT_SYMBOL_GPL(i3c_master_unregister);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
