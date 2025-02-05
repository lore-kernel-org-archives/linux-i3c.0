Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4BFC02198
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Feb 2025 14:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB6LRZ3KjarQxgrDytOpleFFXeqP2a4xRvuqkN8fj4Q=; b=IBQHTQPQ/EMJUg
	amSB6NSGPTV2excqyL79Y7CSfw8KG0DMWW5k9mdJIhgDjwQ7i/5ozI7yoX0C7jA1dfEMV6bDhNTXD
	0pQC7gW62olnJIYT0XVSAwDm0v2hPffsi60/nngwy0qVSmCIq+9g22XOYc4BfS4xtCuBA8/J3pxqM
	N4MkdaZrwKygFVQRkBv+v/4y6dxLrmvd19qV5xH7o6BGcNa0jCKWkGpsJmimvVjo9Dmfqx2lGpm/R
	Op7+SJYseit7KjkouvX3XESA8B4sMCsV5UvK5bH2gFImknd81ZuSMOWL+vFC2pm9ZefI5buwBZdRp
	cWLK0obokIwc3Kf0U0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgRj-00000003YK0-153E;
	Wed, 05 Feb 2025 14:32:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgRh-00000003YJB-0RqZ
	for linux-i3c@lists.infradead.org;
	Wed, 05 Feb 2025 14:32:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVhvO025803;
	Wed, 5 Feb 2025 14:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Pxz9THixkd8
	MMWy14tVHB4+bN7P7Z9hkWsaKuJO8Q4E=; b=IbSqKxDp77TlbDGs6FQmdhD+TJI
	l8Hng9cmDIZX85uZzZ8VlsjkZWcufUKRYZD08KLOgA+sK/7vR8YXVX2Z4S8aKehf
	ZlUS6OylFX6dygZIq1k8fTgYoQcHSaXg1P4qcpOnNK5i+y1800cGacLRAXGU7xyZ
	EtEZnvzkNsqaBcp8vTSkN/anIaZZxVgys0rIDQscoHF1do7I/9aOsVO1wyOtWbFz
	qCICm4A73cTV7w8+h/iXSECEBjwgJpM2bF12Qnn+7/Utx33UNuKR56GIyqu8Ymho
	zEemoiSMHPUjCshiMFKrSjb1mGXqkmVruoN0hp8DkxlDc1PAQgNSdJCcPfA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m9txg01r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:32:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 515ETXKb024149;
	Wed, 5 Feb 2025 14:31:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44hcpm8b5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:57 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 515EVvjf026671;
	Wed, 5 Feb 2025 14:31:57 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 515EVuFP026669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:57 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 83ADC241AA; Wed,  5 Feb 2025 20:01:56 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C driver
Date: Wed,  5 Feb 2025 20:01:09 +0530
Message-Id: <20250205143109.2955321-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GCPoLZZxjkESdCriMRXAuo0Mx3HF6a5N
X-Proofpoint-GUID: GCPoLZZxjkESdCriMRXAuo0Mx3HF6a5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=883 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_063205_146444_8534C117 
X-CRM114-Status: GOOD (  11.19  )
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

Add a new entry for the I3C QCOM GENI driver to the MAINTAINERS file.
This entry includes the maintainer's name and contact information,
ensuring proper maintainership and communication for the new driver.

Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3520ce6f9859..d343467740b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11011,6 +11011,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i3c/cdns,i3c-master.yaml
 F:	drivers/i3c/master/i3c-master-cdns.c
 
+I3C DRIVER FOR QUALCOMM MASTER CONTROLLER IP
+M:	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
+L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
+F:	drivers/i3c/master/qcom-i3c-master.c
+
 I3C DRIVER FOR SYNOPSYS DESIGNWARE
 S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
