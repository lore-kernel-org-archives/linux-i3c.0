Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A48C3600C
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Mar 2025 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyCZyiEyoFYLv097CoAsP4aRvpMkpulMN0lmleNdbbo=; b=LW69P3jzYu/pLE
	Y0N2C6TLqtSUzxUFjWJ1Cucvf9fTC8k1zR79PGKtux4fno2BTIIi5dKgR9Oe3+WjojHhDY1FoUGTr
	ZnOi91uOuFVwizRRSwUlA/i5DXSNwQgssGa0/hCkLfLA+SXxsapAMO1gD7ZUBeVBjvtR5I2qAktgu
	aAjVTYoV8ZAGEP0ow1xmUvhASxVwVU83nvOenAJJltiwp6vS03mlt6Vxv3lIM9wHGj/TwJIfSL+RX
	apqumnICfdpDda2Jg86HHrPzO8pNBtg7oKHYqUTZG6m8ldKgsS5W8yXBsWODx6PBfF7x3DUyhw6Rm
	YElDaJ0IiNlFutv4AeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRa1-00000008fKl-3Rsw;
	Wed, 26 Mar 2025 14:18:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txRZy-00000008fJK-0jEB
	for linux-i3c@lists.infradead.org;
	Wed, 26 Mar 2025 14:18:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52QA1iTB025349;
	Wed, 26 Mar 2025 14:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g8D1AHueHUr
	cVmkO6f+i5MqKOLRrmZ+jY2jBvdZvW18=; b=QXG5olSVPEREOY01BzffxEjVv23
	NeE0gHDLoUjpsGPNkB14+Q/VEvB8yTo+wLjL8yuby9wMnsXIZYd3qmcsTUmvrvnB
	SH8IZMdVDn3AjOANlLO/WyVST1Q4adKxjLL9bGvVC5fpWaY+G2X7o/zg/JVRvz02
	ji003rNM31uj/SE2XKNecezuq/jm5r9+MI4w08Hlgm5509SfdGkIo48ACiRWIwwh
	YOCMav+Gisxb8eT1GrKECY5ZPkML3Wj0zM5fNZmRnQguKeYpYmY45W1cShlzgMFs
	f1gdKOjpqBgDj03R1hQl9tcklE/JehVBGFsCcfHksbzLIc3FKQQ56IGD4Jw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcgpjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QEHeWj025752;
	Wed, 26 Mar 2025 14:17:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45hp9mdsj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:50 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52QEHoAh025818;
	Wed, 26 Mar 2025 14:17:50 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 52QEHoIh025817
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:17:50 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id A36932343B; Wed, 26 Mar 2025 19:47:49 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v2 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C driver
Date: Wed, 26 Mar 2025 19:46:41 +0530
Message-Id: <20250326141641.3471906-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
References: <20250326141641.3471906-1-quic_msavaliy@quicinc.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e40c92 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=D_kyvCtT9-f2LXH0VCIA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: EAytn2Mv06FP1fxgvtcHaf9Rvl0zRWe1
X-Proofpoint-ORIG-GUID: EAytn2Mv06FP1fxgvtcHaf9Rvl0zRWe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=953 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_071802_331611_25927936 
X-CRM114-Status: GOOD (  10.84  )
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
index 3520ce6f9859..047d804122ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11016,6 +11016,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
 F:	drivers/i3c/master/dw*
 
+I3C DRIVER FOR QUALCOMM GENI CONTROLLER IP
+M:	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
+L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
+F:	drivers/i3c/master/qcom-i3c-master.c
+
 I3C SUBSYSTEM
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
