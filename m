Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D289DC3600C
	for <linux-i3c@archiver.kernel.org>; Thu,  3 Apr 2025 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcvG50fdhCV3FKl+rkK4TC0hRNOv488TrGHzrY/4eoM=; b=MZ10MjEw7rbWxy
	ZvTlpETOvE3Q5gXt85NPdbaaKR+LlQ8ZaV6FPczjsTFyBS5QG/SAGcCJFUjiOusdCF4X4mRy0YzyI
	esRbG9GfCE4/Xxq6AkgqFJ8+wDbxrt8ZVlUJLG0UzqPrK8orl5b0Hf1Gb9lo6AbdRx/pr0SFtAedV
	8ZlzQRqH88DAEXuWKL1BSFTbGps+07OEhXDdUjgXCCQ4JzmmxTav/i7bfsyeBu0yCDMn990yCr0pd
	9GRK3WFUoKSVPy9QYZSVAKgZCAaNXfIQNeTTSkV+1qXxS1wxxUdDHvREwB61tm+zG+AmifvlI01i8
	64e0qUHwElyXQ0SF4hYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Kul-00000008xaj-2Rez;
	Thu, 03 Apr 2025 13:47:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Kui-00000008xZT-1Cly
	for linux-i3c@lists.infradead.org;
	Thu, 03 Apr 2025 13:47:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533A4UFv017256;
	Thu, 3 Apr 2025 13:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=c63I/ycZ6NN
	qzoA9+qUGPU56vP2DlXK6DQqWrFBcBJc=; b=RLzyNwW3MHvazjLUej/Ux4dNtsH
	oASXhX292l1ImUdrM7/u0PR79JmZ8jJS8zvw0A9kf0bhtNdeqfserTWSUit4/cyD
	jU7GUJ6uQug28T/qA2rOPdP/NPAJpa9zDglpxbsaoGcBTPAcC7oYYhjDGtNJejFI
	SmjmZN4s38f//QhBhiV0o6Ruxbs2cf7QXrxb+CfA7kVuUcwRc7jo+Eja77hotDXV
	fHUUPOFA8up0yot7HaeVz+oRADSovlhOP+gJEo3kly2xKhwGvI0X+XPKNJmHjZLd
	89ndtTnq0lRBDh8g8lRi+uXrhLpvbyo50skuE/Mvsd2qVDGQhrWxgh2XYDg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45sr8q0jsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 13:47:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 533Dkv2l020647;
	Thu, 3 Apr 2025 13:46:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45p9xmx9mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 13:46:57 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 533DkvUV020639;
	Thu, 3 Apr 2025 13:46:57 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 533DkuYe020636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 13:46:57 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 1B5332484F; Thu,  3 Apr 2025 19:16:56 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v3 3/3] MAINTAINERS: Add maintainer for Qualcomm's I3C controller driver
Date: Thu,  3 Apr 2025 19:16:44 +0530
Message-Id: <20250403134644.3935983-4-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BJSx5JxyEqfYKIYdAgbIwQYSJKTicp5-
X-Authority-Analysis: v=2.4 cv=Iu4ecK/g c=1 sm=1 tr=0 ts=67ee9154 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=8AirrxEcAAAA:8
 a=cn7IUS33xWvMNiiCnpYA:9 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22 a=d3PnA9EDa4IxuAV0gXij:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: BJSx5JxyEqfYKIYdAgbIwQYSJKTicp5-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_06,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_064724_474784_0944E7B2 
X-CRM114-Status: GOOD (  11.13  )
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
index ce2b64f4568d..a8fcca5d234a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11254,6 +11254,14 @@ S:	Orphan
 F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
 F:	drivers/i3c/master/dw*
 
+I3C DRIVER FOR QUALCOMM GENI CONTROLLER IP
+M:	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
+L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
+F:	drivers/i3c/master/i3c-qcom-geni.c
+
 I3C SUBSYSTEM
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 R:	Frank Li <Frank.Li@nxp.com>
-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
