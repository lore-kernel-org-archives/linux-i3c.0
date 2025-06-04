Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCB4C5B543
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Jun 2025 09:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SrMgI6uW7gwSguo0xIh2OUvaHVDdQsYKwNfMQiC/09s=; b=FcUd+wHR2x8jmM
	fKHNSuTcN/D6R0vqUH1DqfX2fBTlvJF/PonKFFS9PjO5j1FSBVZhW4sxRQVA72ehd4uUKdpXhYtuU
	2OOj143lZ2r1bX5GbiJ+psm6x+mNwAXNCFguh1Aq+3x25jweFvpQuwNFqPWVy4FH9ls/5/XEy4359
	LjgnuFSaNegUENM5IYo90iRxmmaVxLHYvxyJvqj8znJKdKcL8kLGkKuo3+r2Yir4avYtOSi70Nkbl
	qAoWJUlrrpCzt42wuVmKBW6jLqSOjCXNR3IPEoy17YR3LgjVOkutIrixbxgSn6BPNypAWa7QPX9BS
	63sGyWRN/mXbIIwrJEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6h9-0000000F8wA-2l9U;
	Thu, 05 Jun 2025 09:15:31 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqMs-0000000DjhO-2U4Y
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 15:49:31 +0000
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554D6Q50023428;
	Wed, 4 Jun 2025 11:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=gqvAslu0+W4zDZ/S9EiQb6vrEwe
	o7vsyczUj4kc+3Jc=; b=wIzbmFq6/iMbAe4IovKqZOBzFM7F3QxqRotxCc7+0Oa
	PttM+qVrSvBH92heJUSRnVxBIF00Sfa8ejvR3VPQ/yUcf2m+HyyxTPXB5AXI1zON
	3nsVDnD4fhaU/DgIozZZUb5xTOB9C3oWQ3tihiWG+D1uvyVU05SyW/RPBrXv5Cfm
	MOLMqPGZNlWjCTduh62bqAX0DIu3Gzsmba6nTVjKkSAAw0XTRF2Z1avWHlIK1IFR
	mwRWywEEnk1Gjozm9KRlseAV4Esy6v72GqSO0H7Um5vrinK28Aj4kf8+RPBgci7O
	/kxbjh24sbHCsT7MQzJ5M5Kwa5azp4L+UJYdHuCrxXA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 472k2u1w5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 11:49:18 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 554FnH0u039301
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Jun 2025 11:49:17 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 4 Jun 2025 11:49:17 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 4 Jun 2025 11:49:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 4 Jun 2025 11:49:17 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.51])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 554Fn5K3003109;
	Wed, 4 Jun 2025 11:49:08 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH 0/2] Add ADI I3C Controller
Date: Wed, 4 Jun 2025 17:48:56 +0200
Message-ID: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOhqQGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwMT3cSUTN1M42Td3MTiktQiXaNEU0MTi2RTi2QTcyWgpoKi1LTMCrC
 B0bG1tQBTDA5QYAAAAA==
X-Change-ID: 20250604-adi-i3c-master-2a5148c58c47
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jorge Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749052145; l=1126;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=vhhKf47KqG9CLznJkMhmlMXu58zLzVz7VvXyLhONGz8=;
 b=9P83OD6xgp4adz+K/0eFSLadmPKclk9TLhzw1VCYW49YrWsCt9ffojNeAw7M9hHSXFfXvRRdL
 H7bw+qbwuYBBZry/12hi6LiIf93nSTJd1hinZ2hzNLWWqcoQ2D4/9De
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 1dSFb5FUc3d1PfrHpKDBUqlFOBIORX27
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExOSBTYWx0ZWRfX2bpw6Qp8wjEN
 xoMePeKPZOXa2QaMqQ6uhklumG7/3GsKZu+SZZFG2ekP2zlbFHgF3p05Jl6nbw24qvAo8Eot/Fk
 i8U3S6iygMgLLiHHu2rLu3xeqya0q5Ssg81ansEOWXXedEBbTWdJJbG04pei26BqOBCdvawQykR
 UzBDfARYYi5HPC5Vq9llY9eibttMySoRdcYoZsnzko/43M4PGps4VWTc3luX1Uj3AVvQnnUAw73
 5AuAG20AB2ZURRtJkJHs9Bj0NN4mu7n8171AOFw0O9dQv+Qm9YNOwVw7LpeqzOX2IcEghD0jZpH
 1yxb/2PUEUh9BNiv0lnXTGc6qYTcdgiITrru+VuuRlhIafLLW024Ka94eve/hJ7uwa9/j8CuvCr
 n2IMYJv5reGcFQBt5CFmVwGU0HXqtzQtr0ng1KNlFQZV1/QFikm7pEjCBjqe+tod5QQUijV3
X-Proofpoint-ORIG-GUID: 1dSFb5FUc3d1PfrHpKDBUqlFOBIORX27
X-Authority-Analysis: v=2.4 cv=Fv4F/3rq c=1 sm=1 tr=0 ts=68406afe cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wI1k2SEZAAAA:8 a=gAnH3GRIAAAA:8
 a=AbWnsF95IPDzd2HxxOMA:9 a=QEXdDO2ut3YA:10 a=6HWbV-4b7c7AdzY24d_u:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=820 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_084930_640391_9FB07796 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 05 Jun 2025 02:14:09 -0700
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

I3C Controller is subset of the I3C-basic specification to interface
peripherals through I3C and I2C. The controller RTL is FPGA
synthesizable and documentation is provided at
https://analogdevicesinc.github.io/hdl/library/i3c_controller

The main target for the I3C Controller IP is low-cost FPGAs.
In this version the driver supports IBI (only the MDB), I3C and I2C
transfers.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Jorge Marques (2):
      dt-bindings: i3c: Add adi-i3c-master
      i3c: master: Add driver for Analog Devices I3C Controller IP

 .../devicetree/bindings/i3c/adi,i3c-master.yaml    |   63 ++
 MAINTAINERS                                        |    6 +
 drivers/i3c/master/Kconfig                         |   11 +
 drivers/i3c/master/Makefile                        |    1 +
 drivers/i3c/master/adi-i3c-master.c                | 1063 ++++++++++++++++++++
 5 files changed, 1144 insertions(+)
---
base-commit: 00286d7d643d3c98e48d9cc3a9f471b37154f462
change-id: 20250604-adi-i3c-master-2a5148c58c47

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
