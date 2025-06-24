Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB38C7EE31
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Jun 2025 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xgd7ShQ02wbB5/OL1XO6vcac++l6L0a0zg+VAXl0jv8=; b=2ocMZo5PCciB6v
	25CgKxPm5Kl06pFx7STJLdi++T0c9gg58T+WNqsm+YFxpCTzTYng49F/qE8ypUywAIedNcPTAbw8k
	VmQb0nYbImKje5DLXRUGX6PiuBWnEgv/sOafKdWurp53sXkJRFTkLnELak+YCl5Gqn+Dqma7/YdLe
	2Q9VI2v8DIPb13zjF/QpJ+YKRS+Xvjd+3UG0vMAREQ9VKjIGfT3c6EE8HJ3blVYxohsCXIgAejnTY
	42lL18gFQjQsltUZ+1dS8fbOnKuqO9jHAp5h+pD9t7Ry0wP3HjDCyO69zaoCmO/YgnBSd49OaTSNp
	gDKESp7+xy2pWlVEX/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzfF-000000058Rt-3xuw;
	Tue, 24 Jun 2025 09:10:01 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzcg-000000057vL-07RQ
	for linux-i3c@lists.infradead.org;
	Tue, 24 Jun 2025 09:07:24 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O78SQF017397;
	Tue, 24 Jun 2025 05:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=vcme0alBbzcUwfQS2d8BTbLcixl
	FSRr9ITNPRZlnPHY=; b=a62NCJWAMsgfcBCoEitweuLjP4P/KO1FMnQ08jFU8An
	UvPqasy8uxiKFb8fy16ec0awIPK6ciGXgyMxb6B7H4Jmw9SK3wvld5UVzvqXG1yb
	6xa0oXMx6Qp4G+Ey/u8CAcnYtXolKRgD/8YMQlP7g/Cl8ToZmmoYylAIFhfyBV85
	tp8pRGzNlMDHP7YvLkNfipa+xo9j32KU/8Bp+N0lugOGRUlGDwJAGoZMw9yEo9Po
	bD9CIxPRhmYx82ycjNPZ+kdsHA0joQ4wQtPA7Cf0DvTbfzOp+2nJ2mm139zT/Ig8
	lRJzHCHvCA3WRy0SIGkcQMdsMAP2ZHvHIbv0eDW7ClA==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47f43a6fyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 05:07:17 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55O97Gk7012609
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Jun 2025 05:07:16 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 24 Jun
 2025 05:07:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 24 Jun 2025 05:07:16 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.44.3.55] (may be forged))
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55O973an007498;
	Tue, 24 Jun 2025 05:07:05 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH v3 0/3] Add helper methods i3c_writel_fifo() and
 i3c_readl_fifo()
Date: Tue, 24 Jun 2025 11:06:03 +0200
Message-ID: <20250624-i3c-writesl-readsl-v3-0-63ccf0870f01@analog.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHtqWmgC/6WOQQrCMBBFr1KyNpJM2iCuvId0EZNJO1AbSUpUS
 u9uWly4EDeuhvfh/T8zSxgJEztWM4uYKVEYC6hdxWxvxg45ucIMBDRCg+CkLL9HmjANPKJx5SA
 clG5UfdG6YUW8RfT02ErPbeGe0hTic9vIsKY/67LkgqMwRloha+f9yYxmCN3ehuta/3bhqwvFB
 eOdqtFqJfSnu/6S5X/77bIsLyHyb8U1AQAA
X-Change-ID: 20250620-i3c-writesl-readsl-e2836534b665
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jorge
 Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750756023; l=1882;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=sYgFmiwaIhVHwxtrK7josZebbNM9Yb+Z6uYTUURKkio=;
 b=Vm3oRrhkMYynEz43Zx4xGfvcqFrNjWY56+kWwFxkpfGczQb88m+L+QVrvBr0tZLA7Egxl23Ue
 qq0aKv0r89ZCK1DlLE/1g+JUXQXDJLxIxLFWGPFyhrnFxfGgpf581uN
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NyBTYWx0ZWRfX2S4CK9vnF+XF
 SVgviLCc/wZwawvSvS+byRoI+dNUx2m8dnXqvCOpXJEul5FC6YJQVEMYkegGPvL2u/irXz55HdX
 pw2QKaIZYzxwDvgHaMjBndlodFU+KGkS33RtRqA6D3cHmX1zrOtZRcNJ+ON+7l8UbGo2DrzD0/E
 zxVjGLUKsXZKpux9JC9M6lClG6L1jK1JmIhH8VxBNW3TP/CYkytZTbC4JV5NibuOAS8TxGyCMCi
 tjV2+bO3vpUbcfdtzAgoSNpvl+WD6PM61s3VM5M9M2S+RYIC31EphQfi7lqIOCQFVKW7oaZhBs7
 8tkjRHBTYddEQTrMuDojBMGKSbZ/PCPQPa8aK4g5Ah1LIK4Itgx4si2xdz/t7qli4Cq3Dq0Dg4W
 vWuHZP2ECcP2tdFcq/m4X5htHRosJTG1Dmmq11lRR656oRIkvMC3SDi0YRac1eaDoCHbJMLN
X-Authority-Analysis: v=2.4 cv=PuGTbxM3 c=1 sm=1 tr=0 ts=685a6ac5 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=jJBdLOADNryxc0H0sU4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: pokr7qYinqbZ1JMD7kRHEBlBJYI1lSdK
X-Proofpoint-GUID: pokr7qYinqbZ1JMD7kRHEBlBJYI1lSdK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=582
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_020722_110579_C65CC222 
X-CRM114-Status: UNSURE (   9.24  )
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

The I3C abstraction expects u8 buffers, but some controllers operate with
a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
reading or writing outside the buffer bounds, use 32-bit accesses where
possible and apply memcpy for any remaining bytes.

Add two auxiliary methods to include/linux/i3c/master.h and use in the dw
and cdns i3c controller drivers. The adi and renesas controller drivers
will also use these methods.

Related thread: https://lore.kernel.org/linux-i3c/aFNziEj7j31xy%2FmY@lizhi-Precision-Tower-5810/

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Changes in v3:
- Update i3c_writel_fifo/i3c_readl_fifo documentation
- Rename bytes to buffer
- Update cdns, dw commit messages
- Link to v2: https://lore.kernel.org/r/20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com

Changes in v2:
- Rename to i3c_readl_fifo() and i3c_writel_fifo()
- Change type u8 *bytes to void *bytes
- Move methods to internals.h
- Reword commit messages to include new names and ().
- Fixup dw read fifo address (master -> master->reg)
- Link to v1: https://lore.kernel.org/r/20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com

---
Jorge Marques (3):
      i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()
      i3c: master: cdns: Use i3c_writel_fifo() and i3c_readl_fifo()
      i3c: master: dw: Use i3c_writel_fifo() and i3c_readl_fifo()

 drivers/i3c/internals.h              | 37 ++++++++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c   | 25 ++++--------------------
 drivers/i3c/master/i3c-master-cdns.c | 25 +++++-------------------
 3 files changed, 46 insertions(+), 41 deletions(-)
---
base-commit: 51963783b876a2f493a3eac0ea9eba271cb6809a
change-id: 20250620-i3c-writesl-readsl-e2836534b665

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
