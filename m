Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552D3C7115B
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Jun 2025 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYh8E3lYba7jvpWriu3YwXZ1p2CXx9NwrzzwSuFOJyI=; b=xrMaUBGv+/qWXG
	LoJfaj+8n1axRfI+pQX4TChpTqtJhmaJnQwtnk6FgFXHp8YEIVCPezODWMJvrM4uq2YJfZNYV1Aex
	F2lLbXZ2Gs3ThDvoVlrXVVJXn0/73UNyxRlikqkZdzAEEhDDfmw6rhHDXyEMvp1t4b7m4yURoPcij
	4jJbKkVoSBzp2pN0KB1iDDv6v4WRWXs3LV1LEGLgQFWUaMAcdBmHot4ZcoEsKR7CIhgg55x0GfDOe
	wY+Zw/AwRlNTSuCMcv2gnVVx4e7wSZI9UYT1xfk/gI++bVNJEn4W3KUYRe1HNcHc9Tc4JmfuwWq64
	bCGfX6I4Br3lDZXjM1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSftn-0000000GIHG-0RnX;
	Fri, 20 Jun 2025 17:51:35 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSffj-0000000GFqt-3cdS
	for linux-i3c@lists.infradead.org;
	Fri, 20 Jun 2025 17:37:04 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEeA4m025086;
	Fri, 20 Jun 2025 13:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=LFhHY
	4/QVtIa0kQIgs/Sgv+DYjNYIL6mAP1r7dJR0Rw=; b=RfUgABe+9IpWGGGmhZMao
	0OVvYG6tXvPU7O/xX50yJy2b+fNshgx3/H6zCyUrU6R5/taKlVSTcrhmBXahZlLc
	PVlPqvvHdp/me073w4F+Cq7RUrKdQBDsi7Un+BPk3RCEUgmgOd0SdlIZcRRWOUkr
	jibX1t10/zxrBFDCOOnYKvMHOjPhDitXFm/fayMPC65b3kMgZbSC3HJ+bwNGB0Z2
	pifLaocR0uCguVP3brT8NlT3Ji9ja+j8N25DCTpxa0wRNq6s0xPWyrWyfaEnywpR
	oqo2oBuybepRrVqH3Kd8lpTGFGot4U1/vXM6NKWbJqaI5C59loij3np23zqFvwXz
	Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47d350auvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 13:37:00 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55KHaxTG008660
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jun 2025 13:36:59 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 20 Jun 2025 13:36:59 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 20 Jun 2025 13:36:59 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Jun 2025 13:36:59 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55KHajbK030665;
	Fri, 20 Jun 2025 13:36:49 -0400
From: Jorge Marques <jorge.marques@analog.com>
Date: Fri, 20 Jun 2025 18:54:59 +0200
Subject: [PATCH 1/3] i3c: master: Add inline i3c_master_readsl and
 i3c_master_writesl
MIME-Version: 1.0
Message-ID: <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
In-Reply-To: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Jorge
 Marques" <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750438498; l=1842;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=PS5s/QBW43OvzQxcKYQhEXkr0Batot5Uxg2zA/CNRwU=;
 b=mEAEkZYVoburTPfWo12Tpjwgh0p1lOuw69ATrEK+H/3fePr3tg5OSfgLxOt3CF5AQKhWw1Zqc
 O7gDLrOq6CjBifIWM/+Z6pEfrXJTl8bn3GJBmyvxKYvHcGXlmNxeHfj
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=WJB/XmsR c=1 sm=1 tr=0 ts=68559c3c cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gAnH3GRIAAAA:8 a=QMVJh2PuZ69kPaAn0y8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMyBTYWx0ZWRfX4DPtIMrfW8Ih
 ybiw3lJtKnsPrM/DQ/LkX8RUzRmSDkBnnlVlFqOrPIAeuN44382zmsYIPZ6OL7Ky3h6yvY/d3iQ
 9ekbfZPk9dXThwWNxhXJU9Nq0zIrhd4OFhhtB3mTL3o4bgF2HsdFBj0M6cqdoKXKrUKYHTGVlG8
 JkOprhkzDG5NyvcgLy+Y+U5Pj1tWJjSczq+lVcd4Y1caLWAXR83qxntE55GzLCP8JmBYu5UYni1
 N87WF+eVkEnY+/MIpcBaZrJOmTt0k0qtaqV2qZov1ZnPWGaishx94HPWHZTHOicVNGoFGvVim+H
 dS5rrizNL6z61lZ8jLTbs/0Ew6429Znn9fiJN76o9Vy9JzWcpDSeszVBWEGw5rVF2drj5NuvcvU
 EyBE3dVIyjpO7Y8geoiVDyZduM7w70XVzAqkHTVbP9iXszyOsvC9Knu1lmZMIcvGX0YlFRe4
X-Proofpoint-ORIG-GUID: QjVbuyybouWu7aZyG29c2_lSPx1DZvCu
X-Proofpoint-GUID: QjVbuyybouWu7aZyG29c2_lSPx1DZvCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 mlxlogscore=720 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_103703_915051_B224BC0F 
X-CRM114-Status: GOOD (  13.81  )
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

The i3c abstraction excepts u8 buffers, but some controllers have a bus
width of 32-bits and don't support flagging valid bytes, so it is
required to read/write long words and to use memcpy on the remainder of
the number of bytes by 32-bits to not write/read outside the buffer
bounds.

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
 include/linux/i3c/master.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index c67922ece617d6320c0c7e4838c2e7edda8c19f5..11401f2acb42e4d3a60df33b7c794d8a0360cdc2 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -674,6 +674,42 @@ i3c_master_get_bus(struct i3c_master_controller *master)
 	return &master->bus;
 }
 
+/**
+ * i3c_master_writesl- Write bytes to long memory region from byte array
+ * @addr: Register to write to
+ * @bytes: Pointer to the data bytes to write
+ * @nbytes: Number of bytes to write
+ */
+static inline void i3c_master_writesl(void __iomem *addr, const u8 *bytes,
+				      int nbytes)
+{
+writesl(addr, bytes, nbytes / 4);
+	if (nbytes & 3) {
+		u32 tmp = 0;
+
+		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
+		writel(tmp, addr);
+	}
+}
+
+/**
+ * i3c_master_readsl - Read bytes from long memory region to byte array
+ * @addr: Register to read from
+ * @bytes: Pointer to the buffer to store read bytes
+ * @nbytes: Number of bytes to read
+ */
+static inline void i3c_master_readsl(const void __iomem *addr, u8 *bytes,
+				     int nbytes)
+{
+readsl(addr, bytes, nbytes / 4);
+	if (nbytes & 3) {
+		u32 tmp;
+
+		tmp = readl(addr);
+		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
+	}
+}
+
 struct i3c_generic_ibi_pool;
 
 struct i3c_generic_ibi_pool *

-- 
2.49.0



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
