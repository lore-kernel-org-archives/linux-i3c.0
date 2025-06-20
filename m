Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8ABC7115C
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Jun 2025 17:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:MIME-Version:Message-ID:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vHUcxjGsDHAwK/Dew0nc8w1b/rGOkwH1xwyi8yqUkCM=; b=jJGtgfeqmrLitZ
	s1NV/a9kiX1ep1mXQYdrpa+aQarfL+27hpC+yCEVgWaf7TBaULgoPnD1NWPf1GuBGlOMIGcFV6hWD
	ztOwjrIDiILriWYqpGYWpka0NqcsHqlNgq08xMyLEpdFvlbbt2krbbX7kDh0hOKj9gMV74uJwxEXZ
	Xpc8edvSmKoH66wHYrZ7KjSGo9xbiuooZnJOviV1YcMc5B46EwNx5X0uNGunv1rrzlZluasORmryw
	D7v1rLrzq9YVmuqSj8GWexlIEN6ylJaugebuCorg8dOASTtn5yu5qHhH8JWIeJAmuEFIc/DzMST0D
	60Kojb2PBz5BWZNQd1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSftm-0000000GIH6-3Psf;
	Fri, 20 Jun 2025 17:51:34 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSffe-0000000GFqE-0y33
	for linux-i3c@lists.infradead.org;
	Fri, 20 Jun 2025 17:36:59 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KE7FfP025047;
	Fri, 20 Jun 2025 13:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=GAd7qOsxjRXtW3vxj8eLbyxX0qL
	FrUQ1eY0AIYF2Gk8=; b=Vj+96s9CEBt5NHi1kHrMfq9Zn4IfrEW5JG2J7lGqBy9
	WfGYLsYHiZqqvDPPQH4cUNl6TcsDKUUyUAdTZr04HVHUDbioHdKyjEVhbfE2Ltmf
	U7YpdaKCHyJibFDewt3V6RBHy9w3erB1V38SyTo8E/JsVTy1+jwTNZNEITcZB0Pk
	A3QfLtxMJyRckBexcErBzleHtPDG3LecKZwumlkELRdD7JQOq5i2IDeeXtZ6B0yR
	oALmOg1sxxfB32AMMU71n/LaAcmji7qSv+M9oEZWPBLleso7UyzwxsFJ2OY471gR
	UTbrlTkizcfQQkskdKB6uoyho8mRbCEqCxZ0PxzJb9g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47d350auud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 13:36:45 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55KHaiGX008648
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jun 2025 13:36:44 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 20 Jun 2025 13:36:44 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 20 Jun 2025 13:36:44 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Jun 2025 13:36:44 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55KHaUGk030654;
	Fri, 20 Jun 2025 13:36:34 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH 0/3] Add helper methods i3c_master_writesl and
 i3c_master_readsl
Date: Fri, 20 Jun 2025 18:54:58 +0200
Message-ID: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGKSVWgC/x2MQQqAIBAAvxJ7TrA1JfpKdCjdaiEs1qgg+nvSa
 ZjDzAOJhClBWzwgdHLiLWapygL8MsSZFIfsgBqtdqgVG68u4YPSqoSGkEHYGGdNPTpnIYe70MT
 3P+369/0A5saivmQAAAA=
X-Change-ID: 20250620-i3c-writesl-readsl-e2836534b665
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Jorge
 Marques" <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750438498; l=1304;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=uelv5JTKscE4VtpyIKD73oWY3yr7rNnU4obvZC7dloA=;
 b=QDku2RakhV02l/YuRSKYAbw4ju/L+0ciDvAmwSPnDXHCNDmClAD771ag8ZX4dqCh03iIq/RtF
 PNYNruvJ4WmBgR++3HxlNwAYV1VKdpGyJqHm/jbOf2ttU6+W7HPyPah
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=WJB/XmsR c=1 sm=1 tr=0 ts=68559c2e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=QMVJh2PuZ69kPaAn0y8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMyBTYWx0ZWRfX1jDIXnBmm4iI
 N87UaJiq59N4ldHcpKhNQ/KT6xnXHrh1l/OSriJ9AUbIuY51ReRwsN+IR6qdZ+47kDWvVL5ZVN/
 wL0beRS/yJQIbM1Im06MwCatZyjWrpmp+UBYohQ3D4Mcn81FkgRvB8njTKQceyp3aJbKmty5Yg/
 KUYJbmC+8cZtTowuy5d+KTRqj5ZfazzuZBjMh75BqS4xDNq8HPZUTJHvGdV82o2u38ppObLFkCy
 iC2Lfx9pc0DgUZ4B+zm2ZZ0n4UJs2NvRTnwURJlpXtKpoNnfvvtEp6F5+zw7vIyZ2zsv4u+UmcV
 hqI9/OeWoR28r0FIJdyKuzurhGafbBZ8sZENv8hbQkb1xE4J6xBB4bBbHloDWem0T5r/C4Lnpf9
 303x7blDoom38AgXg9y3N0hRokPaSwWfH8UxmRLEfhLJbIAJZd/NQzjCkL56iWLDG/AsIjUz
X-Proofpoint-ORIG-GUID: 6uDUG_vaSQSJuKHuDajnGvMVuy5243iq
X-Proofpoint-GUID: 6uDUG_vaSQSJuKHuDajnGvMVuy5243iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 mlxlogscore=622 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_103658_278725_A9253347 
X-CRM114-Status: UNSURE (   9.11  )
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

The i3c abstraction excepts u8 buffers, but some controllers have a bus
width of 32-bits and don't support flagging valid bytes, so it is
required to read/write long words and to use memcpy on the remainder of
the number of bytes by 32-bits to not write/read outside the buffer
bounds.

Add two auxiliary methods to include/linux/i3c/master.h and use in the dw
and cdns i3c controller drivers. The adi controller driver will also use
these methods.

Related thread: https://lore.kernel.org/linux-i3c/aFNziEj7j31xy%2FmY@lizhi-Precision-Tower-5810/

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Jorge Marques (3):
      i3c: master: Add inline i3c_master_readsl and i3c_master_writesl
      i3c: master: cdns: Use i3c_master_writesl and i3c_master_readsl
      i3c: master: dw: Use i3c_master_writesl and i3c_master_readsl

 drivers/i3c/master/dw-i3c-master.c   | 24 +++---------------------
 drivers/i3c/master/i3c-master-cdns.c | 23 +++--------------------
 include/linux/i3c/master.h           | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 41 deletions(-)
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
