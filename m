Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609B4C02194
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Feb 2025 14:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ACPG0W0oz8WxCuBCb8Q5ZIaqgQdfxvpAZlT3/r/EkM=; b=wAdzYGfI1dXfVX
	wpebA66q+zAK8K+uH4Gpwq049M5Ial/0TC525jBFEZZJZPnwJxXwi5/OYiFTWmQlxvxrkKba47sgY
	Lc1xu/rI6jvx5b8KRlkk4vBoVQIAz3YXuo82HuY8oRlAzPkLY6vPOO/txTC0iLnZUcJEyMG3zWudV
	M0ziIw2ULYPuh8ZF5WO0Uhk+BgBum/fAJlKEVtCU3OTMh7LlkaSK3x15Y7I3vc+Rl9GrGph2N+b6u
	ZctWbzUWtoFImoAxyZ3t4HKnlZmFdhlp0eZdH4sH1Qdk4AOGKFfaTzd2SXGmX1MJKKR7bp+h7OTRP
	PR9DIvPSQ+SIdE17Oc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgRM-00000003YCM-0aLZ;
	Wed, 05 Feb 2025 14:31:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgRK-00000003YBa-0q28
	for linux-i3c@lists.infradead.org;
	Wed, 05 Feb 2025 14:31:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVYCK025691;
	Wed, 5 Feb 2025 14:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oByTq9zwLSfVLM6kf11yP1nxs2lm8nXB/3U
	SzIcPI9M=; b=jdnwUfo/y39CeWgg53YdX1ek9MoXOQCHmkqaZIHDR748/NsIkeF
	8nnRTx/6EX3xTulz4LayczfVczv7y7nNas28t3H2B7PKOKQyQ1X/TzKu0289T96V
	6W9iAcPev1cWFbgt3CMDZt/FHO4dWigv4qnGP52BfEnFUBzbFE0Dm+X1j+90opi5
	xqyvXZGqx4SK0+bHZ3JPukBP8Mo4nXmFRN0XQ/wzcP2vAdAkTCJUupA9Y0Pge0qC
	TJgoMRmTs/klHGb1ulC5B97r55fXf0N8ySql5qK+/nLzQMbpvczs9ukhqL01FSgf
	ayBNSKcHloAhz/JRqfEWLEZ/w8aoGqngCFA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m9txg00c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 515EVUTw026460;
	Wed, 5 Feb 2025 14:31:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44hcpm8b2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:30 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 515EVUP9026455;
	Wed, 5 Feb 2025 14:31:30 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 515EVT89026454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 14:31:30 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 575AE2439F; Wed,  5 Feb 2025 20:01:29 +0530 (+0530)
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: [PATCH v1 0/3] Add Qualcomm i3c master controller driver support
Date: Wed,  5 Feb 2025 20:01:06 +0530
Message-Id: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 50gHAaifOHbal4BnlRd8gV41hFTtbJBh
X-Proofpoint-GUID: 50gHAaifOHbal4BnlRd8gV41hFTtbJBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=849 clxscore=1015
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502050114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_063142_246220_38E5E65C 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

This patchset adds i3c master support for the qualcomm's QUPV3 based 
Serial engine (SE) controller. 

The I3C SE(Serial Engine) controller implements I3C master functionality
as defined in the MIPI Specifications for I3C, Version 1.0. 

This patchset was tested on Kailua SM8550 MTP device and data transfer
has been tested in I3C SDR mode with i2c and i3c target devices.

Features tested and supported :
  Standard CCC commands.
  I3C SDR mode private transfers in PIO mode.
  I2C transfers in PIO mode.

Mukesh Kumar Savaliya (3):
  dt-bindings: i3c: Add Qualcomm I3C master controller bindings
  i3c: master: Add Qualcomm I3C master controller driver
  MAINTAINERS: Add maintainer for Qualcomm's I3C driver

 .../bindings/i3c/qcom,i3c-master.yaml         |   57 +
 MAINTAINERS                                   |    8 +
 drivers/i3c/master/Kconfig                    |   12 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/qcom-i3c-master.c          | 1190 +++++++++++++++++
 5 files changed, 1268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/qcom,i3c-master.yaml
 create mode 100644 drivers/i3c/master/qcom-i3c-master.c

-- 
2.25.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
